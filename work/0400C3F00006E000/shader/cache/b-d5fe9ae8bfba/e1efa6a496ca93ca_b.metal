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
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _228 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_228, float2(0.0), isnan(_228)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_228, float2(0.0), isnan(_228)), int2(1, 0)).w;
    float2 _241 = float2(_57, _59);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_241, float2(0.0), isnan(_241)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_241, float2(0.0), isnan(_241)), int2(0, 1)).y;
    float2 _250 = float2(_57, _59);
    float2 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_250, float2(0.0), isnan(_250))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_250, float2(0.0), isnan(_250))).xz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _61 + _63;
    float _75 = _71 + _73;
    float _77 = _69 + _75;
    bool _81 = _77 >= (*spvDescriptorSet0.fp_c3)._m0[5].x;
    bool _83 = isnan(_77);
    bool _85 = _81 || _83;
    bool _87 = isnan((*spvDescriptorSet0.fp_c3)._m0[5].x);
    bool _89 = _85 || _87;
    int _92 = as_type<int>(_73);
    int _94 = as_type<int>(_77);
    int _96 = as_type<int>(_55);
    int _98 = 0;
    if (!_89)
    {
        float2 _297 = float2(_57, _59);
        float4 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_297, float2(0.0), isnan(_297))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_297, float2(0.0), isnan(_297))).xyzw;
        float _103 = _101.x;
        float _105 = _101.y;
        float _107 = _101.z;
        float _109 = _101.w;
        _92 = as_type<int>(_103);
        _94 = as_type<int>(_105);
        _96 = as_type<int>(_107);
        _98 = as_type<int>(_109);
    }
    int _111 = _92;
    int _113 = _94;
    int _115 = _96;
    int _117 = _98;
    if (!_89)
    {
        out.m_34.x = as_type<float>(_111);
        out.m_34.y = as_type<float>(_113);
        out.m_34.z = as_type<float>(_115);
        out.m_34.w = as_type<float>(_117);
        return out;
    }
    float _119 = precise::max(_61, _71);
    float _121 = precise::max(_63, _69);
    bool _123 = _119 > _121;
    float _125 = _123 ? _71 : 0.0;
    bool _127 = !_123;
    float _129 = _127 ? _69 : 0.0;
    float _131 = _123 ? _61 : 0.0;
    float _133 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _135 = fma(_125, _133, _57);
    bool _137 = !_123;
    float _139 = _137 ? _63 : 0.0;
    float _141 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _143 = fma(_129, _141, _59);
    float _145 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[0].z, _57);
    float _147 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[0].w, _59);
    float2 _394 = float2(_135, _143);
    float4 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_394, float2(0.0), isnan(_394))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_394, float2(0.0), isnan(_394))).xyzw;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float _157 = _149.w;
    float2 _410 = float2(_145, _147);
    float4 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_410, float2(0.0), isnan(_410))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_410, float2(0.0), isnan(_410))).xyzw;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = _159.z;
    float _167 = _159.w;
    float _169 = _123 ? _61 : _63;
    float _171 = _123 ? _71 : _69;
    float _173 = _169 + _171;
    float _175 = 1.0 / _173;
    float _177 = _171 * _175;
    float _179 = _169 * _175;
    float _181 = _177 * _151;
    float _183 = _177 * _153;
    float _185 = _177 * _155;
    float _187 = _177 * _157;
    float _189 = fma(_179, _161, _181);
    float _191 = fma(_179, _163, _183);
    float _193 = fma(_179, _165, _185);
    float _195 = fma(_179, _167, _187);
    out.m_34.x = _189;
    out.m_34.y = _191;
    out.m_34.z = _193;
    out.m_34.w = _195;
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
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _228 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_228, float2(0.0), isnan(_228)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_228, float2(0.0), isnan(_228)), int2(1, 0)).w;
    float2 _241 = float2(_57, _59);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_241, float2(0.0), isnan(_241)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_241, float2(0.0), isnan(_241)), int2(0, 1)).y;
    float2 _250 = float2(_57, _59);
    float2 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_250, float2(0.0), isnan(_250))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_250, float2(0.0), isnan(_250))).xz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _61 + _63;
    float _75 = _71 + _73;
    float _77 = _69 + _75;
    bool _81 = _77 >= (*spvDescriptorSet0.fp_c3)._m0[5].x;
    bool _83 = isnan(_77);
    bool _85 = _81 || _83;
    bool _87 = isnan((*spvDescriptorSet0.fp_c3)._m0[5].x);
    bool _89 = _85 || _87;
    int _92 = as_type<int>(_73);
    int _94 = as_type<int>(_77);
    int _96 = as_type<int>(_55);
    int _98 = 0;
    if (!_89)
    {
        float2 _297 = float2(_57, _59);
        float4 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_297, float2(0.0), isnan(_297))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_297, float2(0.0), isnan(_297))).xyzw;
        float _103 = _101.x;
        float _105 = _101.y;
        float _107 = _101.z;
        float _109 = _101.w;
        _92 = as_type<int>(_103);
        _94 = as_type<int>(_105);
        _96 = as_type<int>(_107);
        _98 = as_type<int>(_109);
    }
    int _111 = _92;
    int _113 = _94;
    int _115 = _96;
    int _117 = _98;
    if (!_89)
    {
        out.m_34.x = as_type<float>(_111);
        out.m_34.y = as_type<float>(_113);
        out.m_34.z = as_type<float>(_115);
        out.m_34.w = as_type<float>(_117);
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    float _119 = precise::max(_61, _71);
    float _121 = precise::max(_63, _69);
    bool _123 = _119 > _121;
    float _125 = _123 ? _71 : 0.0;
    bool _127 = !_123;
    float _129 = _127 ? _69 : 0.0;
    float _131 = _123 ? _61 : 0.0;
    float _133 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _135 = fma(_125, _133, _57);
    bool _137 = !_123;
    float _139 = _137 ? _63 : 0.0;
    float _141 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _143 = fma(_129, _141, _59);
    float _145 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[0].z, _57);
    float _147 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[0].w, _59);
    float2 _394 = float2(_135, _143);
    float4 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_394, float2(0.0), isnan(_394))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_394, float2(0.0), isnan(_394))).xyzw;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float _157 = _149.w;
    float2 _410 = float2(_145, _147);
    float4 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_410, float2(0.0), isnan(_410))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_410, float2(0.0), isnan(_410))).xyzw;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = _159.z;
    float _167 = _159.w;
    float _169 = _123 ? _61 : _63;
    float _171 = _123 ? _71 : _69;
    float _173 = _169 + _171;
    float _175 = 1.0 / _173;
    float _177 = _171 * _175;
    float _179 = _169 * _175;
    float _181 = _177 * _151;
    float _183 = _177 * _153;
    float _185 = _177 * _155;
    float _187 = _177 * _157;
    float _189 = fma(_179, _161, _181);
    float _191 = fma(_179, _163, _183);
    float _193 = fma(_179, _165, _185);
    float _195 = fma(_179, _167, _187);
    out.m_34.x = _189;
    out.m_34.y = _191;
    out.m_34.z = _193;
    out.m_34.w = _195;
    return main0_out_u{as_type<uint4>(out.m_34)};
}

