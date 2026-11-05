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
    float2 _285 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_285, float2(0.0), isnan(_285))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_285, float2(0.0), isnan(_285))).x;
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
        float _147 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float _149 = -_131;
        float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[8].z, _59);
        float2 _451 = float2(_133, _135);
        float3 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_451, float2(0.0), isnan(_451)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_451, float2(0.0), isnan(_451)), level(_127)).xyz;
        float _157 = _155.x;
        float _159 = _155.y;
        float _161 = _155.z;
        float _163 = -_131;
        float _165 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[8].w, _61);
        float2 _473 = float2(_139, _143);
        float3 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_473, float2(0.0), isnan(_473)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_473, float2(0.0), isnan(_473)), level(_127)).xyz;
        float _169 = _167.x;
        float _171 = _167.y;
        float _173 = _167.z;
        float2 _488 = float2(_145, _147);
        float3 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_488, float2(0.0), isnan(_488)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_488, float2(0.0), isnan(_488)), level(_127)).xyz;
        float _177 = _175.x;
        float _179 = _175.y;
        float _181 = _175.z;
        float2 _503 = float2(_151, _165);
        float3 _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_503, float2(0.0), isnan(_503)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_503, float2(0.0), isnan(_503)), level(_127)).xyz;
        float _185 = _183.x;
        float _187 = _183.y;
        float _189 = _183.z;
        float _191 = 0.0 + _125;
        float _193 = precise::clamp(_191, 0.0, 1.0);
        float _195 = _193 * _107;
        float _197 = fma(_107, _193, _103);
        float _199 = _161 + _173;
        float _201 = _157 + _169;
        float _203 = _159 + _171;
        float _205 = _199 + _181;
        float _207 = _201 + _177;
        float _209 = 1.0 / _197;
        float _211 = _203 + _179;
        float _213 = _205 + _189;
        float _215 = _207 + _185;
        float _217 = _211 + _187;
        float _219 = _213 * 0.25;
        float _221 = _215 * 0.25;
        float _223 = _217 * 0.25;
        float _225 = -_219;
        float _227 = fma(_219, (*spvDescriptorSet0.fp_c3)._m0[13].z, _225);
        float _229 = -_221;
        float _231 = fma(_221, (*spvDescriptorSet0.fp_c3)._m0[13].x, _229);
        float _233 = -_223;
        float _235 = fma(_223, (*spvDescriptorSet0.fp_c3)._m0[13].y, _233);
        float _237 = fma(_99, _227, _219);
        float _239 = fma(_99, _231, _221);
        float _241 = _209 * _195;
        float _243 = fma(_99, _235, _223);
        float _245 = _237 * _195;
        float _247 = _239 * _241;
        float _249 = _243 * _241;
        float _251 = _245 * _209;
        out.m_34.x = _247;
        out.m_34.y = _249;
        out.m_34.z = _251;
        out.m_34.w = _197;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _103;
    return out;
}

