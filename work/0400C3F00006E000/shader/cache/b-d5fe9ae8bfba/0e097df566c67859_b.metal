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
    float2 _271 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_271, float2(0.0), isnan(_271))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_271, float2(0.0), isnan(_271))).x;
    float _63 = -_61;
    float _65 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _67 = 1.0 / _65;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _71 = precise::clamp(_69, 0.0, 1.0);
    float _73 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _75 = precise::clamp(_73, 0.0, 1.0);
    float _77 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _79 = precise::clamp(_77, 0.0, 1.0);
    bool _83 = _71 != 0.0;
    bool _85 = isnan(_71);
    bool _87 = _83 || _85;
    bool _89 = isnan(0.0);
    bool _91 = _87 || _89;
    bool _93 = !_91;
    if (!_93)
    {
        float _95 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _97 = fma(_71, _95, 1.0);
        float _99 = log2(_97);
        float _101 = _99 + (-1.0);
        float _103 = exp2(_101);
        float _105 = _103 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _107 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[8].x, _57);
        float _109 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[8].y, _59);
        float _111 = -_105;
        float _113 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[8].x, _57);
        float _115 = -_105;
        float _117 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[8].y, _59);
        float _119 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[8].z, _57);
        float _121 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[8].w, _59);
        float _123 = -_105;
        float _125 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[8].w, _59);
        float2 _397 = float2(_107, _109);
        float3 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_397, float2(0.0), isnan(_397)), level(_101)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_397, float2(0.0), isnan(_397)), level(_101)).xyz;
        float _131 = _129.x;
        float _133 = _129.y;
        float _135 = _129.z;
        float _137 = -_105;
        float _139 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].z, _57);
        float2 _419 = float2(_113, _117);
        float3 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_419, float2(0.0), isnan(_419)), level(_101)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_419, float2(0.0), isnan(_419)), level(_101)).xyz;
        float _143 = _141.x;
        float _145 = _141.y;
        float _147 = _141.z;
        float2 _434 = float2(_119, _121);
        float3 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_434, float2(0.0), isnan(_434)), level(_101)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_434, float2(0.0), isnan(_434)), level(_101)).xyz;
        float _151 = _149.x;
        float _153 = _149.y;
        float _155 = _149.z;
        float2 _449 = float2(_139, _125);
        float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_449, float2(0.0), isnan(_449)), level(_101)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_449, float2(0.0), isnan(_449)), level(_101)).xyz;
        float _159 = _157.x;
        float _161 = _157.y;
        float _163 = _157.z;
        float _165 = precise::min(_75, _79);
        float _167 = 0.0 + _99;
        float _169 = precise::clamp(_167, 0.0, 1.0);
        float _171 = _133 + _145;
        float _173 = _131 + _143;
        float _175 = _135 + _147;
        float _177 = _171 + _153;
        float _179 = _173 + _151;
        float _181 = _175 + _155;
        float _183 = _177 + _161;
        float _185 = _179 + _159;
        float _187 = _181 + _163;
        float _189 = _183 * 0.14665000140666961669921875;
        float _191 = _185 * 0.25;
        float _193 = _183 * 0.25;
        float _195 = fma(_185, 0.0747250020503997802734375, _189);
        float _197 = _165 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _199 = fma(_187, 0.028599999845027923583984375, _195);
        float _201 = _187 * 0.25;
        float _203 = -_191;
        float _205 = _203 + _199;
        float _207 = -_193;
        float _209 = _207 + _199;
        float _211 = -_201;
        float _213 = _211 + _199;
        float _215 = fma(_197, _205, _191);
        float _217 = fma(_197, _209, _193);
        float _219 = fma(_197, _213, _201);
        float _221 = -_215;
        float _223 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[13].x, _221);
        float _225 = -_217;
        float _227 = fma(_217, (*spvDescriptorSet0.fp_c3)._m0[13].y, _225);
        float _229 = -_219;
        float _231 = fma(_219, (*spvDescriptorSet0.fp_c3)._m0[13].z, _229);
        float _233 = fma(_165, _223, _215);
        float _235 = fma(_165, _227, _217);
        float _237 = fma(_165, _231, _219);
        out.m_34.x = _233;
        out.m_34.y = _235;
        out.m_34.z = _237;
        out.m_34.w = _169;
        return out;
    }
    discard_fragment();
    return out;
}

