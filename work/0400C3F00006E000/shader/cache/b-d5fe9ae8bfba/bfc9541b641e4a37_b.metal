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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
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
    float4 m_39 [[user(locn5)]];
    float4 m_37 [[user(locn7)]];
    float4 m_50 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _385 = float2(_75, _77);
    float _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_385, float2(0.0), isnan(_385))).w;
    float _81 = in.m_37.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.w;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_41.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = _73 * _85;
    float _101 = _73 * _91;
    float _103 = in.m_43.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _111 = _99 + _109;
    float _113 = _111 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _115 = -_113;
    float _117 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.0500000007450580596923828125, _115);
    float _119 = in.m_45.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = _117 * 0.15915493667125701904296875;
    float _127 = _125 * 6.283185482025146484375;
    float _129 = sin(_127);
    float _131 = 0.0 + _129;
    float _133 = precise::clamp(_131, 0.0, 1.0);
    float _135 = _133 * _133;
    float _137 = in.m_41.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_41.y;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_41.z;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = _79 * _101;
    float _157 = _73 * _97;
    float _159 = _157 * _155;
    float _161 = precise::max(_159, 0.100000001490116119384765625);
    float _163 = precise::min(_161, 0.300000011920928955078125);
    float _165 = fma(_163, 4.999999523162841796875, -0.4999999701976776123046875);
    float _167 = _73 * _107;
    float _169 = _165 * _135;
    float _171 = _167 * _169;
    float _173 = _73 * _123;
    float _175 = 0.0 + _171;
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = _177 * _173;
    bool _183 = _179 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _185 = isnan(_179);
    bool _187 = _183 || _185;
    bool _189 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _191 = _187 || _189;
    float _193 = in.m_43.x;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = in.m_43.y;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_43.z;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    if (!_191)
    {
        discard_fragment();
    }
    float _211 = _73 * _197;
    float _213 = _73 * _141;
    float _215 = _73 * _203;
    float _217 = _73 * _147;
    float _219 = _73 * _209;
    float _221 = _73 * _153;
    float _223 = -_211;
    float _225 = _223 + _213;
    float _227 = -_215;
    float _229 = _227 + _217;
    float _231 = -_219;
    float _233 = _231 + _221;
    float _235 = fma(_171, _225, _211);
    float _237 = fma(_171, _229, _215);
    float _239 = fma(_171, _233, _219);
    if (!_191)
    {
        out.m_48.x = _235;
        out.m_48.y = _237;
        out.m_48.z = _239;
        out.m_48.w = _171;
        return out;
    }
    float _241 = _237 * 0.715200006961822509765625;
    float _243 = in.m_50.w;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = in.m_50.z;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = in.m_50.x;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = fma(_235, 0.2125999927520751953125, _241);
    float _263 = in.m_50.y;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = fma(_239, 0.072200000286102294921875, _261);
    bool _271 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _273 = 1.0 / _269;
    float _275 = _273 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = _73 * _247;
    float _281 = fma(_277, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _283 = _73 * _253;
    float _285 = _281 * _279;
    float _287 = 0.0 + _179;
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = _73 * _259;
    float _293 = _73 * _267;
    float _295 = fma(_239, _285, _283);
    float _297 = fma(_235, _285, _291);
    float _299 = fma(_237, _285, _293);
    float _301 = _283;
    if (!_271)
    {
        _301 = _289;
    }
    float _303 = _301;
    bool _305 = !_271;
    float _307 = _303;
    if (!_305)
    {
        float _309 = in.m_52.w;
        float _311 = gl_FragCoord.w;
        float _313 = _309 * _311;
        float _315 = in.m_52.z;
        float _317 = gl_FragCoord.w;
        float _319 = _315 * _317;
        float _321 = _73 * _313;
        float _323 = _73 * _319;
        float _325 = 1.0 / _321;
        float _327 = _323 * _325;
        float _329 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _331 = fma(_327, (*spvDescriptorSet0.fp_c8)._m0[30].w, _329);
        float _333 = 1.0 / _331;
        float _335 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _337 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _339 = fma(_333, _335, _337);
        float _341 = _339 * 8.0;
        float _343 = precise::clamp(_341, 0.0, 1.0);
        float _345 = _289 * _343;
        _307 = _345;
    }
    float _347 = _307;
    float _349 = 0.0 + _347;
    float _351 = precise::clamp(_349, 0.0, 1.0);
    out.m_48.x = _297;
    out.m_48.y = _299;
    out.m_48.z = _295;
    out.m_48.w = _351;
    return out;
}

