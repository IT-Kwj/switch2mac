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
    float _63 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _65 = precise::clamp(_63, 0.0, 1.0);
    float _67 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _69 = precise::clamp(_67, 0.0, 1.0);
    float _71 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _73 = precise::clamp(_71, 0.0, 1.0);
    float _75 = precise::max(_65, _69);
    float _77 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _79 = precise::clamp(_77, 0.0, 1.0);
    bool _83 = _75 != 0.0;
    bool _85 = isnan(_75);
    bool _87 = _83 || _85;
    bool _89 = isnan(0.0);
    bool _91 = _87 || _89;
    float _93 = precise::min(_79, _73);
    bool _95 = !_91;
    if (!_95)
    {
        float _97 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _99 = fma(_75, _97, 1.0);
        float _101 = log2(_99);
        float _103 = _101 + (-1.0);
        float _105 = exp2(_103);
        float _107 = _105 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _109 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[8].x, _57);
        float _111 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[8].y, _59);
        float _113 = -_107;
        float _115 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[8].x, _57);
        float _117 = -_107;
        float _119 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[8].y, _59);
        float _121 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[8].z, _57);
        float _123 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[8].w, _59);
        float _125 = -_107;
        float _127 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[8].z, _57);
        float2 _400 = float2(_109, _111);
        float3 _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_400, float2(0.0), isnan(_400)), level(_103)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_400, float2(0.0), isnan(_400)), level(_103)).xyz;
        float _133 = _131.x;
        float _135 = _131.y;
        float _137 = _131.z;
        float _139 = -_107;
        float _141 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[8].w, _59);
        float2 _422 = float2(_115, _119);
        float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_422, float2(0.0), isnan(_422)), level(_103)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_422, float2(0.0), isnan(_422)), level(_103)).xyz;
        float _145 = _143.x;
        float _147 = _143.y;
        float _149 = _143.z;
        float2 _437 = float2(_121, _123);
        float3 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_437, float2(0.0), isnan(_437)), level(_103)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_437, float2(0.0), isnan(_437)), level(_103)).xyz;
        float _153 = _151.x;
        float _155 = _151.y;
        float _157 = _151.z;
        float2 _452 = float2(_127, _141);
        float3 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_452, float2(0.0), isnan(_452)), level(_103)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_452, float2(0.0), isnan(_452)), level(_103)).xyz;
        float _161 = _159.x;
        float _163 = _159.y;
        float _165 = _159.z;
        float _167 = 0.0 + _101;
        float _169 = precise::clamp(_167, 0.0, 1.0);
        float _171 = _135 + _147;
        float _173 = _133 + _145;
        float _175 = _137 + _149;
        float _177 = _171 + _155;
        float _179 = _173 + _153;
        float _181 = _175 + _157;
        float _183 = _177 + _163;
        float _185 = _179 + _161;
        float _187 = _181 + _165;
        float _189 = _183 * 0.14665000140666961669921875;
        float _191 = _185 * 0.25;
        float _193 = _183 * 0.25;
        float _195 = fma(_185, 0.0747250020503997802734375, _189);
        float _197 = _93 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
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
        float _233 = fma(_93, _223, _215);
        float _235 = fma(_93, _227, _217);
        float _237 = fma(_93, _231, _219);
        out.m_34.x = _233;
        out.m_34.y = _235;
        out.m_34.z = _237;
        out.m_34.w = _169;
        return out;
    }
    discard_fragment();
    return out;
}

