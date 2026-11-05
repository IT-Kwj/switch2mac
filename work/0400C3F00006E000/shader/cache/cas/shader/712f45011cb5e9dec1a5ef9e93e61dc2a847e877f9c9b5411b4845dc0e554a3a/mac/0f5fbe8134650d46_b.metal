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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
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
    float _45 = in.m_33.z;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.w;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _59 = _57 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _61 = fma(_59, 0.5, -0.5);
    float _63 = precise::clamp(_61, 0.0, 1.0);
    bool _67 = _63 > 0.0;
    bool _69 = isnan(_63);
    bool _71 = _67 || _69;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    float _77 = 1.0 / _43;
    int _80 = as_type<int>(_59);
    if (!_75)
    {
        _80 = 1065353216;
    }
    int _82 = _80;
    float _84 = _77 * _49;
    float _86 = _77 * _55;
    if (!_75)
    {
        out.m_36.x = as_type<float>(_82);
        return out;
    }
    float2 _399 = float2(_84, _86);
    float2 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_399, float2(0.0), isnan(_399))).xy;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = in.m_33.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_33.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = _57 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _110 = _57 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _112 = _57 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _114 = _57 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _116 = _77 * _100;
    float _118 = _77 * _106;
    float _120 = fma(_94, 2.0, -1.0);
    float _122 = fma(_92, 2.0, -1.0);
    float _124 = _120 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _126 = _122 * _108;
    float _128 = _122 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _130 = _122 * _110;
    float _132 = _124 * _108;
    float _134 = _124 * _110;
    float _136 = fma(_120, _112, _126);
    float _138 = fma(_120, _114, _130);
    float _140 = -_132;
    float _142 = fma(_128, _112, _140);
    float _144 = -_134;
    float _146 = fma(_128, _114, _144);
    float _148 = _118 + _136;
    float _150 = -_136;
    float _152 = _118 + _150;
    float _154 = _116 + _142;
    float _156 = -_142;
    float _158 = _116 + _156;
    float _160 = _118 + _138;
    float _162 = _116 + _146;
    float _164 = -_146;
    float _166 = _116 + _164;
    float _168 = -_138;
    float _170 = _118 + _168;
    float2 _530 = float2(_116, _118);
    float _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_530, float2(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_530, float2(0.0), isnan(_530))).x;
    float2 _538 = float2(_154, _148);
    float _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_538, float2(0.0), isnan(_538))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_538, float2(0.0), isnan(_538))).x;
    float2 _546 = float2(_158, _152);
    float _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_546, float2(0.0), isnan(_546))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_546, float2(0.0), isnan(_546))).x;
    float2 _554 = float2(_162, _160);
    float _178 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_554, float2(0.0), isnan(_554))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_554, float2(0.0), isnan(_554))).x;
    float2 _562 = float2(_166, _170);
    float _180 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_562, float2(0.0), isnan(_562))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_562, float2(0.0), isnan(_562))).x;
    float _182 = 1.0 / _57;
    float _184 = _182 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _186 = _182 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _188 = _184 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _190 = _186 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _192 = 0.5 * _188;
    float _194 = 0.5 * _190;
    float _196 = -_174;
    float _198 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[1].z, _196);
    float _200 = -_176;
    float _202 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[1].z, _200);
    float _204 = -_178;
    float _206 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[1].z, _204);
    float _208 = -_180;
    float _210 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[1].z, _208);
    float _212 = fma(_198, _192, 0.5);
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = fma(_202, _192, 0.5);
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = -_202;
    float _222 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = fma(_210, _194, 0.5);
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = fma(_206, _194, 0.5);
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = -_218;
    float _236 = _234 + 0.5;
    float _238 = -_198;
    float _240 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = -_214;
    float _246 = _244 + 0.5;
    float _248 = -_206;
    float _250 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = -_210;
    float _256 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = -_228;
    float _262 = _260 + 0.5;
    float _264 = -_232;
    float _266 = _264 + 0.5;
    float _268 = fma(_224, _236, 0.5);
    float _270 = fma(_242, _246, 0.5);
    float _272 = fma(_258, _262, 0.5);
    float _274 = fma(_252, _266, 0.5);
    float _276 = -_268;
    float _278 = _214 + _276;
    float _280 = -_270;
    float _282 = _218 + _280;
    float _284 = -_272;
    float _286 = _232 + _284;
    float _288 = -_274;
    float _290 = _228 + _288;
    float _292 = fma(_242, _278, _268);
    float _294 = fma(_224, _282, _270);
    float _296 = fma(_252, _286, _272);
    float _298 = fma(_258, _290, _274);
    float _300 = _292 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _302 = _294 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _304 = fma(_296, (*spvDescriptorSet0.fp_c3)._m0[6].w, _300);
    float _306 = fma(_298, (*spvDescriptorSet0.fp_c3)._m0[6].w, _302);
    float _308 = _304 + _306;
    float _310 = _308 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _312 = _310 + (-0.5);
    float _314 = _312 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = -_316;
    float _320 = fma(_63, _318, 1.0);
    out.m_36.x = _320;
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
    float _45 = in.m_33.z;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.w;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _59 = _57 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _61 = fma(_59, 0.5, -0.5);
    float _63 = precise::clamp(_61, 0.0, 1.0);
    bool _67 = _63 > 0.0;
    bool _69 = isnan(_63);
    bool _71 = _67 || _69;
    bool _73 = isnan(0.0);
    bool _75 = _71 || _73;
    float _77 = 1.0 / _43;
    int _80 = as_type<int>(_59);
    if (!_75)
    {
        _80 = 1065353216;
    }
    int _82 = _80;
    float _84 = _77 * _49;
    float _86 = _77 * _55;
    if (!_75)
    {
        out.m_36.x = as_type<float>(_82);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    float2 _399 = float2(_84, _86);
    float2 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_399, float2(0.0), isnan(_399))).xy;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = in.m_33.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_33.y;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = _57 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _110 = _57 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _112 = _57 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _114 = _57 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _116 = _77 * _100;
    float _118 = _77 * _106;
    float _120 = fma(_94, 2.0, -1.0);
    float _122 = fma(_92, 2.0, -1.0);
    float _124 = _120 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _126 = _122 * _108;
    float _128 = _122 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _130 = _122 * _110;
    float _132 = _124 * _108;
    float _134 = _124 * _110;
    float _136 = fma(_120, _112, _126);
    float _138 = fma(_120, _114, _130);
    float _140 = -_132;
    float _142 = fma(_128, _112, _140);
    float _144 = -_134;
    float _146 = fma(_128, _114, _144);
    float _148 = _118 + _136;
    float _150 = -_136;
    float _152 = _118 + _150;
    float _154 = _116 + _142;
    float _156 = -_142;
    float _158 = _116 + _156;
    float _160 = _118 + _138;
    float _162 = _116 + _146;
    float _164 = -_146;
    float _166 = _116 + _164;
    float _168 = -_138;
    float _170 = _118 + _168;
    float2 _530 = float2(_116, _118);
    float _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_530, float2(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_530, float2(0.0), isnan(_530))).x;
    float2 _538 = float2(_154, _148);
    float _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_538, float2(0.0), isnan(_538))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_538, float2(0.0), isnan(_538))).x;
    float2 _546 = float2(_158, _152);
    float _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_546, float2(0.0), isnan(_546))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_546, float2(0.0), isnan(_546))).x;
    float2 _554 = float2(_162, _160);
    float _178 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_554, float2(0.0), isnan(_554))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_554, float2(0.0), isnan(_554))).x;
    float2 _562 = float2(_166, _170);
    float _180 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_562, float2(0.0), isnan(_562))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_562, float2(0.0), isnan(_562))).x;
    float _182 = 1.0 / _57;
    float _184 = _182 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _186 = _182 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _188 = _184 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _190 = _186 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _192 = 0.5 * _188;
    float _194 = 0.5 * _190;
    float _196 = -_174;
    float _198 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[1].z, _196);
    float _200 = -_176;
    float _202 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[1].z, _200);
    float _204 = -_178;
    float _206 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[1].z, _204);
    float _208 = -_180;
    float _210 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[1].z, _208);
    float _212 = fma(_198, _192, 0.5);
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = fma(_202, _192, 0.5);
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = -_202;
    float _222 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = fma(_210, _194, 0.5);
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = fma(_206, _194, 0.5);
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = -_218;
    float _236 = _234 + 0.5;
    float _238 = -_198;
    float _240 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = -_214;
    float _246 = _244 + 0.5;
    float _248 = -_206;
    float _250 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = -_210;
    float _256 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = -_228;
    float _262 = _260 + 0.5;
    float _264 = -_232;
    float _266 = _264 + 0.5;
    float _268 = fma(_224, _236, 0.5);
    float _270 = fma(_242, _246, 0.5);
    float _272 = fma(_258, _262, 0.5);
    float _274 = fma(_252, _266, 0.5);
    float _276 = -_268;
    float _278 = _214 + _276;
    float _280 = -_270;
    float _282 = _218 + _280;
    float _284 = -_272;
    float _286 = _232 + _284;
    float _288 = -_274;
    float _290 = _228 + _288;
    float _292 = fma(_242, _278, _268);
    float _294 = fma(_224, _282, _270);
    float _296 = fma(_252, _286, _272);
    float _298 = fma(_258, _290, _274);
    float _300 = _292 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _302 = _294 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _304 = fma(_296, (*spvDescriptorSet0.fp_c3)._m0[6].w, _300);
    float _306 = fma(_298, (*spvDescriptorSet0.fp_c3)._m0[6].w, _302);
    float _308 = _304 + _306;
    float _310 = _308 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _312 = _310 + (-0.5);
    float _314 = _312 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = -_316;
    float _320 = fma(_63, _318, 1.0);
    out.m_36.x = _320;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

