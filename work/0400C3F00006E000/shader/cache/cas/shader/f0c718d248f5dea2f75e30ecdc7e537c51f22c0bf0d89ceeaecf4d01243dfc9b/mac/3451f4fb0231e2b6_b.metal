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
    float2 _371 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_371, float2(0.0), isnan(_371))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_371, float2(0.0), isnan(_371))).x;
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
    float2 _472 = float2(_79, _81);
    float2 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_472, float2(0.0), isnan(_472))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_472, float2(0.0), isnan(_472))).xy;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _102 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _132 = _102 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _134 = _102 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _136 = _102 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _138 = fma(_128, 2.0, -1.0);
    float _140 = fma(_126, 2.0, -1.0);
    float _142 = _138 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _144 = _140 * _130;
    float _146 = _140 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _148 = _140 * _132;
    float _150 = _142 * _130;
    float _152 = _142 * _132;
    float _154 = fma(_138, _134, _144);
    float _156 = fma(_138, _136, _148);
    float _158 = -_150;
    float _160 = fma(_146, _134, _158);
    float _162 = -_152;
    float _164 = fma(_146, _136, _162);
    float _166 = _63 + _154;
    float _168 = _63 + _156;
    float _170 = _61 + _160;
    float _172 = -_160;
    float _174 = _61 + _172;
    float _176 = -_156;
    float _178 = _63 + _176;
    float _180 = -_154;
    float _182 = _63 + _180;
    float _184 = _61 + _164;
    float _186 = -_164;
    float _188 = _61 + _186;
    float2 _581 = float2(_61, _63);
    float _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_581, float2(0.0), isnan(_581))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_581, float2(0.0), isnan(_581))).x;
    float2 _589 = float2(_170, _166);
    float _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_589, float2(0.0), isnan(_589))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_589, float2(0.0), isnan(_589))).x;
    float2 _597 = float2(_174, _182);
    float _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_597, float2(0.0), isnan(_597))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_597, float2(0.0), isnan(_597))).x;
    float2 _605 = float2(_184, _168);
    float _196 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_605, float2(0.0), isnan(_605))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_605, float2(0.0), isnan(_605))).x;
    float2 _613 = float2(_188, _178);
    float _198 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_613, float2(0.0), isnan(_613))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_613, float2(0.0), isnan(_613))).x;
    float _200 = 1.0 / _102;
    float _202 = _200 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _204 = _200 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _206 = _202 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _208 = _204 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _210 = 0.5 * _206;
    float _212 = 0.5 * _208;
    float _214 = -_192;
    float _216 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[1].z, _214);
    float _218 = -_194;
    float _220 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[1].z, _218);
    float _222 = -_196;
    float _224 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[1].z, _222);
    float _226 = -_198;
    float _228 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[1].z, _226);
    float _230 = fma(_216, _210, 0.5);
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = fma(_220, _210, 0.5);
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = -_220;
    float _240 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = fma(_228, _212, 0.5);
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = fma(_224, _212, 0.5);
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = -_236;
    float _254 = _252 + 0.5;
    float _256 = -_216;
    float _258 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = -_232;
    float _264 = _262 + 0.5;
    float _266 = -_224;
    float _268 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = -_228;
    float _274 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = -_246;
    float _280 = _278 + 0.5;
    float _282 = -_250;
    float _284 = _282 + 0.5;
    float _286 = fma(_242, _254, 0.5);
    float _288 = fma(_260, _264, 0.5);
    float _290 = fma(_276, _280, 0.5);
    float _292 = fma(_270, _284, 0.5);
    float _294 = -_286;
    float _296 = _232 + _294;
    float _298 = -_288;
    float _300 = _236 + _298;
    float _302 = -_290;
    float _304 = _250 + _302;
    float _306 = -_292;
    float _308 = _246 + _306;
    float _310 = fma(_260, _296, _286);
    float _312 = fma(_242, _300, _288);
    float _314 = fma(_270, _304, _290);
    float _316 = fma(_276, _308, _292);
    float _318 = _310 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _320 = _312 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _322 = fma(_314, (*spvDescriptorSet0.fp_c3)._m0[6].w, _318);
    float _324 = fma(_316, (*spvDescriptorSet0.fp_c3)._m0[6].w, _320);
    float _326 = _322 + _324;
    float _328 = _326 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _330 = _328 + (-0.5);
    float _332 = _330 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = -_334;
    float _338 = fma(_108, _336, 1.0);
    out.m_38.x = _338;
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
    float2 _371 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_371, float2(0.0), isnan(_371))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_371, float2(0.0), isnan(_371))).x;
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
    float2 _472 = float2(_79, _81);
    float2 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_472, float2(0.0), isnan(_472))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_472, float2(0.0), isnan(_472))).xy;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _102 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _132 = _102 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _134 = _102 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _136 = _102 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _138 = fma(_128, 2.0, -1.0);
    float _140 = fma(_126, 2.0, -1.0);
    float _142 = _138 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _144 = _140 * _130;
    float _146 = _140 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _148 = _140 * _132;
    float _150 = _142 * _130;
    float _152 = _142 * _132;
    float _154 = fma(_138, _134, _144);
    float _156 = fma(_138, _136, _148);
    float _158 = -_150;
    float _160 = fma(_146, _134, _158);
    float _162 = -_152;
    float _164 = fma(_146, _136, _162);
    float _166 = _63 + _154;
    float _168 = _63 + _156;
    float _170 = _61 + _160;
    float _172 = -_160;
    float _174 = _61 + _172;
    float _176 = -_156;
    float _178 = _63 + _176;
    float _180 = -_154;
    float _182 = _63 + _180;
    float _184 = _61 + _164;
    float _186 = -_164;
    float _188 = _61 + _186;
    float2 _581 = float2(_61, _63);
    float _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_581, float2(0.0), isnan(_581))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_581, float2(0.0), isnan(_581))).x;
    float2 _589 = float2(_170, _166);
    float _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_589, float2(0.0), isnan(_589))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_589, float2(0.0), isnan(_589))).x;
    float2 _597 = float2(_174, _182);
    float _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_597, float2(0.0), isnan(_597))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_597, float2(0.0), isnan(_597))).x;
    float2 _605 = float2(_184, _168);
    float _196 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_605, float2(0.0), isnan(_605))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_605, float2(0.0), isnan(_605))).x;
    float2 _613 = float2(_188, _178);
    float _198 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_613, float2(0.0), isnan(_613))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_613, float2(0.0), isnan(_613))).x;
    float _200 = 1.0 / _102;
    float _202 = _200 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _204 = _200 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _206 = _202 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _208 = _204 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _210 = 0.5 * _206;
    float _212 = 0.5 * _208;
    float _214 = -_192;
    float _216 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[1].z, _214);
    float _218 = -_194;
    float _220 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[1].z, _218);
    float _222 = -_196;
    float _224 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[1].z, _222);
    float _226 = -_198;
    float _228 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[1].z, _226);
    float _230 = fma(_216, _210, 0.5);
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = fma(_220, _210, 0.5);
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = -_220;
    float _240 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = fma(_228, _212, 0.5);
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = fma(_224, _212, 0.5);
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = -_236;
    float _254 = _252 + 0.5;
    float _256 = -_216;
    float _258 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = -_232;
    float _264 = _262 + 0.5;
    float _266 = -_224;
    float _268 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = -_228;
    float _274 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = -_246;
    float _280 = _278 + 0.5;
    float _282 = -_250;
    float _284 = _282 + 0.5;
    float _286 = fma(_242, _254, 0.5);
    float _288 = fma(_260, _264, 0.5);
    float _290 = fma(_276, _280, 0.5);
    float _292 = fma(_270, _284, 0.5);
    float _294 = -_286;
    float _296 = _232 + _294;
    float _298 = -_288;
    float _300 = _236 + _298;
    float _302 = -_290;
    float _304 = _250 + _302;
    float _306 = -_292;
    float _308 = _246 + _306;
    float _310 = fma(_260, _296, _286);
    float _312 = fma(_242, _300, _288);
    float _314 = fma(_270, _304, _290);
    float _316 = fma(_276, _308, _292);
    float _318 = _310 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _320 = _312 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _322 = fma(_314, (*spvDescriptorSet0.fp_c3)._m0[6].w, _318);
    float _324 = fma(_316, (*spvDescriptorSet0.fp_c3)._m0[6].w, _320);
    float _326 = _322 + _324;
    float _328 = _326 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _330 = _328 + (-0.5);
    float _332 = _330 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = -_334;
    float _338 = fma(_108, _336, 1.0);
    out.m_38.x = _338;
    return main0_out_u{as_type<uint4>(out.m_38)};
}

