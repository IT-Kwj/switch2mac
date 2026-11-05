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
    texturecube<float> fp_t_tcb_1E [[id(3)]];
    sampler fp_t_tcb_1ESmplr [[id(4)]];
    sampler fp_t_tcb_1ESmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_33 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_50 [[user(locn7)]];
    float4 m_46 [[user(locn8)]];
    float4 m_52 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_33.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_33.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = 1.0 / _61;
    float _95 = _93 * _67;
    float _97 = _93 * _73;
    float _99 = _95 * _95;
    float _101 = fma(_97, _97, _99);
    float _103 = sqrt(_101);
    float _105 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _107 = (*spvDescriptorSet0.fp_c9)._m0[194].w + _105;
    float _109 = 1.0 / _107;
    float _111 = _103 * 2.0;
    float _113 = precise::clamp(_111, 0.0, 1.0);
    float _115 = -_113;
    float _117 = _115 + 1.0;
    float _119 = precise::max(_117, (*spvDescriptorSet0.fp_c9)._m0[194].z);
    float _121 = precise::min(_119, (*spvDescriptorSet0.fp_c9)._m0[194].w);
    float _123 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _125 = _121 + _123;
    float _127 = _125 * _109;
    float _129 = _93 * _79;
    float _131 = _93 * _85;
    float _133 = _93 * _91;
    float _135 = _127 * _129;
    float _137 = _131 * _135;
    float _139 = precise::clamp(_137, 0.0, 1.0);
    float _141 = _139 * _133;
    bool _145 = _141 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _147 = isnan(_141);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _153 = _149 || _151;
    float _155 = in.m_37.y;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_37.x;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_37.z;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_35.x;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_35.y;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_35.z;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    if (!_153)
    {
        discard_fragment();
    }
    float _191 = _127 * _127;
    float _193 = -_191;
    float _195 = _193 + 1.0;
    float _197 = _93 * _159;
    float _199 = _93 * _165;
    float _201 = _93 * _171;
    float _203 = _197 * _195;
    float _205 = _199 * _195;
    float _207 = _201 * _195;
    float _209 = _93 * _177;
    float _211 = _93 * _183;
    float _213 = _93 * _189;
    float _215 = fma(_191, _209, _205);
    float _217 = fma(_191, _211, _203);
    float _219 = fma(_191, _213, _207);
    if (!_153)
    {
        out.m_42.x = _215;
        out.m_42.y = _217;
        out.m_42.z = _219;
        out.m_42.w = _139;
        return out;
    }
    float _221 = in.m_44.y;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_44.x;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = in.m_44.z;
    float _235 = gl_FragCoord.w;
    float _237 = _233 * _235;
    float _239 = _93 * _225;
    float _241 = _93 * _231;
    float _243 = _93 * _237;
    float _245 = _239 * _239;
    float _247 = fma(_241, _241, _245);
    float _249 = fma(_243, _243, _247);
    float _251 = rsqrt(_249);
    float _253 = _241 * _251;
    float _255 = _239 * _251;
    float _257 = _243 * _251;
    float _259 = abs(_253);
    float _261 = abs(_255);
    float _263 = precise::max(_259, _261);
    float _265 = abs(_257);
    float _267 = precise::max(_265, _263);
    float _269 = 1.0 / _267;
    float _271 = -_269;
    float _273 = _257 * _271;
    float _275 = _253 * _269;
    float _277 = _255 * _269;
    float3 _775 = float3(_275, _277, _273);
    float3 _281 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_775, float3(0.0), isnan(_775)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_775, float3(0.0), isnan(_775)), level(0.0)).xyz;
    float _283 = _281.x;
    float _285 = _281.y;
    float _287 = _281.z;
    float _289 = in.m_46.y;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_48.x;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_48.y;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_48.z;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_50.y;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = in.m_50.z;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = in.m_50.x;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_52.x;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_52.w;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_52.y;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_52.z;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    bool _355 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _357 = _93 * _293;
    float _359 = _93 * _299;
    float _361 = _93 * _305;
    float _363 = _93 * _311;
    float _365 = _141 * _357;
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = _93 * _317;
    float _371 = _93 * _347;
    float _373 = fma(_285, 0.20999999344348907470703125, _361);
    float _375 = fma(_283, 0.20999999344348907470703125, _359);
    float _377 = fma(_287, 0.20999999344348907470703125, _363);
    float _379 = _93 * _323;
    float _381 = _93 * _329;
    float _383 = _373 + _369;
    float _385 = _93 * _335;
    float _387 = _377 + _379;
    float _389 = _375 + _381;
    float _391 = _217 * _383;
    float _393 = _93 * _341;
    float _395 = _219 * _387;
    float _397 = _215 * _389;
    float _399 = _93 * _353;
    float _401 = fma(_391, _393, _371);
    float _403 = fma(_397, _393, _385);
    float _405 = fma(_395, _393, _399);
    bool _407 = !_355;
    float _409 = _367;
    if (!_407)
    {
        float _411 = in.m_54.w;
        float _413 = gl_FragCoord.w;
        float _415 = _411 * _413;
        float _417 = in.m_54.z;
        float _419 = gl_FragCoord.w;
        float _421 = _417 * _419;
        float _423 = _93 * _415;
        float _425 = _93 * _421;
        float _427 = 1.0 / _423;
        float _429 = _425 * _427;
        float _431 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _433 = fma(_429, (*spvDescriptorSet0.fp_c8)._m0[30].w, _431);
        float _435 = 1.0 / _433;
        float _437 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _439 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _441 = fma(_435, _437, _439);
        float _443 = _441 * 8.0;
        float _445 = precise::clamp(_443, 0.0, 1.0);
        float _447 = _367 * _445;
        _409 = _447;
    }
    float _449 = _409;
    float _451 = 0.0 + _449;
    float _453 = precise::clamp(_451, 0.0, 1.0);
    out.m_42.x = _403;
    out.m_42.y = _401;
    out.m_42.z = _405;
    out.m_42.w = _453;
    return out;
}

