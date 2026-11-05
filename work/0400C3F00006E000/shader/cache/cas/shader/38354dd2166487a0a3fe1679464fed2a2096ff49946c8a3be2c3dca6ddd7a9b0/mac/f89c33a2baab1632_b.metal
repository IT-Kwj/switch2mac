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
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
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
    float2 _241 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_241, float2(0.0), isnan(_241))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_241, float2(0.0), isnan(_241))).x;
    bool _65 = _61 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_65)
    {
        discard_fragment();
    }
    if (_65)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _67 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _69 = precise::clamp(_67, 0.0, 1.0);
    float _71 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _73 = precise::clamp(_71, 0.0, 1.0);
    float _75 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _77 = precise::clamp(_75, 0.0, 1.0);
    bool _79 = _69 != 0.0;
    bool _81 = isnan(_69);
    bool _83 = _79 || _81;
    bool _85 = isnan(0.0);
    bool _87 = _83 || _85;
    bool _89 = !_87;
    if (!_89)
    {
        float _91 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _93 = fma(_69, _91, 1.0);
        float _95 = log2(_93);
        float _97 = _95 + (-1.0);
        float _99 = exp2(_97);
        float _101 = _99 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _103 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[8].x, _57);
        float _105 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[8].y, _59);
        float _107 = -_101;
        float _109 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[8].x, _57);
        float _111 = -_101;
        float _113 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[8].y, _59);
        float _115 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[8].z, _57);
        float _117 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[8].w, _59);
        float _119 = -_101;
        float _121 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[8].z, _57);
        float _123 = -_101;
        float _125 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[8].w, _59);
        float2 _378 = float2(_103, _105);
        float3 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_378, float2(0.0), isnan(_378)), level(_97)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_378, float2(0.0), isnan(_378)), level(_97)).xyz;
        float _131 = _129.x;
        float _133 = _129.y;
        float _135 = _129.z;
        float2 _393 = float2(_109, _113);
        float3 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_393, float2(0.0), isnan(_393)), level(_97)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_393, float2(0.0), isnan(_393)), level(_97)).xyz;
        float _139 = _137.x;
        float _141 = _137.y;
        float _143 = _137.z;
        float2 _408 = float2(_115, _117);
        float3 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_408, float2(0.0), isnan(_408)), level(_97)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_408, float2(0.0), isnan(_408)), level(_97)).xyz;
        float _147 = _145.x;
        float _149 = _145.y;
        float _151 = _145.z;
        float2 _423 = float2(_121, _125);
        float3 _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_423, float2(0.0), isnan(_423)), level(_97)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_423, float2(0.0), isnan(_423)), level(_97)).xyz;
        float _155 = _153.x;
        float _157 = _153.y;
        float _159 = _153.z;
        float _161 = precise::min(_73, _77);
        float _163 = 0.0 + _95;
        float _165 = precise::clamp(_163, 0.0, 1.0);
        float _167 = _133 + _141;
        float _169 = _131 + _139;
        float _171 = _135 + _143;
        float _173 = _167 + _149;
        float _175 = _169 + _147;
        float _177 = _171 + _151;
        float _179 = _173 + _157;
        float _181 = _175 + _155;
        float _183 = _177 + _159;
        float _185 = _179 * 0.25;
        float _187 = _181 * 0.25;
        float _189 = _183 * 0.25;
        float _191 = -_185;
        float _193 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[13].y, _191);
        float _195 = -_187;
        float _197 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[13].x, _195);
        float _199 = -_189;
        float _201 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[13].z, _199);
        float _203 = fma(_161, _193, _185);
        float _205 = fma(_161, _197, _187);
        float _207 = fma(_161, _201, _189);
        out.m_34.x = _205;
        out.m_34.y = _203;
        out.m_34.z = _207;
        out.m_34.w = _165;
        return out;
    }
    discard_fragment();
    return out;
}

