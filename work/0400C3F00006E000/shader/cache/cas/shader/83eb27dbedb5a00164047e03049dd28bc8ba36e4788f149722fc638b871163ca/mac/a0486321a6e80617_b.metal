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
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_46 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _55;
    float _77 = _75 * _61;
    float _79 = _77 + (-0.5);
    float _81 = -(*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _83 = 1.0 + _81;
    float _85 = abs(_79);
    float _87 = fma(_85, -2.0, 1.0);
    float _89 = 1.0 / _83;
    float _91 = precise::max(_87, (*spvDescriptorSet0.fp_c9)._m0[194].w);
    float _93 = precise::min(_91, 1.0);
    float _95 = -(*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _97 = _93 + _95;
    float _99 = _97 * _89;
    float _101 = _75 * _67;
    float _103 = _75 * _73;
    float _105 = _99 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _107 = precise::clamp(_105, 0.0, 1.0);
    float _109 = _101 * _101;
    float _111 = fma(_87, 0.5, _107);
    float _113 = _111 * _109;
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = _115 * _103;
    bool _121 = _117 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _123 = isnan(_117);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _129 = _125 || _127;
    float _131 = in.m_39.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    if (!_129)
    {
        discard_fragment();
    }
    float _137 = _75 * _135;
    float _139 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.06666667759418487548828125, _137);
    float _141 = _139 + _107;
    float2 _443 = float2(_137, _141);
    float3 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_443, float2(0.0), isnan(_443))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_443, float2(0.0), isnan(_443))).xyz;
    float _147 = _145.x;
    float _149 = _145.y;
    float _151 = _145.z;
    float _153 = in.m_41.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_41.y;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_41.z;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = -_137;
    float _173 = _171 + 1.0;
    float _175 = _173 * _173;
    float _177 = _75 * _169;
    float _179 = fma(_175, _175, _147);
    float _181 = fma(_175, _175, _149);
    float _183 = fma(_175, _175, _151);
    float _185 = _75 * _157;
    float _187 = _75 * _163;
    float _189 = _183 * _177;
    float _191 = _179 * _185;
    float _193 = _181 * _187;
    if (!_129)
    {
        out.m_44.x = _191;
        out.m_44.y = _193;
        out.m_44.z = _189;
        out.m_44.w = _115;
        return out;
    }
    float _195 = _193 * 0.715200006961822509765625;
    float _197 = in.m_46.w;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_46.z;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_46.x;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = fma(_191, 0.2125999927520751953125, _195);
    float _217 = in.m_46.y;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = fma(_189, 0.072200000286102294921875, _215);
    bool _225 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _227 = 1.0 / _223;
    float _229 = _227 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = fma(_231, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _235 = _75 * _201;
    float _237 = _75 * _207;
    float _239 = _233 * _235;
    float _241 = 0.0 + _117;
    float _243 = precise::clamp(_241, 0.0, 1.0);
    float _245 = _75 * _213;
    float _247 = _75 * _221;
    float _249 = fma(_189, _239, _237);
    float _251 = fma(_191, _239, _245);
    float _253 = fma(_193, _239, _247);
    float _255 = _237;
    if (!_225)
    {
        _255 = _243;
    }
    float _257 = _255;
    bool _259 = !_225;
    float _261 = _257;
    if (!_259)
    {
        float _263 = in.m_48.w;
        float _265 = gl_FragCoord.w;
        float _267 = _263 * _265;
        float _269 = in.m_48.z;
        float _271 = gl_FragCoord.w;
        float _273 = _269 * _271;
        float _275 = _75 * _267;
        float _277 = _75 * _273;
        float _279 = 1.0 / _275;
        float _281 = _277 * _279;
        float _283 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _285 = fma(_281, (*spvDescriptorSet0.fp_c8)._m0[30].w, _283);
        float _287 = 1.0 / _285;
        float _289 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _291 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _293 = fma(_287, _289, _291);
        float _295 = _293 * 8.0;
        float _297 = precise::clamp(_295, 0.0, 1.0);
        float _299 = _243 * _297;
        _261 = _299;
    }
    float _301 = _261;
    float _303 = 0.0 + _301;
    float _305 = precise::clamp(_303, 0.0, 1.0);
    out.m_44.x = _251;
    out.m_44.y = _253;
    out.m_44.z = _249;
    out.m_44.w = _305;
    return out;
}

