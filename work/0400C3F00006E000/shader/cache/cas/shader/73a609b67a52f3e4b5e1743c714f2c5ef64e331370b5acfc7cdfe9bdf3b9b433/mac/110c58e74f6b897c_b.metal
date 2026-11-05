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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_44 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_33.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _329 = float2(_69, _71);
    float3 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_329, float2(0.0), isnan(_329))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_329, float2(0.0), isnan(_329))).xyz;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = in.m_35.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_37.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_35.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = _67 * _87;
    float _103 = _67 * _93;
    float _105 = in.m_39.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_35.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_39.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_35.z;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_39.z;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = _67 * _99;
    float _137 = _67 * _109;
    float _139 = _67 * _115;
    float _141 = _67 * _121;
    float _143 = _67 * _133;
    float _145 = -_137;
    float _147 = _135 + _145;
    float _149 = -_141;
    float _151 = _139 + _149;
    float _153 = _77 * _101;
    float _155 = 0.0 + _153;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = _157 * _103;
    bool _163 = _159 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _165 = isnan(_159);
    bool _167 = _163 || _165;
    bool _169 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _171 = _167 || _169;
    if (!_171)
    {
        discard_fragment();
    }
    float _173 = _67 * _127;
    float _175 = fma(_77, _147, _137);
    float _177 = fma(_79, _151, _141);
    float _179 = -_143;
    float _181 = _173 + _179;
    float _183 = fma(_81, _181, _143);
    if (!_171)
    {
        out.m_42.x = _175;
        out.m_42.y = _177;
        out.m_42.z = _183;
        out.m_42.w = _153;
        return out;
    }
    float _185 = _177 * 0.715200006961822509765625;
    float _187 = in.m_44.w;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_44.z;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = in.m_44.x;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = fma(_175, 0.2125999927520751953125, _185);
    float _207 = in.m_44.y;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = fma(_183, 0.072200000286102294921875, _205);
    bool _215 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _217 = 1.0 / _213;
    float _219 = _217 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = _67 * _191;
    float _225 = fma(_221, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _227 = _67 * _197;
    float _229 = _225 * _223;
    float _231 = 0.0 + _159;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = _67 * _203;
    float _237 = _67 * _211;
    float _239 = fma(_183, _229, _227);
    float _241 = fma(_175, _229, _235);
    float _243 = fma(_177, _229, _237);
    float _245 = _227;
    if (!_215)
    {
        _245 = _233;
    }
    float _247 = _245;
    bool _249 = !_215;
    float _251 = _247;
    if (!_249)
    {
        float _253 = in.m_46.w;
        float _255 = gl_FragCoord.w;
        float _257 = _253 * _255;
        float _259 = in.m_46.z;
        float _261 = gl_FragCoord.w;
        float _263 = _259 * _261;
        float _265 = _67 * _257;
        float _267 = _67 * _263;
        float _269 = 1.0 / _265;
        float _271 = _267 * _269;
        float _273 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _275 = fma(_271, (*spvDescriptorSet0.fp_c8)._m0[30].w, _273);
        float _277 = 1.0 / _275;
        float _279 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _281 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _283 = fma(_277, _279, _281);
        float _285 = _283 * 8.0;
        float _287 = precise::clamp(_285, 0.0, 1.0);
        float _289 = _233 * _287;
        _251 = _289;
    }
    float _291 = _251;
    float _293 = 0.0 + _291;
    float _295 = precise::clamp(_293, 0.0, 1.0);
    out.m_42.x = _241;
    out.m_42.y = _243;
    out.m_42.z = _239;
    out.m_42.w = _295;
    return out;
}

