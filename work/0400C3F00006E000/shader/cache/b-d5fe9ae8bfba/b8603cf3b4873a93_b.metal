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
    texture2d<float> fp_t_tcb_E [[id(1)]];
    sampler fp_t_tcb_ESmplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_ESmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
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
    float2 _463 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_463, float2(0.0), isnan(_463))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_463, float2(0.0), isnan(_463))).x;
    float _67 = in.m_35.z;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = _59 * _71;
    float _81 = _59 * _77;
    bool _85 = _65 >= 0.00999999977648258209228515625;
    bool _87 = isnan(_65);
    bool _89 = _85 || _87;
    bool _91 = isnan(0.00999999977648258209228515625);
    bool _93 = _89 || _91;
    int _96 = as_type<int>(_65);
    if (!_93)
    {
        _96 = 1065353216;
    }
    int _98 = _96;
    int _100 = _98;
    if (!_93)
    {
        out.m_38.x = as_type<float>(_98);
        return out;
    }
    float _102 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _104 = _102 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _106 = fma(_104, 0.5, -0.5);
    float _108 = precise::clamp(_106, 0.0, 1.0);
    bool _110 = _108 > 0.0;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan(0.0);
    bool _118 = _114 || _116;
    if (!_118)
    {
        _100 = 1065353216;
    }
    int _120 = _100;
    if (!_118)
    {
        out.m_38.x = as_type<float>(_120);
        return out;
    }
    float2 _564 = float2(_79, _81);
    float2 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_564, float2(0.0), isnan(_564))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_564, float2(0.0), isnan(_564))).xy;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _102 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _132 = _102 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _134 = _102 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _136 = _102 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _138 = _102 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _140 = _102 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _142 = fma(_128, 2.0, -1.0);
    float _144 = fma(_126, 2.0, -1.0);
    float _146 = _142 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _148 = _144 * _130;
    float _150 = _144 * _132;
    float _152 = _144 * _134;
    float _154 = _146 * _130;
    float _156 = _144 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _158 = _146 * _132;
    float _160 = _146 * _134;
    float _162 = fma(_142, _136, _148);
    float _164 = -_154;
    float _166 = fma(_156, _136, _164);
    float _168 = fma(_142, _138, _150);
    float _170 = -_158;
    float _172 = fma(_156, _138, _170);
    float _174 = fma(_142, _140, _152);
    float _176 = -_160;
    float _178 = fma(_156, _140, _176);
    float _180 = -_162;
    float _182 = _63 + _180;
    float _184 = _63 + _162;
    float _186 = _61 + _166;
    float _188 = -_166;
    float _190 = _61 + _188;
    float _192 = _63 + _168;
    float _194 = -_168;
    float _196 = _63 + _194;
    float _198 = _63 + _174;
    float _200 = -_174;
    float _202 = _63 + _200;
    float _204 = -_172;
    float _206 = _61 + _204;
    float2 _703 = float2(_61, _63);
    float _208 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_703, float2(0.0), isnan(_703))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_703, float2(0.0), isnan(_703))).x;
    float2 _711 = float2(_190, _182);
    float _210 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_711, float2(0.0), isnan(_711))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_711, float2(0.0), isnan(_711))).x;
    float2 _719 = float2(_186, _184);
    float _212 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_719, float2(0.0), isnan(_719))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_719, float2(0.0), isnan(_719))).x;
    float _214 = _61 + _172;
    float _216 = _61 + _178;
    float2 _733 = float2(_206, _196);
    float _218 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_733, float2(0.0), isnan(_733))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_733, float2(0.0), isnan(_733))).x;
    float _220 = -_178;
    float _222 = _61 + _220;
    float2 _746 = float2(_214, _192);
    float _224 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_746, float2(0.0), isnan(_746))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_746, float2(0.0), isnan(_746))).x;
    float2 _754 = float2(_216, _198);
    float _226 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_754, float2(0.0), isnan(_754))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_754, float2(0.0), isnan(_754))).x;
    float2 _762 = float2(_222, _202);
    float _228 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_762, float2(0.0), isnan(_762))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_762, float2(0.0), isnan(_762))).x;
    float _230 = 1.0 / _102;
    float _232 = _230 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _234 = _230 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _236 = _230 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _238 = _232 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _240 = _234 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _242 = _236 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _244 = 0.5 * _238;
    float _246 = 0.5 * _240;
    float _248 = 0.5 * _242;
    float _250 = -_210;
    float _252 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[1].z, _250);
    float _254 = -_212;
    float _256 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[1].z, _254);
    float _258 = fma(_252, _244, 0.5);
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = fma(_256, _244, 0.5);
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = -_256;
    float _268 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = -_252;
    float _274 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = -_260;
    float _280 = _278 + 0.5;
    float _282 = -_264;
    float _284 = _282 + 0.5;
    float _286 = -_218;
    float _288 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[1].z, _286);
    float _290 = -_224;
    float _292 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[1].z, _290);
    float _294 = fma(_276, _280, 0.5);
    float _296 = fma(_270, _284, 0.5);
    float _298 = fma(_288, _246, 0.5);
    float _300 = precise::clamp(_298, 0.0, 1.0);
    float _302 = -_288;
    float _304 = fma(_302, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = -_294;
    float _310 = _264 + _308;
    float _312 = -_296;
    float _314 = _260 + _312;
    float _316 = -_226;
    float _318 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[1].z, _316);
    float _320 = -_228;
    float _322 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[1].z, _320);
    float _324 = fma(_270, _310, _294);
    float _326 = fma(_276, _314, _296);
    float _328 = fma(_292, _246, 0.5);
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = -_300;
    float _334 = _332 + 0.5;
    float _336 = -_292;
    float _338 = fma(_336, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = fma(_318, _248, 0.5);
    float _344 = precise::clamp(_342, 0.0, 1.0);
    float _346 = -_330;
    float _348 = _346 + 0.5;
    float _350 = fma(_306, _334, 0.5);
    float _352 = fma(_322, _248, 0.5);
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = -_318;
    float _358 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = fma(_340, _348, 0.5);
    float _364 = -_322;
    float _366 = fma(_364, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = -_350;
    float _372 = _330 + _370;
    float _374 = -_344;
    float _376 = _374 + 0.5;
    float _378 = -_362;
    float _380 = _300 + _378;
    float _382 = -_354;
    float _384 = _382 + 0.5;
    float _386 = fma(_340, _372, _350);
    float _388 = _324 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _390 = fma(_306, _380, _362);
    float _392 = fma(_368, _384, 0.5);
    float _394 = fma(_360, _376, 0.5);
    float _396 = _326 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _398 = fma(_386, (*spvDescriptorSet0.fp_c3)._m0[6].w, _388);
    float _400 = -_392;
    float _402 = _344 + _400;
    float _404 = -_394;
    float _406 = _354 + _404;
    float _408 = fma(_390, (*spvDescriptorSet0.fp_c3)._m0[6].w, _396);
    float _410 = fma(_360, _402, _392);
    float _412 = fma(_368, _406, _394);
    float _414 = fma(_410, (*spvDescriptorSet0.fp_c3)._m0[7].w, _398);
    float _416 = fma(_412, (*spvDescriptorSet0.fp_c3)._m0[7].w, _408);
    float _418 = _414 + _416;
    float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _422 = _420 + (-0.5);
    float _424 = _422 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = -_426;
    float _430 = fma(_108, _428, 1.0);
    out.m_38.x = _430;
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
    float2 _463 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_463, float2(0.0), isnan(_463))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_463, float2(0.0), isnan(_463))).x;
    float _67 = in.m_35.z;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = _59 * _71;
    float _81 = _59 * _77;
    bool _85 = _65 >= 0.00999999977648258209228515625;
    bool _87 = isnan(_65);
    bool _89 = _85 || _87;
    bool _91 = isnan(0.00999999977648258209228515625);
    bool _93 = _89 || _91;
    int _96 = as_type<int>(_65);
    if (!_93)
    {
        _96 = 1065353216;
    }
    int _98 = _96;
    int _100 = _98;
    if (!_93)
    {
        out.m_38.x = as_type<float>(_98);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    float _102 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _104 = _102 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _106 = fma(_104, 0.5, -0.5);
    float _108 = precise::clamp(_106, 0.0, 1.0);
    bool _110 = _108 > 0.0;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan(0.0);
    bool _118 = _114 || _116;
    if (!_118)
    {
        _100 = 1065353216;
    }
    int _120 = _100;
    if (!_118)
    {
        out.m_38.x = as_type<float>(_120);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    float2 _564 = float2(_79, _81);
    float2 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_564, float2(0.0), isnan(_564))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_564, float2(0.0), isnan(_564))).xy;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _102 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _132 = _102 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _134 = _102 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _136 = _102 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _138 = _102 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _140 = _102 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _142 = fma(_128, 2.0, -1.0);
    float _144 = fma(_126, 2.0, -1.0);
    float _146 = _142 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _148 = _144 * _130;
    float _150 = _144 * _132;
    float _152 = _144 * _134;
    float _154 = _146 * _130;
    float _156 = _144 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _158 = _146 * _132;
    float _160 = _146 * _134;
    float _162 = fma(_142, _136, _148);
    float _164 = -_154;
    float _166 = fma(_156, _136, _164);
    float _168 = fma(_142, _138, _150);
    float _170 = -_158;
    float _172 = fma(_156, _138, _170);
    float _174 = fma(_142, _140, _152);
    float _176 = -_160;
    float _178 = fma(_156, _140, _176);
    float _180 = -_162;
    float _182 = _63 + _180;
    float _184 = _63 + _162;
    float _186 = _61 + _166;
    float _188 = -_166;
    float _190 = _61 + _188;
    float _192 = _63 + _168;
    float _194 = -_168;
    float _196 = _63 + _194;
    float _198 = _63 + _174;
    float _200 = -_174;
    float _202 = _63 + _200;
    float _204 = -_172;
    float _206 = _61 + _204;
    float2 _703 = float2(_61, _63);
    float _208 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_703, float2(0.0), isnan(_703))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_703, float2(0.0), isnan(_703))).x;
    float2 _711 = float2(_190, _182);
    float _210 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_711, float2(0.0), isnan(_711))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_711, float2(0.0), isnan(_711))).x;
    float2 _719 = float2(_186, _184);
    float _212 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_719, float2(0.0), isnan(_719))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_719, float2(0.0), isnan(_719))).x;
    float _214 = _61 + _172;
    float _216 = _61 + _178;
    float2 _733 = float2(_206, _196);
    float _218 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_733, float2(0.0), isnan(_733))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_733, float2(0.0), isnan(_733))).x;
    float _220 = -_178;
    float _222 = _61 + _220;
    float2 _746 = float2(_214, _192);
    float _224 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_746, float2(0.0), isnan(_746))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_746, float2(0.0), isnan(_746))).x;
    float2 _754 = float2(_216, _198);
    float _226 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_754, float2(0.0), isnan(_754))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_754, float2(0.0), isnan(_754))).x;
    float2 _762 = float2(_222, _202);
    float _228 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_762, float2(0.0), isnan(_762))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_762, float2(0.0), isnan(_762))).x;
    float _230 = 1.0 / _102;
    float _232 = _230 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _234 = _230 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _236 = _230 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _238 = _232 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _240 = _234 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _242 = _236 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _244 = 0.5 * _238;
    float _246 = 0.5 * _240;
    float _248 = 0.5 * _242;
    float _250 = -_210;
    float _252 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[1].z, _250);
    float _254 = -_212;
    float _256 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[1].z, _254);
    float _258 = fma(_252, _244, 0.5);
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = fma(_256, _244, 0.5);
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = -_256;
    float _268 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = -_252;
    float _274 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = -_260;
    float _280 = _278 + 0.5;
    float _282 = -_264;
    float _284 = _282 + 0.5;
    float _286 = -_218;
    float _288 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[1].z, _286);
    float _290 = -_224;
    float _292 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[1].z, _290);
    float _294 = fma(_276, _280, 0.5);
    float _296 = fma(_270, _284, 0.5);
    float _298 = fma(_288, _246, 0.5);
    float _300 = precise::clamp(_298, 0.0, 1.0);
    float _302 = -_288;
    float _304 = fma(_302, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _306 = precise::clamp(_304, 0.0, 1.0);
    float _308 = -_294;
    float _310 = _264 + _308;
    float _312 = -_296;
    float _314 = _260 + _312;
    float _316 = -_226;
    float _318 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[1].z, _316);
    float _320 = -_228;
    float _322 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[1].z, _320);
    float _324 = fma(_270, _310, _294);
    float _326 = fma(_276, _314, _296);
    float _328 = fma(_292, _246, 0.5);
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = -_300;
    float _334 = _332 + 0.5;
    float _336 = -_292;
    float _338 = fma(_336, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = fma(_318, _248, 0.5);
    float _344 = precise::clamp(_342, 0.0, 1.0);
    float _346 = -_330;
    float _348 = _346 + 0.5;
    float _350 = fma(_306, _334, 0.5);
    float _352 = fma(_322, _248, 0.5);
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = -_318;
    float _358 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = fma(_340, _348, 0.5);
    float _364 = -_322;
    float _366 = fma(_364, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = -_350;
    float _372 = _330 + _370;
    float _374 = -_344;
    float _376 = _374 + 0.5;
    float _378 = -_362;
    float _380 = _300 + _378;
    float _382 = -_354;
    float _384 = _382 + 0.5;
    float _386 = fma(_340, _372, _350);
    float _388 = _324 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _390 = fma(_306, _380, _362);
    float _392 = fma(_368, _384, 0.5);
    float _394 = fma(_360, _376, 0.5);
    float _396 = _326 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _398 = fma(_386, (*spvDescriptorSet0.fp_c3)._m0[6].w, _388);
    float _400 = -_392;
    float _402 = _344 + _400;
    float _404 = -_394;
    float _406 = _354 + _404;
    float _408 = fma(_390, (*spvDescriptorSet0.fp_c3)._m0[6].w, _396);
    float _410 = fma(_360, _402, _392);
    float _412 = fma(_368, _406, _394);
    float _414 = fma(_410, (*spvDescriptorSet0.fp_c3)._m0[7].w, _398);
    float _416 = fma(_412, (*spvDescriptorSet0.fp_c3)._m0[7].w, _408);
    float _418 = _414 + _416;
    float _420 = _418 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _422 = _420 + (-0.5);
    float _424 = _422 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = -_426;
    float _430 = fma(_108, _428, 1.0);
    out.m_38.x = _430;
    return main0_out_u{as_type<uint4>(out.m_38)};
}

