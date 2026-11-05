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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
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
    float _45 = in.m_33.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _283 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_283, float2(0.0), isnan(_283))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_283, float2(0.0), isnan(_283))).x;
    float2 _294 = float2(_59, _61);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_294, float2(0.0), isnan(_294))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_294, float2(0.0), isnan(_294))).x;
    float _67 = -_63;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _71 = 1.0 / _69;
    float _73 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _75 = precise::clamp(_73, 0.0, 1.0);
    bool _79 = _71 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _81 = !_79;
    float _83 = _81 ? _75 : 0.0;
    float _85 = precise::max(_65, _83);
    float _87 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _89 = precise::clamp(_87, 0.0, 1.0);
    bool _91 = _85 != 0.0;
    bool _93 = isnan(_85);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.0);
    bool _99 = _95 || _97;
    float _101 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _103 = precise::clamp(_101, 0.0, 1.0);
    float _105 = precise::min(_103, _89);
    bool _107 = !_99;
    if (!_107)
    {
        float _109 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _111 = fma(_85, _109, 1.0);
        float _113 = log2(_111);
        float _115 = _113 + (-1.0);
        float _117 = exp2(_115);
        float _119 = _117 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _121 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _123 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _125 = -_119;
        float _127 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _129 = -_119;
        float _131 = fma(_129, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _133 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _135 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _137 = -_119;
        float _139 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float2 _432 = float2(_121, _123);
        float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_432, float2(0.0), isnan(_432)), level(_115)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_432, float2(0.0), isnan(_432)), level(_115)).xyz;
        float _145 = _143.x;
        float _147 = _143.y;
        float _149 = _143.z;
        float _151 = -_119;
        float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float2 _454 = float2(_127, _131);
        float3 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_454, float2(0.0), isnan(_454)), level(_115)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_454, float2(0.0), isnan(_454)), level(_115)).xyz;
        float _157 = _155.x;
        float _159 = _155.y;
        float _161 = _155.z;
        float2 _469 = float2(_133, _135);
        float3 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_469, float2(0.0), isnan(_469)), level(_115)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_469, float2(0.0), isnan(_469)), level(_115)).xyz;
        float _165 = _163.x;
        float _167 = _163.y;
        float _169 = _163.z;
        float2 _484 = float2(_139, _153);
        float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_484, float2(0.0), isnan(_484)), level(_115)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_484, float2(0.0), isnan(_484)), level(_115)).xyz;
        float _173 = _171.x;
        float _175 = _171.y;
        float _177 = _171.z;
        float _179 = 0.0 + _113;
        float _181 = precise::clamp(_179, 0.0, 1.0);
        float _183 = _147 + _159;
        float _185 = _145 + _157;
        float _187 = _149 + _161;
        float _189 = _183 + _167;
        float _191 = _185 + _165;
        float _193 = _187 + _169;
        float _195 = _189 + _175;
        float _197 = _191 + _173;
        float _199 = _193 + _177;
        float _201 = _195 * 0.14665000140666961669921875;
        float _203 = _197 * 0.25;
        float _205 = _195 * 0.25;
        float _207 = fma(_197, 0.0747250020503997802734375, _201);
        float _209 = _105 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _211 = fma(_199, 0.028599999845027923583984375, _207);
        float _213 = _199 * 0.25;
        float _215 = -_203;
        float _217 = _215 + _211;
        float _219 = -_205;
        float _221 = _219 + _211;
        float _223 = -_213;
        float _225 = _223 + _211;
        float _227 = fma(_209, _217, _203);
        float _229 = fma(_209, _221, _205);
        float _231 = fma(_209, _225, _213);
        float _233 = -_227;
        float _235 = fma(_227, (*spvDescriptorSet0.fp_c3)._m0[13].x, _233);
        float _237 = -_229;
        float _239 = fma(_229, (*spvDescriptorSet0.fp_c3)._m0[13].y, _237);
        float _241 = -_231;
        float _243 = fma(_231, (*spvDescriptorSet0.fp_c3)._m0[13].z, _241);
        float _245 = fma(_105, _235, _227);
        float _247 = fma(_105, _239, _229);
        float _249 = fma(_105, _243, _231);
        out.m_36.x = _245;
        out.m_36.y = _247;
        out.m_36.z = _249;
        out.m_36.w = _181;
        return out;
    }
    discard_fragment();
    return out;
}

