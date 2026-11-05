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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    sampler fp_t_tcb_10Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_39 [[user(locn1), flat]];
    float4 m_35 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_35.w;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _51;
    float _73 = _71 * _57;
    float _75 = _71 * _63;
    float _77 = _71 * _69;
    float _79 = 1.0 / _73;
    float _81 = _75 * _79;
    float _83 = _77 * _79;
    float2 _441 = float2(_81, _83);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_441, float2(0.0), isnan(_441))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_441, float2(0.0), isnan(_441))).x;
    float _87 = in.m_37.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = fma(_83, 2.0, -1.0);
    float _95 = -(*spvDescriptorSet0.fp_c8)._m0[17].y;
    float _97 = _93 * _95;
    float _99 = -(*spvDescriptorSet0.fp_c8)._m0[16].y;
    float _101 = _93 * _99;
    float _103 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _105 = fma(_85, (*spvDescriptorSet0.fp_c8)._m0[30].w, _103);
    float _107 = 1.0 / _105;
    float _109 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _111 = _107 * _109;
    float _113 = _111 * (*spvDescriptorSet0.fp_c8)._m0[30].w;
    float _115 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _117 = fma(_111, (*spvDescriptorSet0.fp_c8)._m0[30].y, _115);
    float _119 = fma(_81, 2.0, -1.0);
    float _121 = 1.0 / _113;
    float _123 = fma(_119, (*spvDescriptorSet0.fp_c8)._m0[17].x, _97);
    float _125 = -(*spvDescriptorSet0.fp_c8)._m0[18].y;
    float _127 = _93 * _125;
    float _129 = -(*spvDescriptorSet0.fp_c8)._m0[19].y;
    float _131 = _93 * _129;
    float _133 = fma(_119, (*spvDescriptorSet0.fp_c8)._m0[18].x, _127);
    float _135 = fma(_119, (*spvDescriptorSet0.fp_c8)._m0[19].x, _131);
    float _137 = _117 * _121;
    float _139 = fma(_137, 2.0, -1.0);
    float _141 = fma(_119, (*spvDescriptorSet0.fp_c8)._m0[16].x, _101);
    float _143 = fma(_139, (*spvDescriptorSet0.fp_c8)._m0[17].z, _123);
    float _145 = fma(_139, (*spvDescriptorSet0.fp_c8)._m0[16].z, _141);
    float _147 = fma(_139, (*spvDescriptorSet0.fp_c8)._m0[18].z, _133);
    float _149 = in.m_39.y;
    float _151 = _143 + (*spvDescriptorSet0.fp_c8)._m0[17].w;
    float _153 = _145 + (*spvDescriptorSet0.fp_c8)._m0[16].w;
    float _155 = fma(_139, (*spvDescriptorSet0.fp_c8)._m0[19].z, _135);
    float _157 = _147 + (*spvDescriptorSet0.fp_c8)._m0[18].w;
    float _159 = _151 * (*spvDescriptorSet0.fp_c8)._m0[15].y;
    float _161 = in.m_39.x;
    float _163 = _155 + (*spvDescriptorSet0.fp_c8)._m0[19].w;
    float _165 = _151 * (*spvDescriptorSet0.fp_c8)._m0[13].y;
    float _167 = fma(_153, (*spvDescriptorSet0.fp_c8)._m0[15].x, _159);
    float _169 = _151 * (*spvDescriptorSet0.fp_c8)._m0[14].y;
    float _171 = in.m_39.z;
    float _173 = fma(_153, (*spvDescriptorSet0.fp_c8)._m0[13].x, _165);
    float _175 = fma(_157, (*spvDescriptorSet0.fp_c8)._m0[15].z, _167);
    float _177 = fma(_153, (*spvDescriptorSet0.fp_c8)._m0[14].x, _169);
    float _179 = fma(_157, (*spvDescriptorSet0.fp_c8)._m0[13].z, _173);
    float _181 = fma(_163, (*spvDescriptorSet0.fp_c8)._m0[15].w, _175);
    float _183 = _151 * (*spvDescriptorSet0.fp_c8)._m0[12].y;
    float _185 = fma(_157, (*spvDescriptorSet0.fp_c8)._m0[14].z, _177);
    float _187 = fma(_163, (*spvDescriptorSet0.fp_c8)._m0[13].w, _179);
    float _189 = fma(_153, (*spvDescriptorSet0.fp_c8)._m0[12].x, _183);
    float _191 = 1.0 / _181;
    float _193 = fma(_157, (*spvDescriptorSet0.fp_c8)._m0[12].z, _189);
    float _195 = fma(_163, (*spvDescriptorSet0.fp_c8)._m0[12].w, _193);
    float _197 = fma(_163, (*spvDescriptorSet0.fp_c8)._m0[14].w, _185);
    float _199 = -_187;
    float _201 = fma(_199, _191, _149);
    float _203 = -_195;
    float _205 = fma(_203, _191, _161);
    float _207 = _201 * _201;
    float _209 = -_197;
    float _211 = fma(_209, _191, _171);
    float _213 = fma(_205, _205, _207);
    float _215 = fma(_211, _211, _213);
    float _217 = (*spvDescriptorSet0.fp_c10)._m0[5].x * (*spvDescriptorSet0.fp_c10)._m0[5].x;
    float _219 = sqrt(_215);
    float _221 = fma((*spvDescriptorSet0.fp_c10)._m0[4].x, (*spvDescriptorSet0.fp_c10)._m0[4].x, _217);
    float _223 = fma((*spvDescriptorSet0.fp_c10)._m0[6].x, (*spvDescriptorSet0.fp_c10)._m0[6].x, _221);
    float _225 = sqrt(_223);
    float _227 = _219 * 2.5;
    float _229 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, -0.10471977293491363525390625, _227);
    float _231 = _229 * 0.15915493667125701904296875;
    float _233 = _225 * 0.5;
    float _235 = _231 * 6.283185482025146484375;
    float _237 = sin(_235);
    float _239 = _225 * 7.5;
    float _241 = _225 * 0.25;
    float _243 = _225 * 8.0;
    float _245 = _225 * 8.25;
    float _247 = 1.0 / _233;
    float _249 = fma(_237, 0.5, 0.5);
    float _251 = precise::max(_219, _239);
    float _253 = 1.0 / _241;
    float _255 = precise::max(_219, _243);
    float _257 = precise::min(_243, _251);
    float _259 = precise::max(_249, 0.89999997615814208984375);
    float _261 = precise::min(_245, _255);
    float _263 = -_239;
    float _265 = _263 + _257;
    float _267 = precise::min(_259, 1.0);
    float _269 = -_243;
    float _271 = _269 + _261;
    float _273 = _265 * _247;
    float _275 = fma(_267, 9.9999980926513671875, -8.7499980926513671875);
    float _277 = -_271;
    float _279 = fma(_277, _253, 1.0);
    float _281 = fma(_275, 0.25, _273);
    float _283 = _71 * _91;
    float _285 = _279 * _281;
    float _287 = precise::clamp(_285, 0.0, 1.0);
    float _289 = _287 * _283;
    bool _293 = _289 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _295 = isnan(_289);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _301 = _297 || _299;
    float _303 = in.m_41.y;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_41.x;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = in.m_41.z;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    if (!_301)
    {
        discard_fragment();
    }
    float _321 = _71 * _307;
    float _323 = _71 * _313;
    float _325 = _71 * _319;
    if (!_301)
    {
        out.m_44.x = _323;
        out.m_44.y = _321;
        out.m_44.z = _325;
        out.m_44.w = _287;
        return out;
    }
    float _327 = _321 * 0.715200006961822509765625;
    float _329 = in.m_35.z;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = fma(_323, 0.2125999927520751953125, _327);
    bool _337 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _339 = fma(_325, 0.072200000286102294921875, _335);
    float _341 = 1.0 / _339;
    float _343 = _341 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _345 = precise::clamp(_343, 0.0, 1.0);
    float _347 = 0.0 + _289;
    float _349 = precise::clamp(_347, 0.0, 1.0);
    float _351 = _71 * _333;
    float _353 = fma(_345, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _355 = _323 * _353;
    float _357 = _321 * _353;
    float _359 = _325 * _353;
    bool _361 = !_337;
    float _363 = _349;
    if (!_361)
    {
        float _365 = _351 * _79;
        float _367 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _369 = fma(_365, (*spvDescriptorSet0.fp_c8)._m0[30].w, _367);
        float _371 = 1.0 / _369;
        float _373 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _375 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _377 = fma(_371, _373, _375);
        float _379 = _377 * 8.0;
        float _381 = precise::clamp(_379, 0.0, 1.0);
        float _383 = _349 * _381;
        _363 = _383;
    }
    float _385 = _363;
    float _387 = 0.0 + _385;
    float _389 = precise::clamp(_387, 0.0, 1.0);
    out.m_44.x = _355;
    out.m_44.y = _357;
    out.m_44.z = _359;
    out.m_44.w = _389;
    return out;
}

