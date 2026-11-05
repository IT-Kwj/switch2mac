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
    float2 _379 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_379, float2(0.0), isnan(_379))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_379, float2(0.0), isnan(_379))).x;
    float2 _390 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_390, float2(0.0), isnan(_390))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_390, float2(0.0), isnan(_390))).x;
    float _69 = in.m_35.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = _59 * _73;
    float _83 = _59 * _79;
    float _85 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _87 = precise::max(_85, (*spvDescriptorSet0.fp_c3)._m0[0].y);
    float _89 = 1.0 / _87;
    bool _93 = _67 >= 0.00999999977648258209228515625;
    bool _95 = isnan(_67);
    bool _97 = _93 || _95;
    bool _99 = isnan(0.00999999977648258209228515625);
    bool _101 = _97 || _99;
    int _104 = as_type<int>(_67);
    if (!_101)
    {
        _104 = 1065353216;
    }
    int _106 = _104;
    float _108 = _89 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
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
    if (!_101)
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
    float2 _503 = float2(_83, _81);
    float2 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_503, float2(0.0), isnan(_503))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_503, float2(0.0), isnan(_503))).xy;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _110 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _142 = _110 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _144 = _110 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _146 = _110 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _148 = fma(_138, 2.0, -1.0);
    float _150 = fma(_136, 2.0, -1.0);
    float _152 = _148 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _154 = _150 * _140;
    float _156 = _150 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _158 = _150 * _142;
    float _160 = _152 * _140;
    float _162 = _152 * _142;
    float _164 = fma(_148, _144, _154);
    float _166 = fma(_148, _146, _158);
    float _168 = -_160;
    float _170 = fma(_156, _144, _168);
    float _172 = -_162;
    float _174 = fma(_156, _146, _172);
    float _176 = _63 + _164;
    float _178 = -_164;
    float _180 = _63 + _178;
    float _182 = _61 + _170;
    float _184 = _63 + _166;
    float _186 = -_166;
    float _188 = _63 + _186;
    float _190 = -_170;
    float _192 = _61 + _190;
    float _194 = _61 + _174;
    float _196 = -_174;
    float _198 = _61 + _196;
    float2 _612 = float2(_182, _176);
    float _200 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_612, float2(0.0), isnan(_612))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_612, float2(0.0), isnan(_612))).x;
    float2 _620 = float2(_192, _180);
    float _202 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_620, float2(0.0), isnan(_620))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_620, float2(0.0), isnan(_620))).x;
    float2 _628 = float2(_194, _184);
    float _204 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_628, float2(0.0), isnan(_628))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_628, float2(0.0), isnan(_628))).x;
    float2 _636 = float2(_198, _188);
    float _206 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_636, float2(0.0), isnan(_636))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_636, float2(0.0), isnan(_636))).x;
    float _208 = 1.0 / _110;
    float _210 = _208 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _212 = _208 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _214 = _210 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _216 = _212 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _218 = 0.5 * _214;
    float _220 = 0.5 * _216;
    float _222 = -_200;
    float _224 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _222);
    float _226 = -_202;
    float _228 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _226);
    float _230 = -_204;
    float _232 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _230);
    float _234 = -_206;
    float _236 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _234);
    float _238 = fma(_228, _218, 0.5);
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = fma(_224, _218, 0.5);
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = -_228;
    float _248 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = fma(_236, _220, 0.5);
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = fma(_232, _220, 0.5);
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = -_240;
    float _262 = _260 + 0.5;
    float _264 = -_224;
    float _266 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = -_232;
    float _272 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = -_244;
    float _278 = _276 + 0.5;
    float _280 = -_236;
    float _282 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = -_254;
    float _288 = _286 + 0.5;
    float _290 = -_258;
    float _292 = _290 + 0.5;
    float _294 = fma(_250, _262, 0.5);
    float _296 = fma(_268, _278, 0.5);
    float _298 = fma(_284, _288, 0.5);
    float _300 = fma(_274, _292, 0.5);
    float _302 = -_294;
    float _304 = _244 + _302;
    float _306 = -_296;
    float _308 = _240 + _306;
    float _310 = -_298;
    float _312 = _258 + _310;
    float _314 = -_300;
    float _316 = _254 + _314;
    float _318 = fma(_268, _304, _294);
    float _320 = fma(_250, _308, _296);
    float _322 = fma(_274, _312, _298);
    float _324 = fma(_284, _316, _300);
    float _326 = _318 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _328 = _320 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _330 = fma(_322, (*spvDescriptorSet0.fp_c3)._m0[6].w, _326);
    float _332 = fma(_324, (*spvDescriptorSet0.fp_c3)._m0[6].w, _328);
    float _334 = _330 + _332;
    float _336 = _334 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _338 = _336 + (-0.5);
    float _340 = _338 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _342 = precise::clamp(_340, 0.0, 1.0);
    float _344 = -_342;
    float _346 = fma(_116, _344, 1.0);
    out.m_38.x = _346;
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
    float2 _379 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_379, float2(0.0), isnan(_379))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_379, float2(0.0), isnan(_379))).x;
    float2 _390 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_390, float2(0.0), isnan(_390))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_390, float2(0.0), isnan(_390))).x;
    float _69 = in.m_35.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = _59 * _73;
    float _83 = _59 * _79;
    float _85 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _87 = precise::max(_85, (*spvDescriptorSet0.fp_c3)._m0[0].y);
    float _89 = 1.0 / _87;
    bool _93 = _67 >= 0.00999999977648258209228515625;
    bool _95 = isnan(_67);
    bool _97 = _93 || _95;
    bool _99 = isnan(0.00999999977648258209228515625);
    bool _101 = _97 || _99;
    int _104 = as_type<int>(_67);
    if (!_101)
    {
        _104 = 1065353216;
    }
    int _106 = _104;
    float _108 = _89 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
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
    if (!_101)
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
    float2 _503 = float2(_83, _81);
    float2 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_503, float2(0.0), isnan(_503))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_503, float2(0.0), isnan(_503))).xy;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _110 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _142 = _110 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _144 = _110 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _146 = _110 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _148 = fma(_138, 2.0, -1.0);
    float _150 = fma(_136, 2.0, -1.0);
    float _152 = _148 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _154 = _150 * _140;
    float _156 = _150 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _158 = _150 * _142;
    float _160 = _152 * _140;
    float _162 = _152 * _142;
    float _164 = fma(_148, _144, _154);
    float _166 = fma(_148, _146, _158);
    float _168 = -_160;
    float _170 = fma(_156, _144, _168);
    float _172 = -_162;
    float _174 = fma(_156, _146, _172);
    float _176 = _63 + _164;
    float _178 = -_164;
    float _180 = _63 + _178;
    float _182 = _61 + _170;
    float _184 = _63 + _166;
    float _186 = -_166;
    float _188 = _63 + _186;
    float _190 = -_170;
    float _192 = _61 + _190;
    float _194 = _61 + _174;
    float _196 = -_174;
    float _198 = _61 + _196;
    float2 _612 = float2(_182, _176);
    float _200 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_612, float2(0.0), isnan(_612))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_612, float2(0.0), isnan(_612))).x;
    float2 _620 = float2(_192, _180);
    float _202 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_620, float2(0.0), isnan(_620))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_620, float2(0.0), isnan(_620))).x;
    float2 _628 = float2(_194, _184);
    float _204 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_628, float2(0.0), isnan(_628))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_628, float2(0.0), isnan(_628))).x;
    float2 _636 = float2(_198, _188);
    float _206 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_636, float2(0.0), isnan(_636))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_636, float2(0.0), isnan(_636))).x;
    float _208 = 1.0 / _110;
    float _210 = _208 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _212 = _208 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _214 = _210 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _216 = _212 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _218 = 0.5 * _214;
    float _220 = 0.5 * _216;
    float _222 = -_200;
    float _224 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _222);
    float _226 = -_202;
    float _228 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _226);
    float _230 = -_204;
    float _232 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _230);
    float _234 = -_206;
    float _236 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _234);
    float _238 = fma(_228, _218, 0.5);
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = fma(_224, _218, 0.5);
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = -_228;
    float _248 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = fma(_236, _220, 0.5);
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = fma(_232, _220, 0.5);
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = -_240;
    float _262 = _260 + 0.5;
    float _264 = -_224;
    float _266 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = -_232;
    float _272 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _274 = precise::clamp(_272, 0.0, 1.0);
    float _276 = -_244;
    float _278 = _276 + 0.5;
    float _280 = -_236;
    float _282 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = -_254;
    float _288 = _286 + 0.5;
    float _290 = -_258;
    float _292 = _290 + 0.5;
    float _294 = fma(_250, _262, 0.5);
    float _296 = fma(_268, _278, 0.5);
    float _298 = fma(_284, _288, 0.5);
    float _300 = fma(_274, _292, 0.5);
    float _302 = -_294;
    float _304 = _244 + _302;
    float _306 = -_296;
    float _308 = _240 + _306;
    float _310 = -_298;
    float _312 = _258 + _310;
    float _314 = -_300;
    float _316 = _254 + _314;
    float _318 = fma(_268, _304, _294);
    float _320 = fma(_250, _308, _296);
    float _322 = fma(_274, _312, _298);
    float _324 = fma(_284, _316, _300);
    float _326 = _318 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _328 = _320 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _330 = fma(_322, (*spvDescriptorSet0.fp_c3)._m0[6].w, _326);
    float _332 = fma(_324, (*spvDescriptorSet0.fp_c3)._m0[6].w, _328);
    float _334 = _330 + _332;
    float _336 = _334 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _338 = _336 + (-0.5);
    float _340 = _338 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _342 = precise::clamp(_340, 0.0, 1.0);
    float _344 = -_342;
    float _346 = fma(_116, _344, 1.0);
    out.m_38.x = _346;
    return main0_out_u{as_type<uint4>(out.m_38)};
}

