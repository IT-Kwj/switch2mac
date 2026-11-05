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
    float2 _361 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_361, float2(0.0), isnan(_361))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_361, float2(0.0), isnan(_361))).x;
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
    int _110 = as_type<int>(_91);
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
    float2 _452 = float2(_77, _79);
    float2 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_452, float2(0.0), isnan(_452))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_452, float2(0.0), isnan(_452))).xy;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _89 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _124 = _89 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _126 = _89 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _128 = _89 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _130 = fma(_120, 2.0, -1.0);
    float _132 = fma(_118, 2.0, -1.0);
    float _134 = _130 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _136 = _132 * _122;
    float _138 = _132 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _140 = _132 * _124;
    float _142 = _134 * _122;
    float _144 = _134 * _124;
    float _146 = fma(_130, _126, _136);
    float _148 = fma(_130, _128, _140);
    float _150 = -_142;
    float _152 = fma(_138, _126, _150);
    float _154 = -_144;
    float _156 = fma(_138, _128, _154);
    float _158 = _61 + _146;
    float _160 = -_146;
    float _162 = _61 + _160;
    float _164 = _59 + _152;
    float _166 = _61 + _148;
    float _168 = -_148;
    float _170 = _61 + _168;
    float _172 = -_152;
    float _174 = _59 + _172;
    float _176 = _59 + _156;
    float _178 = -_156;
    float _180 = _59 + _178;
    float2 _561 = float2(_164, _158);
    float _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_561, float2(0.0), isnan(_561))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_561, float2(0.0), isnan(_561))).x;
    float2 _569 = float2(_174, _162);
    float _184 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_569, float2(0.0), isnan(_569))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_569, float2(0.0), isnan(_569))).x;
    float2 _577 = float2(_176, _166);
    float _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_577, float2(0.0), isnan(_577))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_577, float2(0.0), isnan(_577))).x;
    float2 _585 = float2(_180, _170);
    float _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_585, float2(0.0), isnan(_585))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_585, float2(0.0), isnan(_585))).x;
    float _190 = 1.0 / _89;
    float _192 = _190 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _194 = _190 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _196 = _192 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _198 = _194 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _200 = 0.5 * _196;
    float _202 = 0.5 * _198;
    float _204 = -_182;
    float _206 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _204);
    float _208 = -_184;
    float _210 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _208);
    float _212 = -_186;
    float _214 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _212);
    float _216 = -_188;
    float _218 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _216);
    float _220 = fma(_210, _200, 0.5);
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = fma(_206, _200, 0.5);
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = -_210;
    float _230 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = fma(_218, _202, 0.5);
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = fma(_214, _202, 0.5);
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = -_222;
    float _244 = _242 + 0.5;
    float _246 = -_206;
    float _248 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = -_214;
    float _254 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = -_226;
    float _260 = _258 + 0.5;
    float _262 = -_218;
    float _264 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = -_236;
    float _270 = _268 + 0.5;
    float _272 = -_240;
    float _274 = _272 + 0.5;
    float _276 = fma(_232, _244, 0.5);
    float _278 = fma(_250, _260, 0.5);
    float _280 = fma(_266, _270, 0.5);
    float _282 = fma(_256, _274, 0.5);
    float _284 = -_276;
    float _286 = _226 + _284;
    float _288 = -_278;
    float _290 = _222 + _288;
    float _292 = -_280;
    float _294 = _240 + _292;
    float _296 = -_282;
    float _298 = _236 + _296;
    float _300 = fma(_250, _286, _276);
    float _302 = fma(_232, _290, _278);
    float _304 = fma(_256, _294, _280);
    float _306 = fma(_266, _298, _282);
    float _308 = _300 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _310 = _302 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _312 = fma(_304, (*spvDescriptorSet0.fp_c3)._m0[6].w, _308);
    float _314 = fma(_306, (*spvDescriptorSet0.fp_c3)._m0[6].w, _310);
    float _316 = _312 + _314;
    float _318 = _316 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _320 = _318 + (-0.5);
    float _322 = _320 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float _326 = -_324;
    float _328 = fma(_95, _326, 1.0);
    out.m_36.x = _328;
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
    float2 _361 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_361, float2(0.0), isnan(_361))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_361, float2(0.0), isnan(_361))).x;
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
    int _110 = as_type<int>(_91);
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
    float2 _452 = float2(_77, _79);
    float2 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_452, float2(0.0), isnan(_452))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_452, float2(0.0), isnan(_452))).xy;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _89 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _124 = _89 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _126 = _89 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _128 = _89 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _130 = fma(_120, 2.0, -1.0);
    float _132 = fma(_118, 2.0, -1.0);
    float _134 = _130 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _136 = _132 * _122;
    float _138 = _132 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _140 = _132 * _124;
    float _142 = _134 * _122;
    float _144 = _134 * _124;
    float _146 = fma(_130, _126, _136);
    float _148 = fma(_130, _128, _140);
    float _150 = -_142;
    float _152 = fma(_138, _126, _150);
    float _154 = -_144;
    float _156 = fma(_138, _128, _154);
    float _158 = _61 + _146;
    float _160 = -_146;
    float _162 = _61 + _160;
    float _164 = _59 + _152;
    float _166 = _61 + _148;
    float _168 = -_148;
    float _170 = _61 + _168;
    float _172 = -_152;
    float _174 = _59 + _172;
    float _176 = _59 + _156;
    float _178 = -_156;
    float _180 = _59 + _178;
    float2 _561 = float2(_164, _158);
    float _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_561, float2(0.0), isnan(_561))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_561, float2(0.0), isnan(_561))).x;
    float2 _569 = float2(_174, _162);
    float _184 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_569, float2(0.0), isnan(_569))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_569, float2(0.0), isnan(_569))).x;
    float2 _577 = float2(_176, _166);
    float _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_577, float2(0.0), isnan(_577))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_577, float2(0.0), isnan(_577))).x;
    float2 _585 = float2(_180, _170);
    float _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_585, float2(0.0), isnan(_585))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_585, float2(0.0), isnan(_585))).x;
    float _190 = 1.0 / _89;
    float _192 = _190 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _194 = _190 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _196 = _192 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _198 = _194 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _200 = 0.5 * _196;
    float _202 = 0.5 * _198;
    float _204 = -_182;
    float _206 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _204);
    float _208 = -_184;
    float _210 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _208);
    float _212 = -_186;
    float _214 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _212);
    float _216 = -_188;
    float _218 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _216);
    float _220 = fma(_210, _200, 0.5);
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = fma(_206, _200, 0.5);
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = -_210;
    float _230 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = fma(_218, _202, 0.5);
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = fma(_214, _202, 0.5);
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = -_222;
    float _244 = _242 + 0.5;
    float _246 = -_206;
    float _248 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = -_214;
    float _254 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = -_226;
    float _260 = _258 + 0.5;
    float _262 = -_218;
    float _264 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = -_236;
    float _270 = _268 + 0.5;
    float _272 = -_240;
    float _274 = _272 + 0.5;
    float _276 = fma(_232, _244, 0.5);
    float _278 = fma(_250, _260, 0.5);
    float _280 = fma(_266, _270, 0.5);
    float _282 = fma(_256, _274, 0.5);
    float _284 = -_276;
    float _286 = _226 + _284;
    float _288 = -_278;
    float _290 = _222 + _288;
    float _292 = -_280;
    float _294 = _240 + _292;
    float _296 = -_282;
    float _298 = _236 + _296;
    float _300 = fma(_250, _286, _276);
    float _302 = fma(_232, _290, _278);
    float _304 = fma(_256, _294, _280);
    float _306 = fma(_266, _298, _282);
    float _308 = _300 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _310 = _302 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _312 = fma(_304, (*spvDescriptorSet0.fp_c3)._m0[6].w, _308);
    float _314 = fma(_306, (*spvDescriptorSet0.fp_c3)._m0[6].w, _310);
    float _316 = _312 + _314;
    float _318 = _316 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _320 = _318 + (-0.5);
    float _322 = _320 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float _326 = -_324;
    float _328 = fma(_95, _326, 1.0);
    out.m_36.x = _328;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

