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
    float2 _291 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_291, float2(0.0), isnan(_291))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_291, float2(0.0), isnan(_291))).x;
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
    float _97 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _99 = precise::clamp(_97, 0.0, 1.0);
    float _101 = _57 * _79;
    float _103 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _105 = precise::clamp(_103, 0.0, 1.0);
    float _107 = _57 * _85;
    float _109 = precise::max(_95, _101);
    float _111 = _57 * _91;
    float _113 = precise::min(_99, _105);
    bool _115 = _109 != 0.0;
    bool _117 = isnan(_109);
    bool _119 = _115 || _117;
    bool _121 = isnan(0.0);
    bool _123 = _119 || _121;
    bool _125 = !_123;
    if (!_125)
    {
        float _127 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _129 = fma(_109, _127, 1.0);
        float _131 = log2(_129);
        float _133 = _131 + (-1.0);
        float _135 = exp2(_133);
        float _137 = _135 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _139 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _141 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _143 = -_137;
        float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _147 = -_137;
        float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _151 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _153 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _155 = -_137;
        float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float2 _468 = float2(_139, _141);
        float3 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_468, float2(0.0), isnan(_468)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_468, float2(0.0), isnan(_468)), level(_133)).xyz;
        float _163 = _161.x;
        float _165 = _161.y;
        float _167 = _161.z;
        float _169 = -_137;
        float _171 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float2 _490 = float2(_145, _149);
        float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_490, float2(0.0), isnan(_490)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_490, float2(0.0), isnan(_490)), level(_133)).xyz;
        float _175 = _173.x;
        float _177 = _173.y;
        float _179 = _173.z;
        float2 _505 = float2(_151, _153);
        float3 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_505, float2(0.0), isnan(_505)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_505, float2(0.0), isnan(_505)), level(_133)).xyz;
        float _183 = _181.x;
        float _185 = _181.y;
        float _187 = _181.z;
        float2 _520 = float2(_157, _171);
        float3 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_520, float2(0.0), isnan(_520)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_520, float2(0.0), isnan(_520)), level(_133)).xyz;
        float _191 = _189.x;
        float _193 = _189.y;
        float _195 = _189.z;
        float _197 = 0.0 + _131;
        float _199 = precise::clamp(_197, 0.0, 1.0);
        float _201 = _199 * _111;
        float _203 = fma(_111, _199, _107);
        float _205 = _167 + _179;
        float _207 = _163 + _175;
        float _209 = _165 + _177;
        float _211 = _205 + _187;
        float _213 = _207 + _183;
        float _215 = 1.0 / _203;
        float _217 = _209 + _185;
        float _219 = _211 + _195;
        float _221 = _213 + _191;
        float _223 = _217 + _193;
        float _225 = _219 * 0.25;
        float _227 = _221 * 0.25;
        float _229 = _223 * 0.25;
        float _231 = -_225;
        float _233 = fma(_225, (*spvDescriptorSet0.fp_c3)._m0[13].z, _231);
        float _235 = -_227;
        float _237 = fma(_227, (*spvDescriptorSet0.fp_c3)._m0[13].x, _235);
        float _239 = -_229;
        float _241 = fma(_229, (*spvDescriptorSet0.fp_c3)._m0[13].y, _239);
        float _243 = fma(_113, _233, _225);
        float _245 = fma(_113, _237, _227);
        float _247 = _215 * _201;
        float _249 = fma(_113, _241, _229);
        float _251 = _243 * _201;
        float _253 = _245 * _247;
        float _255 = _249 * _247;
        float _257 = _251 * _215;
        out.m_34.x = _253;
        out.m_34.y = _255;
        out.m_34.z = _257;
        out.m_34.w = _203;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _107;
    return out;
}

