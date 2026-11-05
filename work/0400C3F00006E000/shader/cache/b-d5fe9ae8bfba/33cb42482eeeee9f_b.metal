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

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    sampler fp_t_tcb_8Smplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_26 [[color(0)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _33 = gl_FragCoord.w;
    float _35 = in.m_23.x;
    float _37 = gl_FragCoord.w;
    float _39 = _35 * _37;
    float _41 = in.m_23.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = 1.0 / _33;
    float _49 = _47 * _39;
    float _51 = _47 * _45;
    float2 _289 = float2(_49, _51);
    float4 _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_289, float2(0.0), isnan(_289)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_289, float2(0.0), isnan(_289)), level(0.0)).xyzw;
    float _56 = _54.x;
    float _58 = _54.y;
    float _60 = _54.z;
    float _62 = _54.w;
    float _64 = _49 + (-0.001953125);
    float _66 = _51 + (-0.001953125);
    float _68 = _51 + 0.001953125;
    float _70 = _49 + 0.001953125;
    bool _74 = _62 >= 0.001000000047497451305389404296875;
    bool _76 = isnan(_62);
    bool _78 = _74 || _76;
    bool _80 = isnan(0.001000000047497451305389404296875);
    bool _82 = _78 || _80;
    if (!_82)
    {
        discard_fragment();
    }
    float2 _334 = float2(_64, _66);
    float3 _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_334, float2(0.0), isnan(_334)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_334, float2(0.0), isnan(_334)), level(0.0)).xyz;
    float _88 = _86.x;
    float _90 = _86.y;
    float _92 = _86.z;
    float2 _348 = float2(_64, _68);
    float3 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_348, float2(0.0), isnan(_348)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_348, float2(0.0), isnan(_348)), level(0.0)).xyz;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float2 _362 = float2(_70, _68);
    float3 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_362, float2(0.0), isnan(_362)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_362, float2(0.0), isnan(_362)), level(0.0)).xyz;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float2 _376 = float2(_70, _66);
    float3 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_376, float2(0.0), isnan(_376)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_376, float2(0.0), isnan(_376)), level(0.0)).xyz;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    if (!_82)
    {
        out.m_26.x = 0.0;
        out.m_26.y = 0.0;
        out.m_26.z = 0.0;
        out.m_26.w = 0.0;
        return out;
    }
    float _118 = _49 * 32.0;
    float _120 = _92 + _100;
    float _122 = floor(_118);
    float _124 = _108 + _120;
    float _126 = _116 + _124;
    float _128 = -_118;
    float _130 = _128 + _122;
    float _132 = _130 + 1.0;
    float _134 = abs(_132);
    bool _136 = _134 >= 0.0500000007450580596923828125;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan(0.0500000007450580596923828125);
    bool _144 = _140 || _142;
    float _146 = _132;
    float _148 = _122;
    if (_144)
    {
        float _150 = _51 * 32.0;
        _146 = _150;
    }
    float _152 = _146;
    float _154 = 0.0;
    int _157 = as_type<int>(_152);
    if (_144)
    {
        float _159 = floor(_152);
        _154 = _159;
    }
    float _161 = _154;
    float _163 = _161;
    if (_144)
    {
        float _165 = -_152;
        float _167 = _165 + _161;
        _163 = _167;
    }
    float _169 = _163;
    float _171 = _169;
    if (_144)
    {
        float _173 = _169 + 1.0;
        _171 = _173;
    }
    float _175 = _171;
    float _177 = abs(_175);
    bool _179 = _177 < 0.0500000007450580596923828125;
    bool _181 = !_144;
    bool _183 = _179 || _181;
    float _185 = _175;
    if (!_183)
    {
        float _187 = -_122;
        float _189 = _118 + _187;
        _148 = _189;
    }
    float _191 = _148;
    bool _193 = _191 < 0.0500000007450580596923828125;
    bool _195 = _193 || _183;
    float _197 = _88 + _96;
    float _199 = _104 + _197;
    int _201 = as_type<int>(_199);
    if (!_195)
    {
        float _203 = _51 * 32.0;
        _185 = _203;
    }
    float _205 = _185;
    float _207 = _118;
    int _209 = as_type<int>(_205);
    if (!_195)
    {
        float _211 = floor(_205);
        _207 = _211;
    }
    float _213 = _207;
    float _215 = _213;
    if (!_195)
    {
        float _217 = -_213;
        float _219 = _205 + _217;
        _215 = _219;
    }
    float _221 = _215;
    bool _223 = _221 < 0.0500000007450580596923828125;
    bool _225 = _223 || _195;
    float _227 = _90 + _98;
    float _229 = _112 + _199;
    float _231 = _106 + _227;
    float _233 = _114 + _231;
    int _235 = as_type<int>(_231);
    if (_225)
    {
        _235 = as_type<int>(_49);
    }
    int _237 = _235;
    if (_225)
    {
        _201 = as_type<int>(_51);
    }
    int _239 = _201;
    if (_225)
    {
        _157 = 0;
    }
    int _241 = _157;
    if (_225)
    {
        _209 = 1065353216;
    }
    int _243 = _209;
    if (_225)
    {
        out.m_26.x = as_type<float>(_237);
        out.m_26.y = as_type<float>(_239);
        out.m_26.z = as_type<float>(_241);
        out.m_26.w = as_type<float>(_243);
        return out;
    }
    float _245 = fma(_56, 2.0, _229);
    float _247 = fma(_58, 2.0, _233);
    float _249 = fma(_60, 2.0, _126);
    float _251 = _245 * 0.16665999591350555419921875;
    float _253 = _247 * 0.16665999591350555419921875;
    float _255 = _249 * 0.16665999591350555419921875;
    out.m_26.x = _251;
    out.m_26.y = _253;
    out.m_26.z = _255;
    out.m_26.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_26 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _33 = gl_FragCoord.w;
    float _35 = in.m_23.x;
    float _37 = gl_FragCoord.w;
    float _39 = _35 * _37;
    float _41 = in.m_23.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = 1.0 / _33;
    float _49 = _47 * _39;
    float _51 = _47 * _45;
    float2 _289 = float2(_49, _51);
    float4 _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_289, float2(0.0), isnan(_289)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_289, float2(0.0), isnan(_289)), level(0.0)).xyzw;
    float _56 = _54.x;
    float _58 = _54.y;
    float _60 = _54.z;
    float _62 = _54.w;
    float _64 = _49 + (-0.001953125);
    float _66 = _51 + (-0.001953125);
    float _68 = _51 + 0.001953125;
    float _70 = _49 + 0.001953125;
    bool _74 = _62 >= 0.001000000047497451305389404296875;
    bool _76 = isnan(_62);
    bool _78 = _74 || _76;
    bool _80 = isnan(0.001000000047497451305389404296875);
    bool _82 = _78 || _80;
    if (!_82)
    {
        discard_fragment();
    }
    float2 _334 = float2(_64, _66);
    float3 _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_334, float2(0.0), isnan(_334)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_334, float2(0.0), isnan(_334)), level(0.0)).xyz;
    float _88 = _86.x;
    float _90 = _86.y;
    float _92 = _86.z;
    float2 _348 = float2(_64, _68);
    float3 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_348, float2(0.0), isnan(_348)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_348, float2(0.0), isnan(_348)), level(0.0)).xyz;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float2 _362 = float2(_70, _68);
    float3 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_362, float2(0.0), isnan(_362)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_362, float2(0.0), isnan(_362)), level(0.0)).xyz;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float2 _376 = float2(_70, _66);
    float3 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_376, float2(0.0), isnan(_376)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_376, float2(0.0), isnan(_376)), level(0.0)).xyz;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    if (!_82)
    {
        out.m_26.x = 0.0;
        out.m_26.y = 0.0;
        out.m_26.z = 0.0;
        out.m_26.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_26)};
    }
    float _118 = _49 * 32.0;
    float _120 = _92 + _100;
    float _122 = floor(_118);
    float _124 = _108 + _120;
    float _126 = _116 + _124;
    float _128 = -_118;
    float _130 = _128 + _122;
    float _132 = _130 + 1.0;
    float _134 = abs(_132);
    bool _136 = _134 >= 0.0500000007450580596923828125;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan(0.0500000007450580596923828125);
    bool _144 = _140 || _142;
    float _146 = _132;
    float _148 = _122;
    if (_144)
    {
        float _150 = _51 * 32.0;
        _146 = _150;
    }
    float _152 = _146;
    float _154 = 0.0;
    int _157 = as_type<int>(_152);
    if (_144)
    {
        float _159 = floor(_152);
        _154 = _159;
    }
    float _161 = _154;
    float _163 = _161;
    if (_144)
    {
        float _165 = -_152;
        float _167 = _165 + _161;
        _163 = _167;
    }
    float _169 = _163;
    float _171 = _169;
    if (_144)
    {
        float _173 = _169 + 1.0;
        _171 = _173;
    }
    float _175 = _171;
    float _177 = abs(_175);
    bool _179 = _177 < 0.0500000007450580596923828125;
    bool _181 = !_144;
    bool _183 = _179 || _181;
    float _185 = _175;
    if (!_183)
    {
        float _187 = -_122;
        float _189 = _118 + _187;
        _148 = _189;
    }
    float _191 = _148;
    bool _193 = _191 < 0.0500000007450580596923828125;
    bool _195 = _193 || _183;
    float _197 = _88 + _96;
    float _199 = _104 + _197;
    int _201 = as_type<int>(_199);
    if (!_195)
    {
        float _203 = _51 * 32.0;
        _185 = _203;
    }
    float _205 = _185;
    float _207 = _118;
    int _209 = as_type<int>(_205);
    if (!_195)
    {
        float _211 = floor(_205);
        _207 = _211;
    }
    float _213 = _207;
    float _215 = _213;
    if (!_195)
    {
        float _217 = -_213;
        float _219 = _205 + _217;
        _215 = _219;
    }
    float _221 = _215;
    bool _223 = _221 < 0.0500000007450580596923828125;
    bool _225 = _223 || _195;
    float _227 = _90 + _98;
    float _229 = _112 + _199;
    float _231 = _106 + _227;
    float _233 = _114 + _231;
    int _235 = as_type<int>(_231);
    if (_225)
    {
        _235 = as_type<int>(_49);
    }
    int _237 = _235;
    if (_225)
    {
        _201 = as_type<int>(_51);
    }
    int _239 = _201;
    if (_225)
    {
        _157 = 0;
    }
    int _241 = _157;
    if (_225)
    {
        _209 = 1065353216;
    }
    int _243 = _209;
    if (_225)
    {
        out.m_26.x = as_type<float>(_237);
        out.m_26.y = as_type<float>(_239);
        out.m_26.z = as_type<float>(_241);
        out.m_26.w = as_type<float>(_243);
        return main0_out_u{as_type<uint4>(out.m_26)};
    }
    float _245 = fma(_56, 2.0, _229);
    float _247 = fma(_58, 2.0, _233);
    float _249 = fma(_60, 2.0, _126);
    float _251 = _245 * 0.16665999591350555419921875;
    float _253 = _247 * 0.16665999591350555419921875;
    float _255 = _249 * 0.16665999591350555419921875;
    out.m_26.x = _251;
    out.m_26.y = _253;
    out.m_26.z = _255;
    out.m_26.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_26)};
}

