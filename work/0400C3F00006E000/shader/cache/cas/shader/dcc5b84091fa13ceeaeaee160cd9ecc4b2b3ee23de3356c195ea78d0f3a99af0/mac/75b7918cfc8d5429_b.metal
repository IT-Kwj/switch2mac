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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d_array<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.z;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _43;
    float _65 = _63 * _49;
    float _67 = _63 * _55;
    float _69 = _63 * _61;
    float _71 = rint(_65);
    float _73 = precise::max(_71, 0.0);
    uint _76 = uint(_73);
    uint _78 = clamp(_76, 0u, 65535u);
    float3 _265 = float3(_69, _67, float(int(_78)));
    float3 _269 = select(_265, float3(0.0), isnan(_265));
    float4 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _269.xy, uint(rint(_269.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _269.xy, uint(rint(_269.z))).xyzw;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = _81.z;
    float _89 = _81.w;
    float _91 = (-0.0) + _89;
    bool _95 = _91 > 0.0;
    bool _97 = isnan(_91);
    bool _99 = _95 || _97;
    bool _101 = isnan(0.0);
    bool _103 = _99 || _101;
    if (!_103)
    {
        discard_fragment();
    }
    if (!_103)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _105 = in.m_36.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_36.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_36.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_36.z;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = (-0.0) + _83;
    float _131 = (-0.0) + _85;
    float _133 = (-0.0) + _87;
    float _135 = _63 * _109;
    float _137 = _63 * _115;
    float _139 = _63 * _121;
    float _141 = _63 * _127;
    bool _143 = _135 > 0.0;
    bool _145 = !_143;
    if (!_145)
    {
        bool _147 = 0 != as_type<int>((*spvDescriptorSet0.fp_c4)._m0[0].x);
        float _149 = _91 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
        bool _151 = !_147;
        float _153 = _151 ? 0.0 : (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _155 = _135 * _149;
        bool _157 = !_147;
        float _159 = _157 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[4].x;
        bool _161 = !_147;
        float _163 = _161 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[4].y;
        bool _165 = !_147;
        float _167 = _165 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[4].z;
        float _169 = fma(_129, _159, _153);
        bool _171 = !_147;
        float _173 = _171 ? 0.0 : (*spvDescriptorSet0.fp_c3)._m0[5].y;
        bool _175 = !_147;
        float _177 = _175 ? 0.0 : (*spvDescriptorSet0.fp_c3)._m0[5].z;
        float _179 = _139 * _169;
        float _181 = fma(_131, _163, _173);
        float _183 = fma(_133, _167, _177);
        float _185 = _137 * _181;
        float _187 = _141 * _183;
        out.m_34.x = _179;
        out.m_34.y = _185;
        out.m_34.z = _187;
        out.m_34.w = _155;
        return out;
    }
    float _189 = _91 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _191 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[7].x);
    float _193 = -_135;
    float _195 = fma(_193, _189, -0.0);
    float _197 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[7].y);
    float _199 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[6].z, (*spvDescriptorSet0.fp_c3)._m0[7].z);
    float _201 = _139 * _191;
    float _203 = _137 * _197;
    float _205 = _141 * _199;
    out.m_34.x = _201;
    out.m_34.y = _203;
    out.m_34.z = _205;
    out.m_34.w = _195;
    return out;
}

