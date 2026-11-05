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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 m_44 [[user(locn5), flat]];
    float4 m_38 [[user(locn6), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _60 = gl_FragCoord.w;
    float _62 = in.m_38.x;
    float _64 = in.m_40.w;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _72 = in.m_40.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_40.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_42.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_42.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = 1.0 / _60;
    float _98 = _62 + 1.0;
    float _100 = _98 * _70;
    float _102 = rint(_62);
    float _104 = precise::max(_102, 0.0);
    uint _107 = uint(_104);
    uint _109 = clamp(_107, 0u, 65535u);
    float _111 = _96 * _68;
    float _113 = floor(_100);
    float _115 = _96 * _76;
    float _117 = _96 * _88;
    float _119 = 1.0 / _111;
    float _121 = -_113;
    float _123 = fma(_121, (*spvDescriptorSet0.fp_c9)._m0[22].x, _98);
    float _125 = _96 * _82;
    float _127 = rint(_123);
    float _129 = precise::max(_127, 0.0);
    uint _131 = uint(_129);
    uint _133 = clamp(_131, 0u, 65535u);
    float _135 = _115 * _119;
    float _137 = _125 * _119;
    float _139 = _96 * _94;
    float2 _521 = float2(_135, _137);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_521, float2(0.0), isnan(_521))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_521, float2(0.0), isnan(_521))).x;
    float3 _535 = float3(_117, _139, float(int(_109)));
    float3 _539 = select(_535, float3(0.0), isnan(_535));
    float4 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _539.xy, uint(rint(_539.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _539.xy, uint(rint(_539.z))).xyzw;
    float _146 = _144.x;
    float _148 = _144.y;
    float _150 = _144.z;
    float _152 = _144.w;
    float3 _556 = float3(_117, _139, float(int(_133)));
    float3 _558 = select(_556, float3(0.0), isnan(_556));
    float4 _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _558.xy, uint(rint(_558.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _558.xy, uint(rint(_558.z))).xyzw;
    float _156 = _154.x;
    float _158 = _154.y;
    float _160 = _154.z;
    float _162 = _154.w;
    float _164 = in.m_44.y;
    float _166 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _168 = in.m_40.z;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_46.w;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = _164 * _166;
    float _182 = _180 * _166;
    float _184 = floor(_182);
    float _186 = _96 * _172;
    float _188 = in.m_48.x;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = _186 * _119;
    float _196 = -_184;
    float _198 = fma(_196, (*spvDescriptorSet0.fp_c9)._m0[22].y, _180);
    float _200 = _198 + 9.9999997473787516355514526367188e-05;
    float _202 = floor(_200);
    float _204 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _206 = fma(_194, (*spvDescriptorSet0.fp_c8)._m0[30].w, _204);
    float _208 = 1.0 / _206;
    float _210 = -_202;
    float _212 = _200 + _210;
    float _214 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _216 = in.m_50.y;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_50.z;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _230 = fma(_141, (*spvDescriptorSet0.fp_c8)._m0[30].w, _228);
    float _232 = 1.0 / _230;
    float _234 = -_152;
    float _236 = _234 + _162;
    float _238 = fma(_212, _236, _152);
    float _240 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _242 = _208 * _240;
    float _244 = _96 * _178;
    float _246 = _238 * _244;
    float _248 = 0.0 + _246;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _254 = -_242;
    float _256 = fma(_232, _252, _254);
    float _258 = _256 * _214;
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = _96 * _192;
    float _264 = _250 * _260;
    float _266 = _264 * _262;
    bool _270 = _266 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _272 = isnan(_266);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _278 = _274 || _276;
    float _280 = in.m_46.x;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_46.y;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = in.m_46.z;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = in.m_50.x;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = _242;
    if (!_278)
    {
        discard_fragment();
    }
    float _306 = -_148;
    float _308 = _306 + _158;
    float _310 = -_146;
    float _312 = _310 + _156;
    float _314 = _96 * _226;
    float _316 = fma(_212, _308, _148);
    float _318 = fma(_212, _312, _146);
    float _320 = _318 * _318;
    float _322 = _96 * _284;
    float _324 = _96 * _290;
    float _326 = -_150;
    float _328 = _326 + _160;
    float _330 = _96 * _296;
    float _332 = _96 * _302;
    float _334 = _96 * _220;
    float _336 = fma(_212, _328, _150);
    float _338 = -_314;
    float _340 = _330 + _338;
    float _342 = -_332;
    float _344 = _322 + _342;
    float _346 = -_334;
    float _348 = _324 + _346;
    float _350 = _316 * _316;
    float _352 = _336 * _336;
    float _354 = fma(_320, _344, _332);
    float _356 = fma(_350, _348, _334);
    float _358 = fma(_352, _340, _314);
    float _360 = _320;
    if (!_278)
    {
        out.m_53.x = _354;
        out.m_53.y = _356;
        out.m_53.z = _358;
        out.m_53.w = _246;
        return out;
    }
    float _362 = _356 * 0.715200006961822509765625;
    float _364 = fma(_354, 0.2125999927520751953125, _362);
    float _366 = fma(_358, 0.072200000286102294921875, _364);
    bool _368 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _370 = 1.0 / _366;
    float _372 = 0.0 + _266;
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = _374;
    if (_368)
    {
        float _378 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _380 = _242 + _378;
        _304 = _380;
    }
    float _382 = _304;
    float _384 = _370 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _386 = precise::clamp(_384, 0.0, 1.0);
    if (_368)
    {
        float _388 = _382 * 8.0;
        float _390 = precise::clamp(_388, 0.0, 1.0);
        _360 = _390;
    }
    float _392 = _360;
    float _394 = fma(_386, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_368)
    {
        float _396 = _374 * _392;
        _376 = _396;
    }
    float _398 = _376;
    float _400 = _354 * _394;
    float _402 = _356 * _394;
    float _404 = _358 * _394;
    float _406 = 0.0 + _398;
    float _408 = precise::clamp(_406, 0.0, 1.0);
    out.m_53.x = _400;
    out.m_53.y = _402;
    out.m_53.z = _404;
    out.m_53.w = _408;
    return out;
}

