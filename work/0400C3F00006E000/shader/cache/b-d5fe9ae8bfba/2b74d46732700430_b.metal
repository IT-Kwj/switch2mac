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
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / _59;
    float _93 = _91 * _65;
    float _95 = _91 * _71;
    float _97 = _91 * _77;
    float _99 = _91 * _83;
    float _101 = _91 * _89;
    float _103 = 1.0 / _93;
    float _105 = _95 * _103;
    float _107 = _97 * _103;
    float2 _516 = float2(_105, _107);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_516, float2(0.0), isnan(_516))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_516, float2(0.0), isnan(_516))).x;
    float2 _527 = float2(_99, _101);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_527, float2(0.0), isnan(_527))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_527, float2(0.0), isnan(_527))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float _122 = in.m_41.y;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_41.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_41.z;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_43.y;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_43.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_43.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_37.z;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _166 = _164 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _168 = 1.0 / _166;
    float _170 = _91 * _126;
    float _172 = _91 * _132;
    float _174 = _91 * _138;
    float _176 = _170 * _170;
    float _178 = fma(_172, _172, _176);
    float _180 = _91 * _144;
    float _182 = fma(_174, _174, _178);
    float _184 = rsqrt(_182);
    float _186 = _170 * _184;
    float _188 = _174 * _184;
    float _190 = _180 * _186;
    float _192 = _91 * _150;
    float _194 = _172 * _184;
    float _196 = _91 * _156;
    float _198 = fma(_192, _194, _190);
    float _200 = fma(_196, _188, _198);
    float _202 = _91 * _162;
    float _204 = in.m_45.w;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = abs(_200);
    float _212 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _214 = _210 + _212;
    float _216 = _202 * _103;
    float _218 = _214 * _168;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _224 = fma(_216, (*spvDescriptorSet0.fp_c8)._m0[30].w, _222);
    float _226 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _228 = fma(_220, -2.0, 3.0);
    float _230 = _220 * _220;
    float _232 = _228 * _230;
    float _234 = 1.0 / _224;
    float _236 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _238 = _234 * _236;
    float _240 = _91 * _208;
    float _242 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _244 = fma(_109, (*spvDescriptorSet0.fp_c8)._m0[30].w, _242);
    float _246 = in.m_47.x;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = 1.0 / _244;
    float _254 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _256 = -_238;
    float _258 = fma(_252, _254, _256);
    float _260 = _120 * _240;
    float _262 = _258 * _226;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = 0.0 + _260;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = _268 * _264;
    float _272 = _270 * _232;
    float _274 = _91 * _250;
    float _276 = _272 * _274;
    bool _280 = _276 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _282 = isnan(_276);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _288 = _284 || _286;
    float _290 = in.m_39.z;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = in.m_39.w;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = _238;
    if (!_288)
    {
        discard_fragment();
    }
    float _304 = _91 * _294;
    float _306 = _91 * _300;
    float2 _807 = float2(_304, _306);
    float3 _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_807, float2(0.0), isnan(_807))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_807, float2(0.0), isnan(_807))).xyz;
    float _312 = _310.x;
    float _314 = _310.y;
    float _316 = _310.z;
    float _318 = in.m_45.x;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = in.m_45.y;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = in.m_45.z;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = in.m_49.x;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_49.y;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = in.m_49.z;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = _114 * _114;
    float _356 = _116 * _116;
    float _358 = _118 * _118;
    float _360 = _91 * _322;
    float _362 = _91 * _328;
    float _364 = _91 * _334;
    float _366 = _91 * _340;
    float _368 = _91 * _346;
    float _370 = _91 * _352;
    float _372 = -_366;
    float _374 = _360 + _372;
    float _376 = -_368;
    float _378 = _362 + _376;
    float _380 = -_370;
    float _382 = _364 + _380;
    float _384 = _356 * _314;
    float _386 = _354 * _312;
    float _388 = _358 * _316;
    float _390 = fma(_384, _378, _368);
    float _392 = fma(_386, _374, _366);
    float _394 = fma(_388, _382, _370);
    if (!_288)
    {
        out.m_52.x = _392;
        out.m_52.y = _390;
        out.m_52.z = _394;
        out.m_52.w = _260;
        return out;
    }
    float _396 = _390 * 0.715200006961822509765625;
    float _398 = fma(_392, 0.2125999927520751953125, _396);
    float _400 = fma(_394, 0.072200000286102294921875, _398);
    bool _402 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _404 = 1.0 / _400;
    float _406 = 0.0 + _276;
    float _408 = precise::clamp(_406, 0.0, 1.0);
    float _410 = _408;
    if (_402)
    {
        float _412 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _414 = _238 + _412;
        _302 = _414;
    }
    float _416 = _302;
    float _418 = _404 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _420 = precise::clamp(_418, 0.0, 1.0);
    float _422 = _416;
    if (_402)
    {
        float _424 = _416 * 8.0;
        float _426 = precise::clamp(_424, 0.0, 1.0);
        _422 = _426;
    }
    float _428 = _422;
    float _430 = fma(_420, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_402)
    {
        float _432 = _408 * _428;
        _410 = _432;
    }
    float _434 = _410;
    float _436 = _392 * _430;
    float _438 = _390 * _430;
    float _440 = _394 * _430;
    float _442 = 0.0 + _434;
    float _444 = precise::clamp(_442, 0.0, 1.0);
    out.m_52.x = _436;
    out.m_52.y = _438;
    out.m_52.z = _440;
    out.m_52.w = _444;
    return out;
}

