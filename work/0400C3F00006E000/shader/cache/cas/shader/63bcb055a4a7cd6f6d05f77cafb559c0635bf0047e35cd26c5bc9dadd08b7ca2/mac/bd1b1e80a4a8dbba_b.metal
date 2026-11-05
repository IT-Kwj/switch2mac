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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
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
    float4 m_42 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_56 [[user(locn4)]];
    float4 m_50 [[user(locn5), flat]];
    float4 m_46 [[user(locn6)]];
    float4 m_48 [[user(locn7), flat]];
    float4 m_61 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_42.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_42.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_44.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_44.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_44.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_46.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_46.x;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = 1.0 / _68;
    float _114 = _112 * _74;
    float _116 = _112 * _80;
    float _118 = _112 * _86;
    float _120 = _112 * _92;
    float _122 = _112 * _98;
    float _124 = _112 * _104;
    float _126 = _112 * _110;
    float2 _525 = float2(_114, _116);
    float2 _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_525, float2(0.0), isnan(_525))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_525, float2(0.0), isnan(_525))).xy;
    float _132 = _130.x;
    float _134 = _130.y;
    float _136 = 1.0 / _118;
    float _138 = _120 * _136;
    float _140 = _122 * _136;
    float2 _548 = float2(_138, _140);
    float _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_548, float2(0.0), isnan(_548))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_548, float2(0.0), isnan(_548))).x;
    float2 _556 = float2(_126, _124);
    float _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_556, float2(0.0), isnan(_556))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_556, float2(0.0), isnan(_556))).w;
    float _146 = in.m_48.y;
    float _148 = in.m_50.x;
    float _150 = in.m_42.z;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_42.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = rint(_146);
    float _164 = precise::max(_162, 0.0);
    uint _167 = uint(_164);
    uint _169 = clamp(_167, 0u, 65535u);
    float _171 = _148 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _173 = _148 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _175 = _112 * _154;
    float _177 = _112 * _160;
    float _179 = fma(_171, _132, _175);
    float _181 = fma(_173, _134, _177);
    float3 _622 = float3(_179, _181, float(int(_169)));
    float3 _626 = select(_622, float3(0.0), isnan(_622));
    float4 _184 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _626.xy, uint(rint(_626.z))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _626.xy, uint(rint(_626.z))).xyzw;
    float _186 = _184.x;
    float _188 = _184.y;
    float _190 = _184.z;
    float _192 = _184.w;
    float _194 = in.m_44.z;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_52.w;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_54.w;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_56.x;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _220 = _112 * _198;
    float _222 = _112 * _204;
    float _224 = _220 * _136;
    float _226 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _228 = fma(_224, (*spvDescriptorSet0.fp_c8)._m0[30].w, _226);
    float _230 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _232 = fma(_142, (*spvDescriptorSet0.fp_c8)._m0[30].w, _230);
    float _234 = 1.0 / _228;
    float _236 = 1.0 / _232;
    float _238 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _240 = _234 * _238;
    float _242 = _112 * _216;
    float _244 = in.m_54.z;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = _112 * _248;
    float _252 = -_144;
    float _254 = _192 + _252;
    float _256 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _258 = -_240;
    float _260 = fma(_236, _256, _258);
    float _262 = -_222;
    float _264 = _254 + _262;
    float _266 = _112 * _210;
    float _268 = _260 * _218;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = _266 * _264;
    float _274 = 0.0 + _272;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = _276 * _270;
    float _280 = _278 * _242;
    bool _284 = _280 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _286 = isnan(_280);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _292 = _288 || _290;
    float _294 = in.m_54.x;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_52.y;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = in.m_52.x;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_54.y;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_52.z;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    if (!_292)
    {
        discard_fragment();
    }
    float _324 = _112 * _298;
    float _326 = _112 * _304;
    float _328 = _112 * _310;
    float _330 = _112 * _316;
    float _332 = _112 * _322;
    float _334 = -_324;
    float _336 = _328 + _334;
    float _338 = -_330;
    float _340 = _326 + _338;
    float _342 = -_250;
    float _344 = _332 + _342;
    float _346 = _186 * _186;
    float _348 = _188 * _188;
    float _350 = _190 * _190;
    float _352 = fma(_346, _336, _324);
    float _354 = fma(_348, _340, _330);
    float _356 = fma(_350, _344, _250);
    if (!_292)
    {
        out.m_59.x = _352;
        out.m_59.y = _354;
        out.m_59.z = _356;
        out.m_59.w = _272;
        return out;
    }
    float _358 = _354 * 0.715200006961822509765625;
    float _360 = in.m_61.w;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = in.m_61.x;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = in.m_61.y;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = fma(_352, 0.2125999927520751953125, _358);
    float _380 = in.m_61.z;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = fma(_356, 0.072200000286102294921875, _378);
    bool _388 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _390 = 1.0 / _386;
    float _392 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_388)
    {
        float _394 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _396 = _240 + _394;
        _392 = _396;
    }
    float _398 = _392;
    float _400 = _390 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _402 = precise::clamp(_400, 0.0, 1.0);
    float _404 = fma(_402, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _406 = _112 * _364;
    float _408 = _112 * _376;
    float _410 = _404 * _406;
    float _412 = 0.0 + _280;
    float _414 = precise::clamp(_412, 0.0, 1.0);
    float _416 = _406;
    float _418 = _414;
    if (_388)
    {
        float _420 = _398 * 8.0;
        float _422 = precise::clamp(_420, 0.0, 1.0);
        _416 = _422;
    }
    float _424 = _416;
    float _426 = _112 * _370;
    float _428 = _112 * _384;
    float _430 = fma(_354, _410, _408);
    if (_388)
    {
        float _432 = _414 * _424;
        _418 = _432;
    }
    float _434 = _418;
    float _436 = fma(_352, _410, _426);
    float _438 = fma(_356, _410, _428);
    float _440 = 0.0 + _434;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    out.m_59.x = _436;
    out.m_59.y = _430;
    out.m_59.z = _438;
    out.m_59.w = _442;
    return out;
}

