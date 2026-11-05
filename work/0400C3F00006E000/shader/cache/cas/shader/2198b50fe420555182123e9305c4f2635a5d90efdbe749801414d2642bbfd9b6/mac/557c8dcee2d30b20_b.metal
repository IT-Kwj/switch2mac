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
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _265 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_265, float2(0.0), isnan(_265))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_265, float2(0.0), isnan(_265))).x;
    float _67 = in.m_33.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_33.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_35.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_35.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = _59 * _71;
    float _93 = _59 * _77;
    float _95 = _59 * _83;
    float _97 = _59 * _89;
    float _99 = -_65;
    float _101 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _103 = 1.0 / _101;
    float _105 = fma(_91, _103, _95);
    float _107 = precise::clamp(_105, 0.0, 1.0);
    bool _111 = _103 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _113 = fma(_93, _103, _97);
    float _115 = precise::clamp(_113, 0.0, 1.0);
    bool _117 = !_111;
    float _119 = _117 ? _107 : 0.0;
    float _121 = precise::max(_119, _115);
    bool _123 = _121 != 0.0;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan(0.0);
    bool _131 = _127 || _129;
    bool _133 = !_131;
    if (!_133)
    {
        float _135 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _137 = fma(_121, _135, 1.0);
        float _139 = log2(_137);
        float _141 = _139 + (-1.0);
        float _143 = exp2(_141);
        float _145 = _143 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _147 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _149 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _151 = -_145;
        float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _155 = -_145;
        float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _159 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _161 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float _163 = -_145;
        float _165 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _167 = -_145;
        float _169 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float2 _436 = float2(_147, _149);
        float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_436, float2(0.0), isnan(_436)), level(_141)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_436, float2(0.0), isnan(_436)), level(_141)).xyz;
        float _175 = _173.x;
        float _177 = _173.y;
        float _179 = _173.z;
        float2 _451 = float2(_153, _157);
        float3 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_451, float2(0.0), isnan(_451)), level(_141)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_451, float2(0.0), isnan(_451)), level(_141)).xyz;
        float _183 = _181.x;
        float _185 = _181.y;
        float _187 = _181.z;
        float2 _466 = float2(_159, _161);
        float3 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_466, float2(0.0), isnan(_466)), level(_141)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_466, float2(0.0), isnan(_466)), level(_141)).xyz;
        float _191 = _189.x;
        float _193 = _189.y;
        float _195 = _189.z;
        float2 _481 = float2(_165, _169);
        float3 _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_481, float2(0.0), isnan(_481)), level(_141)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_481, float2(0.0), isnan(_481)), level(_141)).xyz;
        float _199 = _197.x;
        float _201 = _197.y;
        float _203 = _197.z;
        float _205 = 0.0 + _139;
        float _207 = precise::clamp(_205, 0.0, 1.0);
        float _209 = _175 + _183;
        float _211 = _177 + _185;
        float _213 = _179 + _187;
        float _215 = _209 + _191;
        float _217 = _211 + _193;
        float _219 = _213 + _195;
        float _221 = _215 + _199;
        float _223 = _217 + _201;
        float _225 = _219 + _203;
        float _227 = _221 * 0.25;
        float _229 = _223 * 0.25;
        float _231 = _225 * 0.25;
        out.m_38.x = _227;
        out.m_38.y = _229;
        out.m_38.z = _231;
        out.m_38.w = _207;
        return out;
    }
    discard_fragment();
    return out;
}

