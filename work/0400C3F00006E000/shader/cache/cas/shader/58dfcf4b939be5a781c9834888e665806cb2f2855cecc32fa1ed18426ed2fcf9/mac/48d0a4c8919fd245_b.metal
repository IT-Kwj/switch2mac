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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _453 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_453, float2(0.0), isnan(_453))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_453, float2(0.0), isnan(_453))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = _57 * _69;
    float _79 = _57 * _75;
    float _81 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _83 = precise::max(_81, (*spvDescriptorSet0.fp_c3)._m0[0].y);
    float _85 = 1.0 / _83;
    float _87 = _85 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _89 = _87 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _91 = _89 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _93 = fma(_91, 0.5, -0.5);
    float _95 = precise::clamp(_93, 0.0, 1.0);
    bool _99 = _95 > 0.0;
    bool _101 = isnan(_95);
    bool _103 = _99 || _101;
    bool _105 = isnan(0.0);
    bool _107 = _103 || _105;
    int _110 = as_type<int>(_57);
    if (!_107)
    {
        _110 = 1065353216;
    }
    int _112 = _110;
    if (!_107)
    {
        out.m_36.x = as_type<float>(_112);
        return out;
    }
    float2 _544 = float2(_77, _79);
    float2 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_544, float2(0.0), isnan(_544))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_544, float2(0.0), isnan(_544))).xy;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _89 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _124 = _89 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _126 = _89 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _128 = _89 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _130 = _89 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _132 = _89 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _134 = fma(_120, 2.0, -1.0);
    float _136 = fma(_118, 2.0, -1.0);
    float _138 = _134 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _140 = _136 * _122;
    float _142 = _136 * _124;
    float _144 = _138 * _124;
    float _146 = _138 * _122;
    float _148 = _138 * _126;
    float _150 = _136 * _126;
    float _152 = _136 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _154 = fma(_134, _130, _142);
    float _156 = fma(_134, _132, _140);
    float _158 = fma(_134, _128, _150);
    float _160 = -_144;
    float _162 = fma(_152, _130, _160);
    float _164 = _61 + _154;
    float _166 = -_154;
    float _168 = _61 + _166;
    float _170 = _61 + _158;
    float _172 = _61 + _156;
    float _174 = -_156;
    float _176 = _61 + _174;
    float _178 = -_158;
    float _180 = _61 + _178;
    float _182 = _59 + _162;
    float _184 = -_162;
    float _186 = _59 + _184;
    float _188 = -_146;
    float _190 = fma(_152, _132, _188);
    float _192 = -_148;
    float _194 = fma(_152, _128, _192);
    float2 _678 = float2(_186, _168);
    float _196 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_678, float2(0.0), isnan(_678))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_678, float2(0.0), isnan(_678))).x;
    float2 _686 = float2(_182, _164);
    float _198 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_686, float2(0.0), isnan(_686))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_686, float2(0.0), isnan(_686))).x;
    float _200 = -_190;
    float _202 = _59 + _200;
    float _204 = _59 + _190;
    float _206 = _59 + _194;
    float _208 = -_194;
    float _210 = _59 + _208;
    float2 _710 = float2(_202, _176);
    float _212 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_710, float2(0.0), isnan(_710))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_710, float2(0.0), isnan(_710))).x;
    float2 _718 = float2(_204, _172);
    float _214 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_718, float2(0.0), isnan(_718))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_718, float2(0.0), isnan(_718))).x;
    float2 _726 = float2(_206, _170);
    float _216 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_726, float2(0.0), isnan(_726))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_726, float2(0.0), isnan(_726))).x;
    float2 _734 = float2(_210, _180);
    float _218 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_734, float2(0.0), isnan(_734))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_734, float2(0.0), isnan(_734))).x;
    float _220 = 1.0 / _89;
    float _222 = _220 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _224 = _222 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _226 = _220 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _228 = _220 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _230 = 0.5 * _224;
    float _232 = _226 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _234 = _228 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _236 = 0.5 * _234;
    float _238 = -_196;
    float _240 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _238);
    float _242 = -_198;
    float _244 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _242);
    float _246 = fma(_240, _230, 0.5);
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = fma(_244, _230, 0.5);
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = -_244;
    float _256 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = 0.5 * _232;
    float _262 = -_212;
    float _264 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _262);
    float _266 = -_252;
    float _268 = _266 + 0.5;
    float _270 = -_214;
    float _272 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _270);
    float _274 = -_216;
    float _276 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _274);
    float _278 = fma(_264, _260, 0.5);
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = fma(_258, _268, 0.5);
    float _284 = -_240;
    float _286 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = -_248;
    float _292 = _290 + 0.5;
    float _294 = fma(_272, _260, 0.5);
    float _296 = precise::clamp(_294, 0.0, 1.0);
    float _298 = -_282;
    float _300 = _248 + _298;
    float _302 = -_218;
    float _304 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _302);
    float _306 = -_264;
    float _308 = fma(_306, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = -_280;
    float _314 = _312 + 0.5;
    float _316 = fma(_288, _292, 0.5);
    float _318 = -_272;
    float _320 = fma(_318, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _322 = precise::clamp(_320, 0.0, 1.0);
    float _324 = -_296;
    float _326 = _324 + 0.5;
    float _328 = fma(_288, _300, _282);
    float _330 = fma(_310, _314, 0.5);
    float _332 = -_316;
    float _334 = _252 + _332;
    float _336 = fma(_322, _326, 0.5);
    float _338 = fma(_304, _236, 0.5);
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = fma(_276, _236, 0.5);
    float _344 = precise::clamp(_342, 0.0, 1.0);
    float _346 = -_276;
    float _348 = fma(_346, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _350 = precise::clamp(_348, 0.0, 1.0);
    float _352 = fma(_258, _334, _316);
    float _354 = -_304;
    float _356 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _358 = precise::clamp(_356, 0.0, 1.0);
    float _360 = -_336;
    float _362 = _280 + _360;
    float _364 = -_330;
    float _366 = _296 + _364;
    float _368 = -_340;
    float _370 = _368 + 0.5;
    float _372 = -_344;
    float _374 = _372 + 0.5;
    float _376 = fma(_310, _362, _336);
    float _378 = fma(_322, _366, _330);
    float _380 = fma(_358, _370, 0.5);
    float _382 = fma(_350, _374, 0.5);
    float _384 = _352 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _386 = _328 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _388 = -_380;
    float _390 = _344 + _388;
    float _392 = -_382;
    float _394 = _340 + _392;
    float _396 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[6].w, _384);
    float _398 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[6].w, _386);
    float _400 = fma(_350, _390, _380);
    float _402 = fma(_358, _394, _382);
    float _404 = fma(_400, (*spvDescriptorSet0.fp_c3)._m0[7].w, _396);
    float _406 = fma(_402, (*spvDescriptorSet0.fp_c3)._m0[7].w, _398);
    float _408 = _404 + _406;
    float _410 = _408 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _412 = _410 + (-0.5);
    float _414 = _412 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = -_416;
    float _420 = fma(_95, _418, 1.0);
    out.m_36.x = _420;
    return out;
}


struct main0_out_u
{
    uint4 m_36 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _453 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_453, float2(0.0), isnan(_453))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_453, float2(0.0), isnan(_453))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = _57 * _69;
    float _79 = _57 * _75;
    float _81 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _83 = precise::max(_81, (*spvDescriptorSet0.fp_c3)._m0[0].y);
    float _85 = 1.0 / _83;
    float _87 = _85 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _89 = _87 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _91 = _89 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _93 = fma(_91, 0.5, -0.5);
    float _95 = precise::clamp(_93, 0.0, 1.0);
    bool _99 = _95 > 0.0;
    bool _101 = isnan(_95);
    bool _103 = _99 || _101;
    bool _105 = isnan(0.0);
    bool _107 = _103 || _105;
    int _110 = as_type<int>(_57);
    if (!_107)
    {
        _110 = 1065353216;
    }
    int _112 = _110;
    if (!_107)
    {
        out.m_36.x = as_type<float>(_112);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    float2 _544 = float2(_77, _79);
    float2 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_544, float2(0.0), isnan(_544))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_544, float2(0.0), isnan(_544))).xy;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _89 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _124 = _89 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _126 = _89 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _128 = _89 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _130 = _89 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _132 = _89 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _134 = fma(_120, 2.0, -1.0);
    float _136 = fma(_118, 2.0, -1.0);
    float _138 = _134 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _140 = _136 * _122;
    float _142 = _136 * _124;
    float _144 = _138 * _124;
    float _146 = _138 * _122;
    float _148 = _138 * _126;
    float _150 = _136 * _126;
    float _152 = _136 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _154 = fma(_134, _130, _142);
    float _156 = fma(_134, _132, _140);
    float _158 = fma(_134, _128, _150);
    float _160 = -_144;
    float _162 = fma(_152, _130, _160);
    float _164 = _61 + _154;
    float _166 = -_154;
    float _168 = _61 + _166;
    float _170 = _61 + _158;
    float _172 = _61 + _156;
    float _174 = -_156;
    float _176 = _61 + _174;
    float _178 = -_158;
    float _180 = _61 + _178;
    float _182 = _59 + _162;
    float _184 = -_162;
    float _186 = _59 + _184;
    float _188 = -_146;
    float _190 = fma(_152, _132, _188);
    float _192 = -_148;
    float _194 = fma(_152, _128, _192);
    float2 _678 = float2(_186, _168);
    float _196 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_678, float2(0.0), isnan(_678))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_678, float2(0.0), isnan(_678))).x;
    float2 _686 = float2(_182, _164);
    float _198 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_686, float2(0.0), isnan(_686))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_686, float2(0.0), isnan(_686))).x;
    float _200 = -_190;
    float _202 = _59 + _200;
    float _204 = _59 + _190;
    float _206 = _59 + _194;
    float _208 = -_194;
    float _210 = _59 + _208;
    float2 _710 = float2(_202, _176);
    float _212 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_710, float2(0.0), isnan(_710))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_710, float2(0.0), isnan(_710))).x;
    float2 _718 = float2(_204, _172);
    float _214 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_718, float2(0.0), isnan(_718))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_718, float2(0.0), isnan(_718))).x;
    float2 _726 = float2(_206, _170);
    float _216 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_726, float2(0.0), isnan(_726))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_726, float2(0.0), isnan(_726))).x;
    float2 _734 = float2(_210, _180);
    float _218 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_734, float2(0.0), isnan(_734))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_734, float2(0.0), isnan(_734))).x;
    float _220 = 1.0 / _89;
    float _222 = _220 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _224 = _222 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _226 = _220 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _228 = _220 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _230 = 0.5 * _224;
    float _232 = _226 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _234 = _228 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _236 = 0.5 * _234;
    float _238 = -_196;
    float _240 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _238);
    float _242 = -_198;
    float _244 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _242);
    float _246 = fma(_240, _230, 0.5);
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = fma(_244, _230, 0.5);
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = -_244;
    float _256 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = 0.5 * _232;
    float _262 = -_212;
    float _264 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _262);
    float _266 = -_252;
    float _268 = _266 + 0.5;
    float _270 = -_214;
    float _272 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _270);
    float _274 = -_216;
    float _276 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _274);
    float _278 = fma(_264, _260, 0.5);
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = fma(_258, _268, 0.5);
    float _284 = -_240;
    float _286 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = -_248;
    float _292 = _290 + 0.5;
    float _294 = fma(_272, _260, 0.5);
    float _296 = precise::clamp(_294, 0.0, 1.0);
    float _298 = -_282;
    float _300 = _248 + _298;
    float _302 = -_218;
    float _304 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _302);
    float _306 = -_264;
    float _308 = fma(_306, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = -_280;
    float _314 = _312 + 0.5;
    float _316 = fma(_288, _292, 0.5);
    float _318 = -_272;
    float _320 = fma(_318, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _322 = precise::clamp(_320, 0.0, 1.0);
    float _324 = -_296;
    float _326 = _324 + 0.5;
    float _328 = fma(_288, _300, _282);
    float _330 = fma(_310, _314, 0.5);
    float _332 = -_316;
    float _334 = _252 + _332;
    float _336 = fma(_322, _326, 0.5);
    float _338 = fma(_304, _236, 0.5);
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = fma(_276, _236, 0.5);
    float _344 = precise::clamp(_342, 0.0, 1.0);
    float _346 = -_276;
    float _348 = fma(_346, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _350 = precise::clamp(_348, 0.0, 1.0);
    float _352 = fma(_258, _334, _316);
    float _354 = -_304;
    float _356 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _358 = precise::clamp(_356, 0.0, 1.0);
    float _360 = -_336;
    float _362 = _280 + _360;
    float _364 = -_330;
    float _366 = _296 + _364;
    float _368 = -_340;
    float _370 = _368 + 0.5;
    float _372 = -_344;
    float _374 = _372 + 0.5;
    float _376 = fma(_310, _362, _336);
    float _378 = fma(_322, _366, _330);
    float _380 = fma(_358, _370, 0.5);
    float _382 = fma(_350, _374, 0.5);
    float _384 = _352 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _386 = _328 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _388 = -_380;
    float _390 = _344 + _388;
    float _392 = -_382;
    float _394 = _340 + _392;
    float _396 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[6].w, _384);
    float _398 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[6].w, _386);
    float _400 = fma(_350, _390, _380);
    float _402 = fma(_358, _394, _382);
    float _404 = fma(_400, (*spvDescriptorSet0.fp_c3)._m0[7].w, _396);
    float _406 = fma(_402, (*spvDescriptorSet0.fp_c3)._m0[7].w, _398);
    float _408 = _404 + _406;
    float _410 = _408 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _412 = _410 + (-0.5);
    float _414 = _412 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = -_416;
    float _420 = fma(_95, _418, 1.0);
    out.m_36.x = _420;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

