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
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_41 [[user(locn6)]];
    float4 m_52 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_37.y;
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
    float2 _518 = float2(_105, _107);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_518, float2(0.0), isnan(_518))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_518, float2(0.0), isnan(_518))).x;
    float2 _529 = float2(_99, _101);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_529, float2(0.0), isnan(_529))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_529, float2(0.0), isnan(_529))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float _122 = in.m_39.y;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_39.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_39.z;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_41.y;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_41.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_41.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_35.z;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = _91 * _126;
    float _166 = _91 * _132;
    float _168 = _91 * _138;
    float _170 = _164 * _164;
    float _172 = fma(_166, _166, _170);
    float _174 = fma(_168, _168, _172);
    float _176 = _91 * _144;
    float _178 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _180 = _178 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _182 = rsqrt(_174);
    float _184 = 1.0 / _180;
    float _186 = _164 * _182;
    float _188 = _176 * _186;
    float _190 = _91 * _150;
    float _192 = _166 * _182;
    float _194 = _168 * _182;
    float _196 = _91 * _156;
    float _198 = fma(_190, _192, _188);
    float _200 = in.m_43.x;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = fma(_196, _194, _198);
    float _208 = _91 * _162;
    float _210 = in.m_45.w;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = abs(_206);
    float _218 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _220 = _216 + _218;
    float _222 = _208 * _103;
    float _224 = _220 * _184;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _230 = fma(_222, (*spvDescriptorSet0.fp_c8)._m0[30].w, _228);
    float _232 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _234 = fma(_226, -2.0, 3.0);
    float _236 = _226 * _226;
    float _238 = _234 * _236;
    float _240 = 1.0 / _230;
    float _242 = _91 * _214;
    float _244 = in.m_47.z;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = in.m_45.z;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _258 = fma(_109, (*spvDescriptorSet0.fp_c8)._m0[30].w, _256);
    float _260 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _262 = _240 * _260;
    float _264 = 1.0 / _258;
    float _266 = _120 * _242;
    float _268 = 0.0 + _266;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _274 = -_262;
    float _276 = fma(_264, _272, _274);
    float _278 = _276 * _232;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _270 * _280;
    float _284 = _91 * _204;
    float _286 = _282 * _238;
    float _288 = _286 * _284;
    bool _292 = _288 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _294 = isnan(_288);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _300 = _296 || _298;
    float _302 = in.m_45.x;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_45.y;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_47.x;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_47.y;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = _262;
    if (!_300)
    {
        discard_fragment();
    }
    float _328 = _91 * _254;
    float _330 = _91 * _306;
    float _332 = _91 * _312;
    float _334 = _91 * _318;
    float _336 = _91 * _324;
    float _338 = _91 * _248;
    float _340 = -_334;
    float _342 = _330 + _340;
    float _344 = -_336;
    float _346 = _332 + _344;
    float _348 = -_338;
    float _350 = _328 + _348;
    float _352 = _114 * _114;
    float _354 = _116 * _116;
    float _356 = _118 * _118;
    float _358 = fma(_352, _342, _334);
    float _360 = fma(_354, _346, _336);
    float _362 = fma(_356, _350, _338);
    float _364 = _336;
    if (!_300)
    {
        out.m_50.x = _358;
        out.m_50.y = _360;
        out.m_50.z = _362;
        out.m_50.w = _266;
        return out;
    }
    float _366 = _360 * 0.715200006961822509765625;
    float _368 = in.m_52.w;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = in.m_52.x;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_52.y;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = fma(_358, 0.2125999927520751953125, _366);
    float _388 = in.m_52.z;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = fma(_362, 0.072200000286102294921875, _386);
    bool _396 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _398 = 1.0 / _394;
    if (_396)
    {
        float _400 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _402 = _262 + _400;
        _326 = _402;
    }
    float _404 = _326;
    if (_396)
    {
        float _406 = _404 * 8.0;
        float _408 = precise::clamp(_406, 0.0, 1.0);
        _364 = _408;
    }
    float _410 = _364;
    float _412 = _398 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _414 = precise::clamp(_412, 0.0, 1.0);
    float _416 = fma(_414, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _418 = _91 * _372;
    float _420 = _91 * _378;
    float _422 = _91 * _384;
    float _424 = _416 * _418;
    float _426 = 0.0 + _288;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = _91 * _392;
    float _432 = fma(_358, _424, _420);
    float _434 = _428;
    if (_396)
    {
        float _436 = _428 * _410;
        _434 = _436;
    }
    float _438 = _434;
    float _440 = fma(_360, _424, _422);
    float _442 = fma(_362, _424, _430);
    float _444 = 0.0 + _438;
    float _446 = precise::clamp(_444, 0.0, 1.0);
    out.m_50.x = _432;
    out.m_50.y = _440;
    out.m_50.z = _442;
    out.m_50.w = _446;
    return out;
}

