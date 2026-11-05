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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_39.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_39.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_39.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_41.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_41.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _55;
    float _89 = _87 * _61;
    float _91 = _87 * _67;
    float _93 = _87 * _73;
    float _95 = _87 * _79;
    float _97 = 1.0 / _89;
    float _99 = _87 * _85;
    float _101 = _91 * _97;
    float _103 = _93 * _97;
    float2 _328 = float2(_101, _103);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_328, float2(0.0), isnan(_328))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_328, float2(0.0), isnan(_328))).x;
    float2 _339 = float2(_95, _99);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_339, float2(0.0), isnan(_339))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_339, float2(0.0), isnan(_339))).w;
    float _109 = in.m_39.z;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_43.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_45.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _129 = _87 * _113;
    float _131 = _129 * _97;
    float _133 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _135 = fma(_131, (*spvDescriptorSet0.fp_c8)._m0[30].w, _133);
    float _137 = 1.0 / _135;
    float _139 = _87 * _119;
    float _141 = _87 * _125;
    float _143 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _145 = _137 * _143;
    float _147 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _149 = fma(_105, (*spvDescriptorSet0.fp_c8)._m0[30].w, _147);
    float _151 = _107 * _139;
    float _153 = 0.0 + _151;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = 1.0 / _149;
    float _159 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _161 = -_145;
    float _163 = fma(_157, _159, _161);
    float _165 = _163 * _127;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = _155 * _167;
    float _171 = _169 * _141;
    bool _175 = _171 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _177 = isnan(_171);
    bool _179 = _175 || _177;
    bool _181 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _183 = _179 || _181;
    float _185 = _107 * _107;
    float _187 = fma((*spvDescriptorSet0.fp_c7)._m0[0].x, 0.25, 0.125);
    float _189 = _145;
    if (!_183)
    {
        discard_fragment();
    }
    float2 _469 = float2(_185, _187);
    float3 _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_469, float2(0.0), isnan(_469))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_469, float2(0.0), isnan(_469))).xyz;
    float _195 = _193.x;
    float _197 = _193.y;
    float _199 = _193.z;
    float _201 = fma(_195, (*spvDescriptorSet0.fp_c9)._m0[106].x, _185);
    float _203 = fma(_197, (*spvDescriptorSet0.fp_c9)._m0[106].x, _185);
    float _205 = fma(_199, (*spvDescriptorSet0.fp_c9)._m0[106].x, _185);
    if (!_183)
    {
        out.m_48.x = _201;
        out.m_48.y = _203;
        out.m_48.z = _205;
        out.m_48.w = _151;
        return out;
    }
    float _207 = _203 * 0.715200006961822509765625;
    float _209 = fma(_201, 0.2125999927520751953125, _207);
    float _211 = fma(_205, 0.072200000286102294921875, _209);
    bool _213 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _215 = 1.0 / _211;
    float _217 = 0.0 + _171;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = _219;
    if (_213)
    {
        float _223 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _225 = _145 + _223;
        _189 = _225;
    }
    float _227 = _189;
    float _229 = _215 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = _227;
    if (_213)
    {
        float _235 = _227 * 8.0;
        float _237 = precise::clamp(_235, 0.0, 1.0);
        _233 = _237;
    }
    float _239 = _233;
    float _241 = fma(_231, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_213)
    {
        float _243 = _219 * _239;
        _221 = _243;
    }
    float _245 = _221;
    float _247 = _201 * _241;
    float _249 = _203 * _241;
    float _251 = _205 * _241;
    float _253 = 0.0 + _245;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    out.m_48.x = _247;
    out.m_48.y = _249;
    out.m_48.z = _251;
    out.m_48.w = _255;
    return out;
}

