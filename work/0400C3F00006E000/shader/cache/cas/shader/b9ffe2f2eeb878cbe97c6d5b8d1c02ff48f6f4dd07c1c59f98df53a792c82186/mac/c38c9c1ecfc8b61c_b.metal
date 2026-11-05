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
    float2 _311 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_311, float2(0.0), isnan(_311))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_311, float2(0.0), isnan(_311))).x;
    bool _67 = _63 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_67)
    {
        discard_fragment();
    }
    if (_67)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _69 = in.m_36.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_36.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_36.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _89 = precise::clamp(_87, 0.0, 1.0);
    float _91 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _93 = precise::clamp(_91, 0.0, 1.0);
    float _95 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _97 = precise::clamp(_95, 0.0, 1.0);
    float _99 = precise::min(_93, _97);
    float _101 = _57 * _73;
    float _103 = _57 * _79;
    float _105 = precise::max(_89, _101);
    float _107 = _57 * _85;
    bool _109 = _105 != 0.0;
    bool _111 = isnan(_105);
    bool _113 = _109 || _111;
    bool _115 = isnan(0.0);
    bool _117 = _113 || _115;
    bool _119 = !_117;
    if (!_119)
    {
        float _121 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _123 = fma(_105, _121, 1.0);
        float _125 = log2(_123);
        float _127 = _125 + (-1.0);
        float _129 = exp2(_127);
        float _131 = _129 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _133 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _135 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _137 = -_131;
        float _139 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[8].x, _59);
        float _141 = -_131;
        float _143 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[8].y, _61);
        float _145 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _147 = -_131;
        float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float _151 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _153 = -_131;
        float _155 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float2 _484 = float2(_133, _135);
        float3 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_484, float2(0.0), isnan(_484)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_484, float2(0.0), isnan(_484)), level(_127)).xyz;
        float _161 = _159.x;
        float _163 = _159.y;
        float _165 = _159.z;
        float2 _499 = float2(_139, _143);
        float3 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_499, float2(0.0), isnan(_499)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_499, float2(0.0), isnan(_499)), level(_127)).xyz;
        float _169 = _167.x;
        float _171 = _167.y;
        float _173 = _167.z;
        float2 _514 = float2(_145, _151);
        float3 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_514, float2(0.0), isnan(_514)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_514, float2(0.0), isnan(_514)), level(_127)).xyz;
        float _177 = _175.x;
        float _179 = _175.y;
        float _181 = _175.z;
        float2 _529 = float2(_149, _155);
        float3 _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_529, float2(0.0), isnan(_529)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_529, float2(0.0), isnan(_529)), level(_127)).xyz;
        float _185 = _183.x;
        float _187 = _183.y;
        float _189 = _183.z;
        float _191 = _163 + _171;
        float _193 = _161 + _169;
        float _195 = _165 + _173;
        float _197 = 0.0 + _125;
        float _199 = precise::clamp(_197, 0.0, 1.0);
        float _201 = _191 + _179;
        float _203 = _193 + _177;
        float _205 = _195 + _181;
        float _207 = fma(_107, _199, _103);
        float _209 = _201 + _187;
        float _211 = _203 + _185;
        float _213 = _205 + _189;
        float _215 = _199 * _107;
        float _217 = _209 * 0.14665000140666961669921875;
        float _219 = 1.0 / _207;
        float _221 = _213 * 0.25;
        float _223 = _209 * 0.25;
        float _225 = fma(_211, 0.0747250020503997802734375, _217);
        float _227 = _99 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _229 = fma(_213, 0.028599999845027923583984375, _225);
        float _231 = _211 * 0.25;
        float _233 = -_221;
        float _235 = _233 + _229;
        float _237 = -_231;
        float _239 = _237 + _229;
        float _241 = -_223;
        float _243 = _241 + _229;
        float _245 = fma(_227, _235, _221);
        float _247 = fma(_227, _239, _231);
        float _249 = fma(_227, _243, _223);
        float _251 = -_245;
        float _253 = fma(_245, (*spvDescriptorSet0.fp_c3)._m0[13].z, _251);
        float _255 = -_247;
        float _257 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[13].x, _255);
        float _259 = -_249;
        float _261 = fma(_249, (*spvDescriptorSet0.fp_c3)._m0[13].y, _259);
        float _263 = fma(_99, _253, _245);
        float _265 = fma(_99, _257, _247);
        float _267 = _219 * _215;
        float _269 = fma(_99, _261, _249);
        float _271 = _263 * _215;
        float _273 = _265 * _267;
        float _275 = _269 * _267;
        float _277 = _271 * _219;
        out.m_34.x = _273;
        out.m_34.y = _275;
        out.m_34.z = _277;
        out.m_34.w = _207;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _103;
    return out;
}

