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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texturecube<float> fp_t_tcb_1E [[id(4)]];
    sampler fp_t_tcb_1ESmplr [[id(5)]];
    sampler fp_t_tcb_1ESmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_44 [[user(locn6)]];
    float4 m_48 [[user(locn7)]];
    float4 m_42 [[user(locn8)]];
    float4 m_50 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_33.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.w;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _59;
    float _81 = _79 * _65;
    float _83 = _79 * _71;
    float _85 = _79 * _77;
    float _87 = _81 * _83;
    float _89 = 0.0 + _87;
    float _91 = precise::clamp(_89, 0.0, 1.0);
    float _93 = _91 * _85;
    bool _97 = _93 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _99 = isnan(_93);
    bool _101 = _97 || _99;
    bool _103 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _105 = _101 || _103;
    float _107 = in.m_33.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_33.z;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_35.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_33.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_35.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_35.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    if (!_105)
    {
        discard_fragment();
    }
    float _143 = _79 * _111;
    float _145 = _79 * _117;
    float _147 = _79 * _123;
    float _149 = _79 * _129;
    float _151 = _79 * _135;
    float _153 = _79 * _141;
    float _155 = _143 * _147;
    float _157 = _149 * _151;
    float _159 = _145 * _153;
    if (!_105)
    {
        out.m_40.x = _155;
        out.m_40.y = _157;
        out.m_40.z = _159;
        out.m_40.w = _87;
        return out;
    }
    float _161 = in.m_42.w;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = _79 * _165;
    bool _169 = _167 != 1.0;
    bool _171 = isnan(_167);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    bool _179 = !_177;
    if (!_179)
    {
        float _181 = gl_FragCoord.x;
        float _183 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _185 = _181 / _183;
        float _187 = gl_FragCoord.y;
        float _189 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _191 = _187 / _189;
        float _193 = _167 * 256.0;
        float _195 = trunc(_193);
        int _198 = int(_195);
        uint _201 = uint(int(uint(_198) >> uint(7)));
        int _203 = int(_201) + _198;
        float _205 = trunc(_185);
        int _207 = int(_205);
        float _209 = trunc(_191);
        int _211 = int(_209);
        int _213 = _207 + 2;
        int _215 = _213 >> 1;
        uint _217 = uint(int(uint(_211) >> uint(1)));
        int _219 = _215 ^ int(_217);
        int _221 = _219 << 16;
        int _223 = _221 ^ _215;
        int _225 = 983055 & _223;
        int _227 = _225 << 6;
        int _229 = _227 + _225;
        int _231 = _229 & 13369548;
        uint _233 = uint(int(uint(_231) >> uint(3)));
        int _235 = _231 | int(_233);
        int _237 = _235 & 5570560;
        int _239 = _235 & 85;
        uint _241 = uint(int(uint(_237) >> uint(15)));
        int _243 = int(_241) + _239;
        bool _245 = uint(_203) > uint(_243);
        if (!_245)
        {
            discard_fragment();
        }
        if (!_245)
        {
            out.m_40.x = _155;
            out.m_40.y = _157;
            out.m_40.z = _159;
            out.m_40.w = _93;
            return out;
        }
    }
    float _247 = in.m_44.y;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_44.x;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_44.z;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_42.x;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = _79 * _251;
    float _273 = _79 * _257;
    float _275 = _79 * _263;
    float _277 = _271 * _271;
    float _279 = fma(_273, _273, _277);
    float _281 = fma(_275, _275, _279);
    float _283 = rsqrt(_281);
    float _285 = _273 * _283;
    float _287 = _271 * _283;
    float _289 = _275 * _283;
    float _291 = _79 * _269;
    float _293 = abs(_285);
    float _295 = abs(_287);
    float _297 = precise::max(_293, _295);
    float _299 = abs(_289);
    float _301 = precise::max(_299, _297);
    float _303 = 1.0 / _301;
    float _305 = _285 * _303;
    float _307 = -_303;
    float _309 = _289 * _307;
    float _311 = precise::min(_291, 1.0);
    float _313 = _287 * _303;
    float3 _870 = float3(_305, _313, _309);
    float3 _317 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_870, float3(0.0), isnan(_870)), level(_311)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_870, float3(0.0), isnan(_870)), level(_311)).xyz;
    float _319 = _317.x;
    float _321 = _317.y;
    float _323 = _317.z;
    float _325 = in.m_46.y;
    float _327 = gl_FragCoord.w;
    float _329 = _325 * _327;
    float _331 = in.m_46.z;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_46.x;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_48.z;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_48.x;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = in.m_48.y;
    float _357 = gl_FragCoord.w;
    float _359 = _355 * _357;
    float _361 = in.m_50.x;
    float _363 = gl_FragCoord.w;
    float _365 = _361 * _363;
    float _367 = in.m_50.w;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = in.m_50.y;
    float _375 = gl_FragCoord.w;
    float _377 = _373 * _375;
    float _379 = in.m_50.z;
    float _381 = gl_FragCoord.w;
    float _383 = _379 * _381;
    float _385 = _79 * _329;
    float _387 = _79 * _335;
    float _389 = _79 * _341;
    bool _391 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _393 = _79 * _371;
    float _395 = fma(_323, 0.20999999344348907470703125, _387);
    float _397 = fma(_319, 0.20999999344348907470703125, _389);
    float _399 = _79 * _347;
    float _401 = fma(_321, 0.20999999344348907470703125, _385);
    float _403 = _79 * _353;
    float _405 = _79 * _359;
    float _407 = _395 + _399;
    float _409 = _397 + _403;
    float _411 = _401 + _405;
    float _413 = _159 * _407;
    float _415 = 0.0 + _93;
    float _417 = precise::clamp(_415, 0.0, 1.0);
    float _419 = _155 * _409;
    float _421 = _79 * _365;
    float _423 = _157 * _411;
    float _425 = _79 * _377;
    float _427 = _79 * _383;
    float _429 = fma(_419, _393, _421);
    float _431 = _421;
    if (!_391)
    {
        _431 = _417;
    }
    float _433 = _431;
    float _435 = fma(_423, _393, _425);
    float _437 = fma(_413, _393, _427);
    bool _439 = !_391;
    float _441 = _433;
    if (!_439)
    {
        float _443 = in.m_52.w;
        float _445 = gl_FragCoord.w;
        float _447 = _443 * _445;
        float _449 = in.m_52.z;
        float _451 = gl_FragCoord.w;
        float _453 = _449 * _451;
        float _455 = _79 * _447;
        float _457 = _79 * _453;
        float _459 = 1.0 / _455;
        float _461 = _457 * _459;
        float _463 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _465 = fma(_461, (*spvDescriptorSet0.fp_c8)._m0[30].w, _463);
        float _467 = 1.0 / _465;
        float _469 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _471 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _473 = fma(_467, _469, _471);
        float _475 = _473 * 8.0;
        float _477 = precise::clamp(_475, 0.0, 1.0);
        float _479 = _417 * _477;
        _441 = _479;
    }
    float _481 = _441;
    float _483 = 0.0 + _481;
    float _485 = precise::clamp(_483, 0.0, 1.0);
    out.m_40.x = _429;
    out.m_40.y = _435;
    out.m_40.z = _437;
    out.m_40.w = _485;
    return out;
}

