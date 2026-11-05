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
    float4 m_36 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _315 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_315, float2(0.0), isnan(_315))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_315, float2(0.0), isnan(_315))).x;
    float _65 = -_63;
    float _67 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _69 = 1.0 / _67;
    bool _73 = _69 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_73)
    {
        discard_fragment();
    }
    if (_73)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _75 = in.m_36.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_36.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_36.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _95 = precise::clamp(_93, 0.0, 1.0);
    float _97 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _99 = precise::clamp(_97, 0.0, 1.0);
    float _101 = precise::max(_95, _99);
    float _103 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _105 = precise::clamp(_103, 0.0, 1.0);
    float _107 = _57 * _79;
    float _109 = precise::max(_101, _107);
    float _111 = _57 * _91;
    bool _113 = _109 != 0.0;
    bool _115 = isnan(_109);
    bool _117 = _113 || _115;
    bool _119 = isnan(0.0);
    bool _121 = _117 || _119;
    float _123 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = _57 * _85;
    float _129 = precise::min(_105, _125);
    bool _131 = !_121;
    if (!_131)
    {
        float _133 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _135 = fma(_109, _133, 1.0);
        float _137 = log2(_135);
        float _139 = _137 + (-1.0);
        float _141 = exp2(_139);
        float _143 = _141 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _147 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _149 = -_143;
        float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _153 = -_143;
        float _155 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _157 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _159 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _161 = -_143;
        float _163 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _165 = -_143;
        float _167 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float2 _510 = float2(_145, _147);
        float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_510, float2(0.0), isnan(_510)), level(_139)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_510, float2(0.0), isnan(_510)), level(_139)).xyz;
        float _173 = _171.x;
        float _175 = _171.y;
        float _177 = _171.z;
        float2 _525 = float2(_151, _155);
        float3 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_525, float2(0.0), isnan(_525)), level(_139)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_525, float2(0.0), isnan(_525)), level(_139)).xyz;
        float _181 = _179.x;
        float _183 = _179.y;
        float _185 = _179.z;
        float2 _540 = float2(_157, _159);
        float3 _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_540, float2(0.0), isnan(_540)), level(_139)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_540, float2(0.0), isnan(_540)), level(_139)).xyz;
        float _189 = _187.x;
        float _191 = _187.y;
        float _193 = _187.z;
        float2 _555 = float2(_167, _163);
        float3 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_555, float2(0.0), isnan(_555)), level(_139)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_555, float2(0.0), isnan(_555)), level(_139)).xyz;
        float _197 = _195.x;
        float _199 = _195.y;
        float _201 = _195.z;
        float _203 = _173 + _181;
        float _205 = _175 + _183;
        float _207 = _177 + _185;
        float _209 = _203 + _189;
        float _211 = _205 + _191;
        float _213 = _207 + _193;
        float _215 = _209 + _197;
        float _217 = _211 + _199;
        float _219 = _213 + _201;
        float _221 = _215 * 0.25;
        float _223 = 0.0 + _137;
        float _225 = precise::clamp(_223, 0.0, 1.0);
        float _227 = _217 * 0.25;
        float _229 = _219 * 0.25;
        float _231 = -_221;
        float _233 = fma(_221, (*spvDescriptorSet0.fp_c3)._m0[13].x, _231);
        float _235 = fma(_111, _225, _127);
        float _237 = -_227;
        float _239 = fma(_227, (*spvDescriptorSet0.fp_c3)._m0[13].y, _237);
        float _241 = -_229;
        float _243 = fma(_229, (*spvDescriptorSet0.fp_c3)._m0[13].z, _241);
        float _245 = fma(_129, _233, _221);
        float _247 = 1.0 / _235;
        float _249 = fma(_129, _239, _227);
        float _251 = fma(_129, _243, _229);
        float _253 = _225 * _245;
        float _255 = _225 * _249;
        float _257 = _225 * _251;
        float _259 = -_253;
        float _261 = _259 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _263 = -_255;
        float _265 = _263 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _267 = -_257;
        float _269 = _267 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _271 = fma(_127, _261, _253);
        float _273 = fma(_127, _265, _255);
        float _275 = fma(_127, _269, _257);
        float _277 = _271 * _247;
        float _279 = _273 * _247;
        float _281 = _275 * _247;
        out.m_34.x = _277;
        out.m_34.y = _279;
        out.m_34.z = _281;
        out.m_34.w = _235;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _127;
    return out;
}

