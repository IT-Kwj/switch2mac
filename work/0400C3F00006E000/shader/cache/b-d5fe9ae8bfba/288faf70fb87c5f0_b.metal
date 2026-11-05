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
    float4 m_38 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _287 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_287, float2(0.0), isnan(_287))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_287, float2(0.0), isnan(_287))).x;
    float _67 = -_65;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _71 = 1.0 / _69;
    bool _75 = _71 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_75)
    {
        discard_fragment();
    }
    float2 _319 = float2(_61, _63);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_319, float2(0.0), isnan(_319))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_319, float2(0.0), isnan(_319))).x;
    float _79 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _81 = precise::clamp(_79, 0.0, 1.0);
    if (_75)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _83 = in.m_38.z;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_38.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_38.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = precise::max(_77, _81);
    float _103 = _59 * _87;
    float _105 = _59 * _93;
    float _107 = _59 * _99;
    float _109 = precise::max(_101, _103);
    bool _111 = _109 != 0.0;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan(0.0);
    bool _119 = _115 || _117;
    bool _121 = !_119;
    if (!_121)
    {
        float _123 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _125 = fma(_109, _123, 1.0);
        float _127 = log2(_125);
        float _129 = _127 + (-1.0);
        float _131 = exp2(_129);
        float _133 = _131 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _135 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _137 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _139 = -_133;
        float _141 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[8].x, _61);
        float _143 = -_133;
        float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[8].y, _63);
        float _147 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _149 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float _151 = -_133;
        float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[8].z, _61);
        float _155 = -_133;
        float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[8].w, _63);
        float2 _463 = float2(_135, _137);
        float3 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_463, float2(0.0), isnan(_463)), level(_129)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_463, float2(0.0), isnan(_463)), level(_129)).xyz;
        float _163 = _161.x;
        float _165 = _161.y;
        float _167 = _161.z;
        float2 _478 = float2(_141, _145);
        float3 _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_478, float2(0.0), isnan(_478)), level(_129)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_478, float2(0.0), isnan(_478)), level(_129)).xyz;
        float _171 = _169.x;
        float _173 = _169.y;
        float _175 = _169.z;
        float2 _493 = float2(_147, _149);
        float3 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_493, float2(0.0), isnan(_493)), level(_129)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_493, float2(0.0), isnan(_493)), level(_129)).xyz;
        float _179 = _177.x;
        float _181 = _177.y;
        float _183 = _177.z;
        float2 _508 = float2(_153, _157);
        float3 _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_508, float2(0.0), isnan(_508)), level(_129)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_508, float2(0.0), isnan(_508)), level(_129)).xyz;
        float _187 = _185.x;
        float _189 = _185.y;
        float _191 = _185.z;
        float _193 = 0.0 + _127;
        float _195 = precise::clamp(_193, 0.0, 1.0);
        float _197 = fma(_107, _195, _105);
        float _199 = _163 + _171;
        float _201 = _165 + _173;
        float _203 = _167 + _175;
        float _205 = _199 + _179;
        float _207 = _201 + _181;
        float _209 = _203 + _183;
        float _211 = 1.0 / _197;
        float _213 = _205 + _187;
        float _215 = _207 + _189;
        float _217 = _209 + _191;
        float _219 = _195 * _213;
        float _221 = _219 * 0.25;
        float _223 = _195 * _215;
        float _225 = _223 * 0.25;
        float _227 = _195 * _217;
        float _229 = _227 * 0.25;
        float _231 = -_221;
        float _233 = _231 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _235 = -_225;
        float _237 = _235 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _239 = -_229;
        float _241 = _239 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _243 = fma(_105, _233, _221);
        float _245 = fma(_105, _237, _225);
        float _247 = fma(_105, _241, _229);
        float _249 = _243 * _211;
        float _251 = _245 * _211;
        float _253 = _247 * _211;
        out.m_36.x = _249;
        out.m_36.y = _251;
        out.m_36.z = _253;
        out.m_36.w = _197;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _105;
    return out;
}

