#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_34 [[id(5)]];
    sampler fp_t_tcb_34Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_34Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_56 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
    float4 m_48 [[user(locn5), flat]];
    float4 m_50 [[user(locn6)]];
    float4 m_44 [[user(locn7)]];
    float4 m_46 [[user(locn8), flat]];
    float4 m_61 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_42.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_42.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_44.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = 1.0 / _70;
    float _98 = _96 * _76;
    float _100 = _96 * _82;
    float _102 = _96 * _88;
    float _104 = _96 * _94;
    float2 _515 = float2(_98, _100);
    float2 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_515, float2(0.0), isnan(_515))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_515, float2(0.0), isnan(_515))).xy;
    float _110 = _108.x;
    float _112 = _108.y;
    float2 _530 = float2(_102, _104);
    float2 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_530, float2(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_530, float2(0.0), isnan(_530))).xy;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = in.m_46.y;
    float _122 = in.m_42.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_42.z;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_48.x;
    float _136 = in.m_50.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_50.y;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = rint(_120);
    float _150 = precise::max(_148, 0.0);
    uint _153 = uint(_150);
    uint _155 = clamp(_153, 0u, 65535u);
    float _157 = _96 * _126;
    float _159 = _96 * _132;
    float _161 = -_112;
    float _163 = _161 + _118;
    float _165 = -_110;
    float _167 = _165 + _116;
    float _169 = fma(_163, 0.100000001490116119384765625, _112);
    float _171 = fma(_167, 0.100000001490116119384765625, _110);
    float _173 = _96 * _140;
    float _175 = fma(_169, _134, _157);
    float _177 = fma(_171, _134, _159);
    float _179 = _96 * _146;
    float2 _623 = float2(_173, _179);
    float4 _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_623, float2(0.0), isnan(_623))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_623, float2(0.0), isnan(_623))).xyzw;
    float _184 = _182.x;
    float _186 = _182.y;
    float _188 = _182.z;
    float _190 = _182.w;
    float3 _643 = float3(_177, _175, float(int(_155)));
    float3 _647 = select(_643, float3(0.0), isnan(_643));
    float4 _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _647.xy, uint(rint(_647.z))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _647.xy, uint(rint(_647.z))).xyzw;
    float _194 = _192.x;
    float _196 = _192.y;
    float _198 = _192.z;
    float _200 = _192.w;
    float _202 = in.m_52.w;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_54.w;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_56.x;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_54.x;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_54.y;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_54.z;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = -_190;
    float _240 = _200 + _238;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = _96 * _206;
    float _246 = _96 * _212;
    float _248 = -_244;
    float _250 = _242 + _248;
    float _252 = _96 * _218;
    float _254 = _246 * _250;
    float _256 = 0.0 + _254;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = _258 * _252;
    bool _264 = _260 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _266 = isnan(_260);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _272 = _268 || _270;
    float _274 = in.m_52.x;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = in.m_52.y;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_52.z;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    if (!_272)
    {
        discard_fragment();
    }
    float _292 = _184 * _184;
    float _294 = _186 * _186;
    float _296 = _188 * _188;
    float _298 = _96 * _236;
    float _300 = -_292;
    float _302 = fma(_194, _194, _300);
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = -_294;
    float _308 = fma(_196, _196, _306);
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = -_296;
    float _314 = fma(_198, _198, _312);
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = _96 * _224;
    float _320 = -_304;
    float _322 = _320 + 1.0;
    float _324 = _96 * _230;
    float _326 = -_310;
    float _328 = _326 + 1.0;
    float _330 = -_316;
    float _332 = _330 + 1.0;
    float _334 = _318 * _322;
    float _336 = _324 * _328;
    float _338 = _298 * _332;
    float _340 = _96 * _278;
    float _342 = _96 * _284;
    float _344 = _96 * _290;
    float _346 = fma(_304, _340, _334);
    float _348 = fma(_310, _342, _336);
    float _350 = fma(_316, _344, _338);
    if (!_272)
    {
        out.m_59.x = _346;
        out.m_59.y = _348;
        out.m_59.z = _350;
        out.m_59.w = _254;
        return out;
    }
    float _352 = _348 * 0.715200006961822509765625;
    float _354 = in.m_61.w;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = in.m_61.z;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = in.m_61.x;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = fma(_346, 0.2125999927520751953125, _352);
    float _374 = in.m_61.y;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = fma(_350, 0.072200000286102294921875, _372);
    bool _382 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _384 = 1.0 / _380;
    float _386 = _384 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _388 = precise::clamp(_386, 0.0, 1.0);
    float _390 = _96 * _358;
    float _392 = fma(_388, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _394 = _96 * _364;
    float _396 = _392 * _390;
    float _398 = 0.0 + _260;
    float _400 = precise::clamp(_398, 0.0, 1.0);
    float _402 = _96 * _370;
    float _404 = _96 * _378;
    float _406 = fma(_350, _396, _394);
    float _408 = fma(_346, _396, _402);
    float _410 = fma(_348, _396, _404);
    float _412 = _394;
    if (!_382)
    {
        _412 = _400;
    }
    float _414 = _412;
    bool _416 = !_382;
    float _418 = _414;
    if (!_416)
    {
        float _420 = in.m_63.w;
        float _422 = gl_FragCoord.w;
        float _424 = _420 * _422;
        float _426 = in.m_63.z;
        float _428 = gl_FragCoord.w;
        float _430 = _426 * _428;
        float _432 = _96 * _424;
        float _434 = _96 * _430;
        float _436 = 1.0 / _432;
        float _438 = _434 * _436;
        float _440 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _442 = fma(_438, (*spvDescriptorSet0.fp_c8)._m0[30].w, _440);
        float _444 = 1.0 / _442;
        float _446 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _448 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _450 = fma(_444, _446, _448);
        float _452 = _450 * 8.0;
        float _454 = precise::clamp(_452, 0.0, 1.0);
        float _456 = _400 * _454;
        _418 = _456;
    }
    float _458 = _418;
    float _460 = 0.0 + _458;
    float _462 = precise::clamp(_460, 0.0, 1.0);
    out.m_59.x = _408;
    out.m_59.y = _410;
    out.m_59.z = _406;
    out.m_59.w = _462;
    return out;
}

