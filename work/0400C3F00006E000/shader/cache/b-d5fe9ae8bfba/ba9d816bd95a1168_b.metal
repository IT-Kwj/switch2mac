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
    float2 _277 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_277, float2(0.0), isnan(_277))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_277, float2(0.0), isnan(_277))).x;
    float _63 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _65 = precise::clamp(_63, 0.0, 1.0);
    bool _69 = _61 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _71 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _73 = precise::clamp(_71, 0.0, 1.0);
    bool _75 = !_69;
    float _77 = _75 ? _65 : 0.0;
    float _79 = precise::max(_77, _73);
    float _81 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _83 = precise::clamp(_81, 0.0, 1.0);
    float _85 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _87 = precise::clamp(_85, 0.0, 1.0);
    bool _89 = _79 != 0.0;
    bool _91 = isnan(_79);
    bool _93 = _89 || _91;
    bool _95 = isnan(0.0);
    bool _97 = _93 || _95;
    float _99 = precise::min(_83, _87);
    bool _101 = !_97;
    if (!_101)
    {
        float _103 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _105 = fma(_79, _103, 1.0);
        float _107 = log2(_105);
        float _109 = _107 + (-1.0);
        float _111 = exp2(_109);
        float _113 = _111 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _115 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[8].x, _57);
        float _117 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[8].y, _59);
        float _119 = -_113;
        float _121 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[8].x, _57);
        float _123 = -_113;
        float _125 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[8].y, _59);
        float _127 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[8].z, _57);
        float _129 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[8].w, _59);
        float _131 = -_113;
        float _133 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].z, _57);
        float2 _415 = float2(_115, _117);
        float3 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_415, float2(0.0), isnan(_415)), level(_109)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_415, float2(0.0), isnan(_415)), level(_109)).xyz;
        float _139 = _137.x;
        float _141 = _137.y;
        float _143 = _137.z;
        float _145 = -_113;
        float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[8].w, _59);
        float2 _437 = float2(_121, _125);
        float3 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_437, float2(0.0), isnan(_437)), level(_109)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_437, float2(0.0), isnan(_437)), level(_109)).xyz;
        float _151 = _149.x;
        float _153 = _149.y;
        float _155 = _149.z;
        float2 _452 = float2(_127, _129);
        float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_452, float2(0.0), isnan(_452)), level(_109)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_452, float2(0.0), isnan(_452)), level(_109)).xyz;
        float _159 = _157.x;
        float _161 = _157.y;
        float _163 = _157.z;
        float2 _467 = float2(_133, _147);
        float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_467, float2(0.0), isnan(_467)), level(_109)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_467, float2(0.0), isnan(_467)), level(_109)).xyz;
        float _167 = _165.x;
        float _169 = _165.y;
        float _171 = _165.z;
        float _173 = 0.0 + _107;
        float _175 = precise::clamp(_173, 0.0, 1.0);
        float _177 = _141 + _153;
        float _179 = _139 + _151;
        float _181 = _143 + _155;
        float _183 = _177 + _161;
        float _185 = _179 + _159;
        float _187 = _181 + _163;
        float _189 = _183 + _169;
        float _191 = _185 + _167;
        float _193 = _187 + _171;
        float _195 = _189 * 0.14665000140666961669921875;
        float _197 = _191 * 0.25;
        float _199 = _189 * 0.25;
        float _201 = fma(_191, 0.0747250020503997802734375, _195);
        float _203 = _99 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _205 = fma(_193, 0.028599999845027923583984375, _201);
        float _207 = _193 * 0.25;
        float _209 = -_197;
        float _211 = _209 + _205;
        float _213 = -_199;
        float _215 = _213 + _205;
        float _217 = -_207;
        float _219 = _217 + _205;
        float _221 = fma(_203, _211, _197);
        float _223 = fma(_203, _215, _199);
        float _225 = fma(_203, _219, _207);
        float _227 = -_221;
        float _229 = fma(_221, (*spvDescriptorSet0.fp_c3)._m0[13].x, _227);
        float _231 = -_223;
        float _233 = fma(_223, (*spvDescriptorSet0.fp_c3)._m0[13].y, _231);
        float _235 = -_225;
        float _237 = fma(_225, (*spvDescriptorSet0.fp_c3)._m0[13].z, _235);
        float _239 = fma(_99, _229, _221);
        float _241 = fma(_99, _233, _223);
        float _243 = fma(_99, _237, _225);
        out.m_34.x = _239;
        out.m_34.y = _241;
        out.m_34.z = _243;
        out.m_34.w = _175;
        return out;
    }
    discard_fragment();
    return out;
}

