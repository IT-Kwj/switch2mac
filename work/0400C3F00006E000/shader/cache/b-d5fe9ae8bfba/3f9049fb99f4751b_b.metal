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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_37 [[user(locn5), flat]];
    float4 m_39 [[user(locn6)]];
    float4 m_50 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.z;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.w;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.x;
    float _75 = in.m_35.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_35.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = 1.0 / _59;
    float _95 = _73 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _97 = _93 * _65;
    float _99 = _93 * _71;
    float _101 = _93 * _79;
    float _103 = _93 * _85;
    float2 _413 = float2(_97, _99);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_413, float2(0.0), isnan(_413))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_413, float2(0.0), isnan(_413))).w;
    float _107 = fma(_103, _95, _101);
    float _109 = _93 * _91;
    float2 _432 = float2(_107, _109);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_432, float2(0.0), isnan(_432))).w;
    float _113 = in.m_41.w;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_43.w;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_45.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = _93 * _123;
    float _133 = _93 * _129;
    float _135 = in.m_43.x;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_43.y;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_41.y;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_43.z;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_41.z;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = _93 * _151;
    float _167 = -_105;
    float _169 = _167 + 1.0;
    float _171 = _169 * _169;
    float _173 = _93 * _117;
    float _175 = _111 * _171;
    float _177 = _173 * _175;
    float _179 = _131 * _177;
    float _181 = 0.0 + _179;
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = _183 * _133;
    bool _189 = _185 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _191 = isnan(_185);
    bool _193 = _189 || _191;
    bool _195 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _197 = _193 || _195;
    float _199 = in.m_41.x;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    if (!_197)
    {
        discard_fragment();
    }
    float _205 = _93 * _139;
    float _207 = _93 * _145;
    float _209 = _93 * _157;
    float _211 = _93 * _163;
    float _213 = -_207;
    float _215 = _213 + _165;
    float _217 = -_209;
    float _219 = _217 + _211;
    float _221 = fma(_111, _215, _207);
    float _223 = fma(_111, _219, _209);
    float _225 = _93 * _203;
    float _227 = -_205;
    float _229 = _227 + _225;
    float _231 = fma(_111, _229, _205);
    if (!_197)
    {
        out.m_48.x = _231;
        out.m_48.y = _221;
        out.m_48.z = _223;
        out.m_48.w = _179;
        return out;
    }
    float _233 = _221 * 0.715200006961822509765625;
    float _235 = in.m_50.w;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = in.m_50.z;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_50.x;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = fma(_231, 0.2125999927520751953125, _233);
    float _255 = in.m_50.y;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = fma(_223, 0.072200000286102294921875, _253);
    bool _263 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _265 = 1.0 / _261;
    float _267 = _265 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = _93 * _239;
    float _273 = fma(_269, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _275 = _93 * _245;
    float _277 = _273 * _271;
    float _279 = 0.0 + _185;
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = _93 * _251;
    float _285 = _93 * _259;
    float _287 = fma(_223, _277, _275);
    float _289 = fma(_231, _277, _283);
    float _291 = fma(_221, _277, _285);
    float _293 = _275;
    if (!_263)
    {
        _293 = _281;
    }
    float _295 = _293;
    bool _297 = !_263;
    float _299 = _295;
    if (!_297)
    {
        float _301 = in.m_52.w;
        float _303 = gl_FragCoord.w;
        float _305 = _301 * _303;
        float _307 = in.m_52.z;
        float _309 = gl_FragCoord.w;
        float _311 = _307 * _309;
        float _313 = _93 * _305;
        float _315 = _93 * _311;
        float _317 = 1.0 / _313;
        float _319 = _315 * _317;
        float _321 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _323 = fma(_319, (*spvDescriptorSet0.fp_c8)._m0[30].w, _321);
        float _325 = 1.0 / _323;
        float _327 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _329 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _331 = fma(_325, _327, _329);
        float _333 = _331 * 8.0;
        float _335 = precise::clamp(_333, 0.0, 1.0);
        float _337 = _281 * _335;
        _299 = _337;
    }
    float _339 = _299;
    float _341 = 0.0 + _339;
    float _343 = precise::clamp(_341, 0.0, 1.0);
    out.m_48.x = _289;
    out.m_48.y = _291;
    out.m_48.z = _287;
    out.m_48.w = _343;
    return out;
}

