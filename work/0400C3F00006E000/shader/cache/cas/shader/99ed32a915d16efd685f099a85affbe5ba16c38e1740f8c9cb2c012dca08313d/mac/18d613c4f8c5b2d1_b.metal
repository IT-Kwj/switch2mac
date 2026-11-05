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
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_271, float2(0.0), isnan(_271))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_271, float2(0.0), isnan(_271))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _288 = float2(_57, _59);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_288, float2(0.0), isnan(_288))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_288, float2(0.0), isnan(_288))).x;
    bool _75 = _57 >= (*spvDescriptorSet0.fp_c3)._m0[35].x;
    bool _77 = isnan(_57);
    bool _79 = _75 || _77;
    bool _81 = isnan((*spvDescriptorSet0.fp_c3)._m0[35].x);
    bool _83 = _79 || _81;
    float _85 = precise::min(_67, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _87 = -_71;
    float _89 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _91 = precise::min(_65, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _93 = precise::min(_69, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _95 = _85 * 0.715200006961822509765625;
    float _97 = fma(_91, 0.2125999927520751953125, _95);
    float _99 = fma(_93, 0.072200000286102294921875, _97);
    float _101 = 1.0 / _99;
    float _103 = _101 * (*spvDescriptorSet0.fp_c3)._m0[26].z;
    float _105 = precise::clamp(_103, 0.0, 1.0);
    float _107 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[26].y, (*spvDescriptorSet0.fp_c3)._m0[26].x);
    float _109 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[1].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _111 = precise::clamp(_109, 0.0, 1.0);
    float _113 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = _91 * _107;
    float _119 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[10].x, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _121 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[10].z, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _123 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[10].w, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _125 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _127 = precise::clamp(_125, 0.0, 1.0);
    float _129 = _85 * _107;
    float _131 = _93 * _107;
    float _133 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[11].x, _119);
    float _135 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[11].z, _121);
    float _137 = 1.0 / _89;
    float _139 = fma(_127, (*spvDescriptorSet0.fp_c3)._m0[11].w, _123);
    float _141 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _143 = precise::clamp(_141, 0.0, 1.0);
    float _145 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[12].z, _135);
    float _147 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[12].x, _133);
    float _149 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[12].w, _139);
    float _151 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[13].z, _145);
    float _157 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[13].x, _147);
    float _159 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[13].w, _149);
    float _161 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[14].z, _155);
    float _163 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _165 = precise::clamp(_163, 0.0, 1.0);
    float _167 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[14].x, _157);
    float _169 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[14].w, _159);
    float _171 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _173 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[0].w, _171);
    float _175 = _99 * _107;
    float _177 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[15].z, _161);
    float _179 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[15].x, _167);
    float _181 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[15].w, _169);
    float _183 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[27].z, (*spvDescriptorSet0.fp_c3)._m0[27].w);
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = _177;
    if (!_83)
    {
        float _189 = _177 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
        _187 = _189;
    }
    float _191 = _187;
    float _193 = -_179;
    float _195 = _175 + _193;
    float _197 = _185 * _185;
    float _199 = _191 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _201 = _181 * _195;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = -_199;
    float _207 = _205 + (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _209 = fma(_197, (*spvDescriptorSet0.fp_c3)._m0[28].z, _203);
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[34].z, _199);
    float _215 = -_203;
    float _217 = _215 + _211;
    float _219 = _213 * _211;
    float _221 = _213 * _217;
    float _223 = _117 * _221;
    float _225 = _129 * _221;
    float _227 = _131 * _221;
    float _229 = _117 * _219;
    float _231 = _129 * _219;
    float _233 = _131 * _219;
    float _235 = precise::max(_223, _225);
    float _237 = precise::max(_227, _235);
    out.m_34.x = _229;
    out.m_34.y = _231;
    out.m_34.z = _233;
    out.m_34.w = _237;
    return out;
}

