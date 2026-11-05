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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_49 [[user(locn5), flat]];
    float4 m_41 [[user(locn6)]];
    float4 m_56 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_39.w;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_39.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_41.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_41.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = 1.0 / _63;
    float _97 = _95 * _69;
    float _99 = _95 * _75;
    float _101 = _95 * _81;
    float _103 = _95 * _87;
    float _105 = 1.0 / _97;
    float _107 = _95 * _93;
    float _109 = _99 * _105;
    float _111 = _101 * _105;
    float2 _495 = float2(_109, _111);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_495, float2(0.0), isnan(_495))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_495, float2(0.0), isnan(_495))).x;
    float2 _506 = float2(_103, _107);
    float4 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_506, float2(0.0), isnan(_506))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_506, float2(0.0), isnan(_506))).xyzw;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _116.z;
    float _124 = _116.w;
    float _126 = in.m_39.z;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_43.w;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_45.x;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _146 = _95 * _130;
    float _148 = _146 * _105;
    float _150 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _152 = fma(_148, (*spvDescriptorSet0.fp_c8)._m0[30].w, _150);
    float _154 = _95 * _136;
    float _156 = 1.0 / _152;
    float _158 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _160 = _156 * _158;
    float _162 = in.m_47.y;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_47.x;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = _95 * _166;
    float _176 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _178 = fma(_113, (*spvDescriptorSet0.fp_c8)._m0[30].w, _176);
    float _180 = 1.0 / _178;
    float _182 = _124 * _154;
    float _184 = 0.0 + _182;
    float _186 = precise::clamp(_184, 0.0, 1.0);
    float _188 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _190 = -_160;
    float _192 = fma(_180, _188, _190);
    float _194 = _192 * _144;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _95 * _142;
    float _200 = _186 * _196;
    float _202 = _200 * _198;
    bool _206 = _202 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _208 = isnan(_202);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _214 = _210 || _212;
    float _216 = _160;
    if (!_214)
    {
        discard_fragment();
    }
    float _218 = _95 * _172;
    float2 _657 = float2(_218, _174);
    float2 _222 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_657, float2(0.0), isnan(_657))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_657, float2(0.0), isnan(_657))).xy;
    float _224 = _222.x;
    float _226 = _222.y;
    float _228 = in.m_49.x;
    float _230 = in.m_47.z;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_47.w;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = _228 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _244 = _95 * _234;
    float _246 = _228 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _248 = _95 * _240;
    float _250 = fma(_242, _224, _244);
    float _252 = fma(_246, _226, _248);
    float2 _708 = float2(_250, _252);
    float3 _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_708, float2(0.0), isnan(_708))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_708, float2(0.0), isnan(_708))).xyz;
    float _258 = _256.x;
    float _260 = _256.y;
    float _262 = _256.z;
    float _264 = in.m_43.x;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_51.x;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = in.m_43.y;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = in.m_51.y;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_43.z;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_51.z;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = _118 * _118;
    float _302 = _120 * _120;
    float _304 = _122 * _122;
    float _306 = _95 * _274;
    float _308 = _95 * _280;
    float _310 = _95 * _286;
    float _312 = _95 * _292;
    float _314 = -_310;
    float _316 = _308 + _314;
    float _318 = fma(_258, _258, _300);
    float _320 = _95 * _268;
    float _322 = _95 * _298;
    float _324 = fma(_260, _260, _302);
    float _326 = fma(_262, _262, _304);
    float _328 = -_306;
    float _330 = _320 + _328;
    float _332 = -_322;
    float _334 = _312 + _332;
    float _336 = fma(_324, _316, _310);
    float _338 = fma(_318, _330, _306);
    float _340 = fma(_326, _334, _322);
    float _342 = _262;
    if (!_214)
    {
        out.m_54.x = _338;
        out.m_54.y = _336;
        out.m_54.z = _340;
        out.m_54.w = _182;
        return out;
    }
    float _344 = _336 * 0.715200006961822509765625;
    float _346 = in.m_56.w;
    float _348 = gl_FragCoord.w;
    float _350 = _346 * _348;
    float _352 = in.m_56.x;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = in.m_56.y;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = fma(_338, 0.2125999927520751953125, _344);
    float _366 = in.m_56.z;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = fma(_340, 0.072200000286102294921875, _364);
    bool _374 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _376 = 1.0 / _372;
    if (_374)
    {
        float _378 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _380 = _160 + _378;
        _216 = _380;
    }
    float _382 = _216;
    if (_374)
    {
        float _384 = _382 * 8.0;
        float _386 = precise::clamp(_384, 0.0, 1.0);
        _342 = _386;
    }
    float _388 = _342;
    float _390 = _376 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _392 = precise::clamp(_390, 0.0, 1.0);
    float _394 = fma(_392, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _396 = _95 * _350;
    float _398 = _95 * _356;
    float _400 = _95 * _362;
    float _402 = _394 * _396;
    float _404 = 0.0 + _202;
    float _406 = precise::clamp(_404, 0.0, 1.0);
    float _408 = _95 * _370;
    float _410 = fma(_338, _402, _398);
    float _412 = _406;
    if (_374)
    {
        float _414 = _406 * _388;
        _412 = _414;
    }
    float _416 = _412;
    float _418 = fma(_336, _402, _400);
    float _420 = fma(_340, _402, _408);
    float _422 = 0.0 + _416;
    float _424 = precise::clamp(_422, 0.0, 1.0);
    out.m_54.x = _410;
    out.m_54.y = _418;
    out.m_54.z = _420;
    out.m_54.w = _424;
    return out;
}

