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
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_48 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_46 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_33.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _55;
    float _77 = _75 * _61;
    float _79 = _75 * _67;
    float _81 = _77 * _79;
    float _83 = _75 * _73;
    float _85 = 0.0 + _81;
    float _87 = precise::clamp(_85, 0.0, 1.0);
    float _89 = _87 * _83;
    bool _93 = _89 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _95 = isnan(_89);
    bool _97 = _93 || _95;
    bool _99 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _101 = _97 || _99;
    float _103 = in.m_39.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_39.y;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    if (!_101)
    {
        discard_fragment();
    }
    float _115 = _75 * _107;
    float _117 = _75 * _113;
    float2 _409 = float2(_115, _117);
    float3 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_409, float2(0.0), isnan(_409))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_409, float2(0.0), isnan(_409))).xyz;
    float _123 = _121.x;
    float _125 = _121.y;
    float _127 = _121.z;
    float _129 = in.m_33.x;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_33.y;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_41.x;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_41.y;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_33.z;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_41.z;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = _75 * _133;
    float _167 = _75 * _139;
    float _169 = _75 * _145;
    float _171 = _75 * _151;
    float _173 = _75 * _157;
    float _175 = _75 * _163;
    float _177 = -_169;
    float _179 = _165 + _177;
    float _181 = -_171;
    float _183 = _167 + _181;
    float _185 = -_175;
    float _187 = _173 + _185;
    float _189 = _123 * _123;
    float _191 = _125 * _125;
    float _193 = _127 * _127;
    float _195 = fma(_189, _179, _169);
    float _197 = fma(_191, _183, _171);
    float _199 = fma(_193, _187, _175);
    if (!_101)
    {
        out.m_44.x = _195;
        out.m_44.y = _197;
        out.m_44.z = _199;
        out.m_44.w = _81;
        return out;
    }
    float _201 = _197 * 0.715200006961822509765625;
    float _203 = in.m_46.w;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_46.z;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_46.x;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = fma(_195, 0.2125999927520751953125, _201);
    float _223 = in.m_46.y;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = fma(_199, 0.072200000286102294921875, _221);
    bool _231 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _233 = 1.0 / _229;
    float _235 = _233 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = _75 * _207;
    float _241 = fma(_237, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _243 = _75 * _213;
    float _245 = _241 * _239;
    float _247 = 0.0 + _89;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = _75 * _219;
    float _253 = _75 * _227;
    float _255 = fma(_199, _245, _243);
    float _257 = fma(_195, _245, _251);
    float _259 = fma(_197, _245, _253);
    float _261 = _243;
    if (!_231)
    {
        _261 = _249;
    }
    float _263 = _261;
    bool _265 = !_231;
    float _267 = _263;
    if (!_265)
    {
        float _269 = in.m_48.w;
        float _271 = gl_FragCoord.w;
        float _273 = _269 * _271;
        float _275 = in.m_48.z;
        float _277 = gl_FragCoord.w;
        float _279 = _275 * _277;
        float _281 = _75 * _273;
        float _283 = _75 * _279;
        float _285 = 1.0 / _281;
        float _287 = _283 * _285;
        float _289 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _291 = fma(_287, (*spvDescriptorSet0.fp_c8)._m0[30].w, _289);
        float _293 = 1.0 / _291;
        float _295 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _297 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _299 = fma(_293, _295, _297);
        float _301 = _299 * 8.0;
        float _303 = precise::clamp(_301, 0.0, 1.0);
        float _305 = _249 * _303;
        _267 = _305;
    }
    float _307 = _267;
    float _309 = 0.0 + _307;
    float _311 = precise::clamp(_309, 0.0, 1.0);
    out.m_44.x = _257;
    out.m_44.y = _259;
    out.m_44.z = _255;
    out.m_44.w = _311;
    return out;
}

