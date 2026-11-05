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
    float2 _239 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_239, float2(0.0), isnan(_239))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_239, float2(0.0), isnan(_239))).x;
    float _63 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _65 = precise::clamp(_63, 0.0, 1.0);
    float _67 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _69 = precise::clamp(_67, 0.0, 1.0);
    float _71 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _73 = precise::clamp(_71, 0.0, 1.0);
    bool _77 = _65 != 0.0;
    bool _79 = isnan(_65);
    bool _81 = _77 || _79;
    bool _83 = isnan(0.0);
    bool _85 = _81 || _83;
    bool _87 = !_85;
    if (!_87)
    {
        float _89 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _91 = fma(_65, _89, 1.0);
        float _93 = log2(_91);
        float _95 = _93 + (-1.0);
        float _97 = exp2(_95);
        float _99 = _97 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _101 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[8].x, _57);
        float _103 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[8].y, _59);
        float _105 = -_99;
        float _107 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[8].x, _57);
        float _109 = -_99;
        float _111 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[8].y, _59);
        float _113 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[8].z, _57);
        float _115 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[8].w, _59);
        float _117 = -_99;
        float _119 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[8].z, _57);
        float _121 = -_99;
        float _123 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[8].w, _59);
        float2 _361 = float2(_101, _103);
        float3 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_361, float2(0.0), isnan(_361)), level(_95)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_361, float2(0.0), isnan(_361)), level(_95)).xyz;
        float _129 = _127.x;
        float _131 = _127.y;
        float _133 = _127.z;
        float2 _376 = float2(_107, _111);
        float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_376, float2(0.0), isnan(_376)), level(_95)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_376, float2(0.0), isnan(_376)), level(_95)).xyz;
        float _137 = _135.x;
        float _139 = _135.y;
        float _141 = _135.z;
        float2 _391 = float2(_113, _115);
        float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_391, float2(0.0), isnan(_391)), level(_95)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_391, float2(0.0), isnan(_391)), level(_95)).xyz;
        float _145 = _143.x;
        float _147 = _143.y;
        float _149 = _143.z;
        float2 _406 = float2(_119, _123);
        float3 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_406, float2(0.0), isnan(_406)), level(_95)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_406, float2(0.0), isnan(_406)), level(_95)).xyz;
        float _153 = _151.x;
        float _155 = _151.y;
        float _157 = _151.z;
        float _159 = precise::min(_69, _73);
        float _161 = 0.0 + _93;
        float _163 = precise::clamp(_161, 0.0, 1.0);
        float _165 = _131 + _139;
        float _167 = _129 + _137;
        float _169 = _133 + _141;
        float _171 = _165 + _147;
        float _173 = _167 + _145;
        float _175 = _169 + _149;
        float _177 = _171 + _155;
        float _179 = _173 + _153;
        float _181 = _175 + _157;
        float _183 = _177 * 0.25;
        float _185 = _179 * 0.25;
        float _187 = _181 * 0.25;
        float _189 = -_183;
        float _191 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[13].y, _189);
        float _193 = -_185;
        float _195 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[13].x, _193);
        float _197 = -_187;
        float _199 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[13].z, _197);
        float _201 = fma(_159, _191, _183);
        float _203 = fma(_159, _195, _185);
        float _205 = fma(_159, _199, _187);
        out.m_34.x = _203;
        out.m_34.y = _201;
        out.m_34.z = _205;
        out.m_34.w = _163;
        return out;
    }
    discard_fragment();
    return out;
}

