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
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float2 _336 = float2(0.5);
    float2 _51 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_336, float2(0.0), isnan(_336))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_336, float2(0.0), isnan(_336))).xw;
    float _53 = _51.x;
    float _55 = _51.y;
    float _57 = 1.0 / _41;
    float _59 = _57 * _47;
    float2 _356 = float2(_59, 0.5);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_356, float2(0.0), isnan(_356))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_356, float2(0.0), isnan(_356))).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float _72 = in.m_31.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = (*spvDescriptorSet0.fp_c3)._m0[0].z * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _80 = (*spvDescriptorSet0.fp_c3)._m0[0].z * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _82 = abs(_78);
    float _84 = log2(_82);
    float _86 = abs(_80);
    float _88 = log2(_86);
    float _90 = _84 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _92 = _57 * _76;
    float _94 = exp2(_90);
    float _96 = _88 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _98 = -_92;
    float _100 = _98 + 1.0;
    bool _104 = _92 > 0.5;
    float _106 = exp2(_96);
    float _108 = _57;
    if (_104)
    {
        _108 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _110 = _108;
    float _112 = _110;
    if (_104)
    {
        float _114 = -_59;
        float _116 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[0].z, _114);
        _112 = _116;
    }
    float _118 = _112;
    float _120 = abs(_118);
    bool _122 = _120 < 0.00999999977648258209228515625;
    bool _124 = _122 && _104;
    float _126 = _118;
    if (_104)
    {
        float _128 = -_59;
        float _130 = _128 + _53;
        _126 = _130;
    }
    float _132 = _126;
    float _134 = -_59;
    float _136 = fma(_53, _55, _134);
    float _138 = -_59;
    float _140 = _138 + _94;
    float _142 = -_59;
    float _144 = _142 + _106;
    float _146 = abs(_132);
    bool _148 = _146 < 0.00999999977648258209228515625;
    bool _150 = _148 && _104;
    float _152 = abs(_136);
    bool _154 = _152 >= 0.00999999977648258209228515625;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan(0.00999999977648258209228515625);
    bool _162 = _158 || _160;
    float _164 = abs(_136);
    bool _166 = _164 < 0.00999999977648258209228515625;
    bool _168 = _166 || _124;
    float _170 = abs(_140);
    bool _172 = _170 >= 0.00999999977648258209228515625;
    bool _174 = isnan(_170);
    bool _176 = _172 || _174;
    bool _178 = isnan(0.00999999977648258209228515625);
    bool _180 = _176 || _178;
    float _182 = abs(_140);
    bool _184 = _182 < 0.00999999977648258209228515625;
    bool _186 = _184 || _168;
    bool _188 = _64 >= _100;
    bool _190 = isnan(_64);
    bool _192 = _188 || _190;
    bool _194 = isnan(_100);
    bool _196 = _192 || _194;
    bool _198 = _64 < _100;
    bool _200 = !_150;
    bool _202 = _198 && _200;
    bool _204 = !_196;
    int _207 = _204 ? as_type<int>(_66) : 1065353216;
    float _209 = abs(_136);
    bool _211 = _209 >= 0.00999999977648258209228515625;
    bool _213 = isnan(_209);
    bool _215 = _211 || _213;
    bool _217 = isnan(0.00999999977648258209228515625);
    bool _219 = _215 || _217;
    bool _221 = _219 && _202;
    bool _223 = !_196;
    int _225 = _223 ? as_type<int>(_64) : 1065353216;
    bool _227 = !_150;
    int _229 = _227 ? _207 : 1056964608;
    bool _231 = !_124;
    bool _233 = _221 && _231;
    bool _235 = !_196;
    int _237 = _235 ? as_type<int>(_68) : 1065353216;
    bool _239 = !_150;
    int _241 = _239 ? _225 : 1056964608;
    int _243 = _162 ? _229 : 1063675494;
    float _245 = abs(_140);
    bool _247 = _245 >= 0.00999999977648258209228515625;
    bool _249 = isnan(_245);
    bool _251 = _247 || _249;
    bool _253 = isnan(0.00999999977648258209228515625);
    bool _255 = _251 || _253;
    bool _257 = _255 && _233;
    bool _259 = !_150;
    int _261 = _259 ? _237 : 1050253722;
    int _263 = _162 ? _241 : 1063675494;
    bool _265 = !_124;
    int _267 = _265 ? _243 : 1056964608;
    float _269 = abs(_144);
    bool _271 = _269 >= 0.00999999977648258209228515625;
    bool _273 = isnan(_269);
    bool _275 = _271 || _273;
    bool _277 = isnan(0.00999999977648258209228515625);
    bool _279 = _275 || _277;
    float _281 = abs(_144);
    bool _283 = _281 < 0.00999999977648258209228515625;
    bool _285 = !_180;
    bool _287 = _283 || _285;
    float _289 = abs(_144);
    bool _291 = _289 >= 0.00999999977648258209228515625;
    bool _293 = isnan(_289);
    bool _295 = _291 || _293;
    bool _297 = isnan(0.00999999977648258209228515625);
    bool _299 = _295 || _297;
    bool _301 = _299 && _257;
    bool _303 = !_124;
    int _305 = _303 ? _263 : 1061997773;
    int _307 = _180 ? _267 : 1065353216;
    bool _309 = !_186;
    int _311 = _309 ? _261 : 0;
    bool _313 = !_287;
    int _315 = _313 ? _305 : 0;
    int _317 = _279 ? _307 : 0;
    int _319 = _279 ? _311 : 1065353216;
    int _321 = _301 ? as_type<int>(_70) : 0;
    out.m_34.x = as_type<float>(_315);
    out.m_34.y = as_type<float>(_317);
    out.m_34.z = as_type<float>(_319);
    out.m_34.w = as_type<float>(_321);
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float2 _336 = float2(0.5);
    float2 _51 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_336, float2(0.0), isnan(_336))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_336, float2(0.0), isnan(_336))).xw;
    float _53 = _51.x;
    float _55 = _51.y;
    float _57 = 1.0 / _41;
    float _59 = _57 * _47;
    float2 _356 = float2(_59, 0.5);
    float4 _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_356, float2(0.0), isnan(_356))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_356, float2(0.0), isnan(_356))).xyzw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float _70 = _62.w;
    float _72 = in.m_31.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = (*spvDescriptorSet0.fp_c3)._m0[0].z * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _80 = (*spvDescriptorSet0.fp_c3)._m0[0].z * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _82 = abs(_78);
    float _84 = log2(_82);
    float _86 = abs(_80);
    float _88 = log2(_86);
    float _90 = _84 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _92 = _57 * _76;
    float _94 = exp2(_90);
    float _96 = _88 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _98 = -_92;
    float _100 = _98 + 1.0;
    bool _104 = _92 > 0.5;
    float _106 = exp2(_96);
    float _108 = _57;
    if (_104)
    {
        _108 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _110 = _108;
    float _112 = _110;
    if (_104)
    {
        float _114 = -_59;
        float _116 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[0].z, _114);
        _112 = _116;
    }
    float _118 = _112;
    float _120 = abs(_118);
    bool _122 = _120 < 0.00999999977648258209228515625;
    bool _124 = _122 && _104;
    float _126 = _118;
    if (_104)
    {
        float _128 = -_59;
        float _130 = _128 + _53;
        _126 = _130;
    }
    float _132 = _126;
    float _134 = -_59;
    float _136 = fma(_53, _55, _134);
    float _138 = -_59;
    float _140 = _138 + _94;
    float _142 = -_59;
    float _144 = _142 + _106;
    float _146 = abs(_132);
    bool _148 = _146 < 0.00999999977648258209228515625;
    bool _150 = _148 && _104;
    float _152 = abs(_136);
    bool _154 = _152 >= 0.00999999977648258209228515625;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan(0.00999999977648258209228515625);
    bool _162 = _158 || _160;
    float _164 = abs(_136);
    bool _166 = _164 < 0.00999999977648258209228515625;
    bool _168 = _166 || _124;
    float _170 = abs(_140);
    bool _172 = _170 >= 0.00999999977648258209228515625;
    bool _174 = isnan(_170);
    bool _176 = _172 || _174;
    bool _178 = isnan(0.00999999977648258209228515625);
    bool _180 = _176 || _178;
    float _182 = abs(_140);
    bool _184 = _182 < 0.00999999977648258209228515625;
    bool _186 = _184 || _168;
    bool _188 = _64 >= _100;
    bool _190 = isnan(_64);
    bool _192 = _188 || _190;
    bool _194 = isnan(_100);
    bool _196 = _192 || _194;
    bool _198 = _64 < _100;
    bool _200 = !_150;
    bool _202 = _198 && _200;
    bool _204 = !_196;
    int _207 = _204 ? as_type<int>(_66) : 1065353216;
    float _209 = abs(_136);
    bool _211 = _209 >= 0.00999999977648258209228515625;
    bool _213 = isnan(_209);
    bool _215 = _211 || _213;
    bool _217 = isnan(0.00999999977648258209228515625);
    bool _219 = _215 || _217;
    bool _221 = _219 && _202;
    bool _223 = !_196;
    int _225 = _223 ? as_type<int>(_64) : 1065353216;
    bool _227 = !_150;
    int _229 = _227 ? _207 : 1056964608;
    bool _231 = !_124;
    bool _233 = _221 && _231;
    bool _235 = !_196;
    int _237 = _235 ? as_type<int>(_68) : 1065353216;
    bool _239 = !_150;
    int _241 = _239 ? _225 : 1056964608;
    int _243 = _162 ? _229 : 1063675494;
    float _245 = abs(_140);
    bool _247 = _245 >= 0.00999999977648258209228515625;
    bool _249 = isnan(_245);
    bool _251 = _247 || _249;
    bool _253 = isnan(0.00999999977648258209228515625);
    bool _255 = _251 || _253;
    bool _257 = _255 && _233;
    bool _259 = !_150;
    int _261 = _259 ? _237 : 1050253722;
    int _263 = _162 ? _241 : 1063675494;
    bool _265 = !_124;
    int _267 = _265 ? _243 : 1056964608;
    float _269 = abs(_144);
    bool _271 = _269 >= 0.00999999977648258209228515625;
    bool _273 = isnan(_269);
    bool _275 = _271 || _273;
    bool _277 = isnan(0.00999999977648258209228515625);
    bool _279 = _275 || _277;
    float _281 = abs(_144);
    bool _283 = _281 < 0.00999999977648258209228515625;
    bool _285 = !_180;
    bool _287 = _283 || _285;
    float _289 = abs(_144);
    bool _291 = _289 >= 0.00999999977648258209228515625;
    bool _293 = isnan(_289);
    bool _295 = _291 || _293;
    bool _297 = isnan(0.00999999977648258209228515625);
    bool _299 = _295 || _297;
    bool _301 = _299 && _257;
    bool _303 = !_124;
    int _305 = _303 ? _263 : 1061997773;
    int _307 = _180 ? _267 : 1065353216;
    bool _309 = !_186;
    int _311 = _309 ? _261 : 0;
    bool _313 = !_287;
    int _315 = _313 ? _305 : 0;
    int _317 = _279 ? _307 : 0;
    int _319 = _279 ? _311 : 1065353216;
    int _321 = _301 ? as_type<int>(_70) : 0;
    out.m_34.x = as_type<float>(_315);
    out.m_34.y = as_type<float>(_317);
    out.m_34.z = as_type<float>(_319);
    out.m_34.w = as_type<float>(_321);
    return main0_out_u{as_type<uint4>(out.m_34)};
}

