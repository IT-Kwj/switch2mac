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
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ESmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_35.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _471 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_471, float2(0.0), isnan(_471))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_471, float2(0.0), isnan(_471))).x;
    float2 _482 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_482, float2(0.0), isnan(_482))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_482, float2(0.0), isnan(_482))).x;
    float _69 = in.m_35.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = _59 * _73;
    float _83 = _59 * _79;
    float _85 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    bool _89 = _67 >= 0.00999999977648258209228515625;
    bool _91 = isnan(_67);
    bool _93 = _89 || _91;
    bool _95 = isnan(0.00999999977648258209228515625);
    bool _97 = _93 || _95;
    float _99 = precise::max(_85, (*spvDescriptorSet0.fp_c3)._m0[0].y);
    float _101 = 1.0 / _99;
    int _104 = as_type<int>(_67);
    if (!_97)
    {
        _104 = 1065353216;
    }
    int _106 = _104;
    float _108 = _101 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _110 = _108 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _112 = _110 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _114 = fma(_112, 0.5, -0.5);
    float _116 = precise::clamp(_114, 0.0, 1.0);
    bool _118 = _116 > 0.0;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan(0.0);
    bool _126 = _122 || _124;
    int _128 = _106;
    if (!_97)
    {
        out.m_38.x = as_type<float>(_106);
        return out;
    }
    if (!_126)
    {
        _128 = 1065353216;
    }
    int _130 = _128;
    if (!_126)
    {
        out.m_38.x = as_type<float>(_130);
        return out;
    }
    float2 _595 = float2(_83, _81);
    float2 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_595, float2(0.0), isnan(_595))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_595, float2(0.0), isnan(_595))).xy;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _110 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _142 = _110 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _144 = _110 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _146 = _110 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _148 = _110 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _150 = _110 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _152 = fma(_138, 2.0, -1.0);
    float _154 = fma(_136, 2.0, -1.0);
    float _156 = _152 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _158 = _154 * _140;
    float _160 = _154 * _142;
    float _162 = _156 * _142;
    float _164 = _156 * _140;
    float _166 = _156 * _144;
    float _168 = _154 * _144;
    float _170 = _154 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _172 = fma(_152, _148, _160);
    float _174 = fma(_152, _150, _158);
    float _176 = fma(_152, _146, _168);
    float _178 = -_162;
    float _180 = fma(_170, _148, _178);
    float _182 = _63 + _172;
    float _184 = -_172;
    float _186 = _63 + _184;
    float _188 = _63 + _176;
    float _190 = _63 + _174;
    float _192 = -_174;
    float _194 = _63 + _192;
    float _196 = -_176;
    float _198 = _63 + _196;
    float _200 = _61 + _180;
    float _202 = -_180;
    float _204 = _61 + _202;
    float _206 = -_164;
    float _208 = fma(_170, _150, _206);
    float _210 = -_166;
    float _212 = fma(_170, _146, _210);
    float2 _729 = float2(_204, _186);
    float _214 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_729, float2(0.0), isnan(_729))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_729, float2(0.0), isnan(_729))).x;
    float2 _737 = float2(_200, _182);
    float _216 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_737, float2(0.0), isnan(_737))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_737, float2(0.0), isnan(_737))).x;
    float _218 = -_208;
    float _220 = _61 + _218;
    float _222 = _61 + _208;
    float _224 = _61 + _212;
    float _226 = -_212;
    float _228 = _61 + _226;
    float2 _761 = float2(_220, _194);
    float _230 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_761, float2(0.0), isnan(_761))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_761, float2(0.0), isnan(_761))).x;
    float2 _769 = float2(_222, _190);
    float _232 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_769, float2(0.0), isnan(_769))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_769, float2(0.0), isnan(_769))).x;
    float2 _777 = float2(_224, _188);
    float _234 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_777, float2(0.0), isnan(_777))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_777, float2(0.0), isnan(_777))).x;
    float2 _785 = float2(_228, _198);
    float _236 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_785, float2(0.0), isnan(_785))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_785, float2(0.0), isnan(_785))).x;
    float _238 = 1.0 / _110;
    float _240 = _238 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _242 = _240 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _244 = _238 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _246 = _238 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _248 = 0.5 * _242;
    float _250 = _244 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _252 = _246 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _254 = 0.5 * _252;
    float _256 = -_214;
    float _258 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _256);
    float _260 = -_216;
    float _262 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _260);
    float _264 = fma(_258, _248, 0.5);
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = fma(_262, _248, 0.5);
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = -_262;
    float _274 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = 0.5 * _250;
    float _280 = -_230;
    float _282 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _280);
    float _284 = -_270;
    float _286 = _284 + 0.5;
    float _288 = -_232;
    float _290 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _288);
    float _292 = -_234;
    float _294 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _292);
    float _296 = fma(_282, _278, 0.5);
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = fma(_276, _286, 0.5);
    float _302 = -_258;
    float _304 = fma(_302, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = -_266;
    float _310 = _308 + 0.5;
    float _312 = fma(_290, _278, 0.5);
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = -_300;
    float _318 = _266 + _316;
    float _320 = -_236;
    float _322 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _320);
    float _324 = -_282;
    float _326 = fma(_324, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _328 = precise::clamp(_326, 0.0, 1.0);
    float _330 = -_298;
    float _332 = _330 + 0.5;
    float _334 = fma(_306, _310, 0.5);
    float _336 = -_290;
    float _338 = fma(_336, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = -_314;
    float _344 = _342 + 0.5;
    float _346 = fma(_306, _318, _300);
    float _348 = fma(_328, _332, 0.5);
    float _350 = -_334;
    float _352 = _270 + _350;
    float _354 = fma(_340, _344, 0.5);
    float _356 = fma(_322, _254, 0.5);
    float _358 = precise::clamp(_356, 0.0, 1.0);
    float _360 = fma(_294, _254, 0.5);
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = -_294;
    float _366 = fma(_364, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = fma(_276, _352, _334);
    float _372 = -_322;
    float _374 = fma(_372, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _376 = precise::clamp(_374, 0.0, 1.0);
    float _378 = -_354;
    float _380 = _298 + _378;
    float _382 = -_348;
    float _384 = _314 + _382;
    float _386 = -_358;
    float _388 = _386 + 0.5;
    float _390 = -_362;
    float _392 = _390 + 0.5;
    float _394 = fma(_328, _380, _354);
    float _396 = fma(_340, _384, _348);
    float _398 = fma(_376, _388, 0.5);
    float _400 = fma(_368, _392, 0.5);
    float _402 = _370 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _404 = _346 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _406 = -_398;
    float _408 = _362 + _406;
    float _410 = -_400;
    float _412 = _358 + _410;
    float _414 = fma(_396, (*spvDescriptorSet0.fp_c3)._m0[6].w, _402);
    float _416 = fma(_394, (*spvDescriptorSet0.fp_c3)._m0[6].w, _404);
    float _418 = fma(_368, _408, _398);
    float _420 = fma(_376, _412, _400);
    float _422 = fma(_418, (*spvDescriptorSet0.fp_c3)._m0[7].w, _414);
    float _424 = fma(_420, (*spvDescriptorSet0.fp_c3)._m0[7].w, _416);
    float _426 = _422 + _424;
    float _428 = _426 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _430 = _428 + (-0.5);
    float _432 = _430 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _434 = precise::clamp(_432, 0.0, 1.0);
    float _436 = -_434;
    float _438 = fma(_116, _436, 1.0);
    out.m_38.x = _438;
    return out;
}


struct main0_out_u
{
    uint4 m_38 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_35.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _471 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_471, float2(0.0), isnan(_471))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_471, float2(0.0), isnan(_471))).x;
    float2 _482 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_482, float2(0.0), isnan(_482))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_482, float2(0.0), isnan(_482))).x;
    float _69 = in.m_35.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = _59 * _73;
    float _83 = _59 * _79;
    float _85 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    bool _89 = _67 >= 0.00999999977648258209228515625;
    bool _91 = isnan(_67);
    bool _93 = _89 || _91;
    bool _95 = isnan(0.00999999977648258209228515625);
    bool _97 = _93 || _95;
    float _99 = precise::max(_85, (*spvDescriptorSet0.fp_c3)._m0[0].y);
    float _101 = 1.0 / _99;
    int _104 = as_type<int>(_67);
    if (!_97)
    {
        _104 = 1065353216;
    }
    int _106 = _104;
    float _108 = _101 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _110 = _108 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _112 = _110 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _114 = fma(_112, 0.5, -0.5);
    float _116 = precise::clamp(_114, 0.0, 1.0);
    bool _118 = _116 > 0.0;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan(0.0);
    bool _126 = _122 || _124;
    int _128 = _106;
    if (!_97)
    {
        out.m_38.x = as_type<float>(_106);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    if (!_126)
    {
        _128 = 1065353216;
    }
    int _130 = _128;
    if (!_126)
    {
        out.m_38.x = as_type<float>(_130);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    float2 _595 = float2(_83, _81);
    float2 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_595, float2(0.0), isnan(_595))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_595, float2(0.0), isnan(_595))).xy;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _110 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _142 = _110 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _144 = _110 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _146 = _110 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _148 = _110 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _150 = _110 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _152 = fma(_138, 2.0, -1.0);
    float _154 = fma(_136, 2.0, -1.0);
    float _156 = _152 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _158 = _154 * _140;
    float _160 = _154 * _142;
    float _162 = _156 * _142;
    float _164 = _156 * _140;
    float _166 = _156 * _144;
    float _168 = _154 * _144;
    float _170 = _154 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _172 = fma(_152, _148, _160);
    float _174 = fma(_152, _150, _158);
    float _176 = fma(_152, _146, _168);
    float _178 = -_162;
    float _180 = fma(_170, _148, _178);
    float _182 = _63 + _172;
    float _184 = -_172;
    float _186 = _63 + _184;
    float _188 = _63 + _176;
    float _190 = _63 + _174;
    float _192 = -_174;
    float _194 = _63 + _192;
    float _196 = -_176;
    float _198 = _63 + _196;
    float _200 = _61 + _180;
    float _202 = -_180;
    float _204 = _61 + _202;
    float _206 = -_164;
    float _208 = fma(_170, _150, _206);
    float _210 = -_166;
    float _212 = fma(_170, _146, _210);
    float2 _729 = float2(_204, _186);
    float _214 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_729, float2(0.0), isnan(_729))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_729, float2(0.0), isnan(_729))).x;
    float2 _737 = float2(_200, _182);
    float _216 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_737, float2(0.0), isnan(_737))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_737, float2(0.0), isnan(_737))).x;
    float _218 = -_208;
    float _220 = _61 + _218;
    float _222 = _61 + _208;
    float _224 = _61 + _212;
    float _226 = -_212;
    float _228 = _61 + _226;
    float2 _761 = float2(_220, _194);
    float _230 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_761, float2(0.0), isnan(_761))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_761, float2(0.0), isnan(_761))).x;
    float2 _769 = float2(_222, _190);
    float _232 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_769, float2(0.0), isnan(_769))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_769, float2(0.0), isnan(_769))).x;
    float2 _777 = float2(_224, _188);
    float _234 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_777, float2(0.0), isnan(_777))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_777, float2(0.0), isnan(_777))).x;
    float2 _785 = float2(_228, _198);
    float _236 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_785, float2(0.0), isnan(_785))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_785, float2(0.0), isnan(_785))).x;
    float _238 = 1.0 / _110;
    float _240 = _238 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _242 = _240 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _244 = _238 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _246 = _238 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _248 = 0.5 * _242;
    float _250 = _244 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _252 = _246 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _254 = 0.5 * _252;
    float _256 = -_214;
    float _258 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _256);
    float _260 = -_216;
    float _262 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _260);
    float _264 = fma(_258, _248, 0.5);
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = fma(_262, _248, 0.5);
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = -_262;
    float _274 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = 0.5 * _250;
    float _280 = -_230;
    float _282 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _280);
    float _284 = -_270;
    float _286 = _284 + 0.5;
    float _288 = -_232;
    float _290 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _288);
    float _292 = -_234;
    float _294 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _292);
    float _296 = fma(_282, _278, 0.5);
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = fma(_276, _286, 0.5);
    float _302 = -_258;
    float _304 = fma(_302, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = -_266;
    float _310 = _308 + 0.5;
    float _312 = fma(_290, _278, 0.5);
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = -_300;
    float _318 = _266 + _316;
    float _320 = -_236;
    float _322 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _320);
    float _324 = -_282;
    float _326 = fma(_324, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _328 = precise::clamp(_326, 0.0, 1.0);
    float _330 = -_298;
    float _332 = _330 + 0.5;
    float _334 = fma(_306, _310, 0.5);
    float _336 = -_290;
    float _338 = fma(_336, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = -_314;
    float _344 = _342 + 0.5;
    float _346 = fma(_306, _318, _300);
    float _348 = fma(_328, _332, 0.5);
    float _350 = -_334;
    float _352 = _270 + _350;
    float _354 = fma(_340, _344, 0.5);
    float _356 = fma(_322, _254, 0.5);
    float _358 = precise::clamp(_356, 0.0, 1.0);
    float _360 = fma(_294, _254, 0.5);
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = -_294;
    float _366 = fma(_364, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = fma(_276, _352, _334);
    float _372 = -_322;
    float _374 = fma(_372, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _376 = precise::clamp(_374, 0.0, 1.0);
    float _378 = -_354;
    float _380 = _298 + _378;
    float _382 = -_348;
    float _384 = _314 + _382;
    float _386 = -_358;
    float _388 = _386 + 0.5;
    float _390 = -_362;
    float _392 = _390 + 0.5;
    float _394 = fma(_328, _380, _354);
    float _396 = fma(_340, _384, _348);
    float _398 = fma(_376, _388, 0.5);
    float _400 = fma(_368, _392, 0.5);
    float _402 = _370 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _404 = _346 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _406 = -_398;
    float _408 = _362 + _406;
    float _410 = -_400;
    float _412 = _358 + _410;
    float _414 = fma(_396, (*spvDescriptorSet0.fp_c3)._m0[6].w, _402);
    float _416 = fma(_394, (*spvDescriptorSet0.fp_c3)._m0[6].w, _404);
    float _418 = fma(_368, _408, _398);
    float _420 = fma(_376, _412, _400);
    float _422 = fma(_418, (*spvDescriptorSet0.fp_c3)._m0[7].w, _414);
    float _424 = fma(_420, (*spvDescriptorSet0.fp_c3)._m0[7].w, _416);
    float _426 = _422 + _424;
    float _428 = _426 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _430 = _428 + (-0.5);
    float _432 = _430 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _434 = precise::clamp(_432, 0.0, 1.0);
    float _436 = -_434;
    float _438 = fma(_116, _436, 1.0);
    out.m_38.x = _438;
    return main0_out_u{as_type<uint4>(out.m_38)};
}

