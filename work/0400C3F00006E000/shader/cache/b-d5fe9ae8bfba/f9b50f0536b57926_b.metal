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
    constant _16* fp_c24 [[id(0)]];
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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.w;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_31.z;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_33.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_33.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _43;
    float _83 = _81 * _49;
    float _85 = _81 * _55;
    float _87 = _81 * _61;
    float _89 = _81 * _67;
    float _91 = _81 * _73;
    float _93 = _81 * _79;
    float2 _303 = float2(_83, _87);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_303, float2(0.0), isnan(_303))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_303, float2(0.0), isnan(_303))).w;
    float2 _314 = float2(_89, _85);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_314, float2(0.0), isnan(_314))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_314, float2(0.0), isnan(_314))).y;
    float2 _322 = float2(_91, _93);
    float2 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_322, float2(0.0), isnan(_322))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_322, float2(0.0), isnan(_322))).xz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _95 + _97;
    float _109 = _105 + _107;
    float _111 = _103 + _109;
    bool _115 = _111 >= 9.9999997473787516355514526367188e-06;
    bool _117 = isnan(_111);
    bool _119 = _115 || _117;
    bool _121 = isnan(9.9999997473787516355514526367188e-06);
    bool _123 = _119 || _121;
    int _126 = as_type<int>(_107);
    int _128 = as_type<int>(_111);
    int _130 = as_type<int>(_61);
    int _132 = 0;
    if (!_123)
    {
        float2 _364 = float2(_91, _93);
        float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_364, float2(0.0), isnan(_364)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_364, float2(0.0), isnan(_364)), level(0.0)).xyzw;
        float _137 = _135.x;
        float _139 = _135.y;
        float _141 = _135.z;
        float _143 = _135.w;
        _126 = as_type<int>(_137);
        _128 = as_type<int>(_139);
        _130 = as_type<int>(_141);
        _132 = as_type<int>(_143);
    }
    int _145 = _126;
    int _147 = _128;
    int _149 = _130;
    int _151 = _132;
    if (!_123)
    {
        out.m_36.x = as_type<float>(_145);
        out.m_36.y = as_type<float>(_147);
        out.m_36.z = as_type<float>(_149);
        out.m_36.w = as_type<float>(_151);
        return out;
    }
    float _153 = precise::max(_95, _105);
    float _155 = precise::max(_97, _103);
    bool _157 = _153 > _155;
    float _159 = _157 ? _105 : 0.0;
    bool _161 = !_157;
    float _163 = _161 ? _103 : 0.0;
    float _165 = _157 ? _95 : 0.0;
    float _167 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
    float _169 = fma(_159, _167, _91);
    bool _171 = !_157;
    float _173 = _171 ? _97 : 0.0;
    float _175 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
    float _177 = fma(_163, _175, _93);
    float _179 = fma(_165, (*spvDescriptorSet0.fp_c24)._m0[0].x, _91);
    float _181 = fma(_173, (*spvDescriptorSet0.fp_c24)._m0[0].y, _93);
    float2 _461 = float2(_169, _177);
    float4 _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_461, float2(0.0), isnan(_461)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_461, float2(0.0), isnan(_461)), level(0.0)).xyzw;
    float _185 = _183.x;
    float _187 = _183.y;
    float _189 = _183.z;
    float _191 = _183.w;
    float2 _477 = float2(_179, _181);
    float4 _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_477, float2(0.0), isnan(_477)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_477, float2(0.0), isnan(_477)), level(0.0)).xyzw;
    float _195 = _193.x;
    float _197 = _193.y;
    float _199 = _193.z;
    float _201 = _193.w;
    float _203 = _157 ? _95 : _97;
    float _205 = _157 ? _105 : _103;
    float _207 = _203 + _205;
    float _209 = 1.0 / _207;
    float _211 = _205 * _209;
    float _213 = _203 * _209;
    float _215 = _211 * _185;
    float _217 = _211 * _187;
    float _219 = _211 * _189;
    float _221 = _211 * _191;
    float _223 = fma(_213, _195, _215);
    float _225 = fma(_213, _197, _217);
    float _227 = fma(_213, _199, _219);
    float _229 = fma(_213, _201, _221);
    out.m_36.x = _223;
    out.m_36.y = _225;
    out.m_36.z = _227;
    out.m_36.w = _229;
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
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.w;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_31.z;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_33.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_33.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _43;
    float _83 = _81 * _49;
    float _85 = _81 * _55;
    float _87 = _81 * _61;
    float _89 = _81 * _67;
    float _91 = _81 * _73;
    float _93 = _81 * _79;
    float2 _303 = float2(_83, _87);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_303, float2(0.0), isnan(_303))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_303, float2(0.0), isnan(_303))).w;
    float2 _314 = float2(_89, _85);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_314, float2(0.0), isnan(_314))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_314, float2(0.0), isnan(_314))).y;
    float2 _322 = float2(_91, _93);
    float2 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_322, float2(0.0), isnan(_322))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_322, float2(0.0), isnan(_322))).xz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _95 + _97;
    float _109 = _105 + _107;
    float _111 = _103 + _109;
    bool _115 = _111 >= 9.9999997473787516355514526367188e-06;
    bool _117 = isnan(_111);
    bool _119 = _115 || _117;
    bool _121 = isnan(9.9999997473787516355514526367188e-06);
    bool _123 = _119 || _121;
    int _126 = as_type<int>(_107);
    int _128 = as_type<int>(_111);
    int _130 = as_type<int>(_61);
    int _132 = 0;
    if (!_123)
    {
        float2 _364 = float2(_91, _93);
        float4 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_364, float2(0.0), isnan(_364)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_364, float2(0.0), isnan(_364)), level(0.0)).xyzw;
        float _137 = _135.x;
        float _139 = _135.y;
        float _141 = _135.z;
        float _143 = _135.w;
        _126 = as_type<int>(_137);
        _128 = as_type<int>(_139);
        _130 = as_type<int>(_141);
        _132 = as_type<int>(_143);
    }
    int _145 = _126;
    int _147 = _128;
    int _149 = _130;
    int _151 = _132;
    if (!_123)
    {
        out.m_36.x = as_type<float>(_145);
        out.m_36.y = as_type<float>(_147);
        out.m_36.z = as_type<float>(_149);
        out.m_36.w = as_type<float>(_151);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    float _153 = precise::max(_95, _105);
    float _155 = precise::max(_97, _103);
    bool _157 = _153 > _155;
    float _159 = _157 ? _105 : 0.0;
    bool _161 = !_157;
    float _163 = _161 ? _103 : 0.0;
    float _165 = _157 ? _95 : 0.0;
    float _167 = -(*spvDescriptorSet0.fp_c24)._m0[0].x;
    float _169 = fma(_159, _167, _91);
    bool _171 = !_157;
    float _173 = _171 ? _97 : 0.0;
    float _175 = -(*spvDescriptorSet0.fp_c24)._m0[0].y;
    float _177 = fma(_163, _175, _93);
    float _179 = fma(_165, (*spvDescriptorSet0.fp_c24)._m0[0].x, _91);
    float _181 = fma(_173, (*spvDescriptorSet0.fp_c24)._m0[0].y, _93);
    float2 _461 = float2(_169, _177);
    float4 _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_461, float2(0.0), isnan(_461)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_461, float2(0.0), isnan(_461)), level(0.0)).xyzw;
    float _185 = _183.x;
    float _187 = _183.y;
    float _189 = _183.z;
    float _191 = _183.w;
    float2 _477 = float2(_179, _181);
    float4 _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_477, float2(0.0), isnan(_477)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_477, float2(0.0), isnan(_477)), level(0.0)).xyzw;
    float _195 = _193.x;
    float _197 = _193.y;
    float _199 = _193.z;
    float _201 = _193.w;
    float _203 = _157 ? _95 : _97;
    float _205 = _157 ? _105 : _103;
    float _207 = _203 + _205;
    float _209 = 1.0 / _207;
    float _211 = _205 * _209;
    float _213 = _203 * _209;
    float _215 = _211 * _185;
    float _217 = _211 * _187;
    float _219 = _211 * _189;
    float _221 = _211 * _191;
    float _223 = fma(_213, _195, _215);
    float _225 = fma(_213, _197, _217);
    float _227 = fma(_213, _199, _219);
    float _229 = fma(_213, _201, _221);
    out.m_36.x = _223;
    out.m_36.y = _225;
    out.m_36.z = _227;
    out.m_36.w = _229;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

