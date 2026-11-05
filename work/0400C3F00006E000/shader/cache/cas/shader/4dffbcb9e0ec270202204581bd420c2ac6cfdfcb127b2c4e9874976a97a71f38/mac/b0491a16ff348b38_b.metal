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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_58 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_68 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2305 = false;
    bool _1289 = false;
    bool _1139 = false;
    bool _971 = false;
    bool _677 = false;
    bool _521 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3183 = as_type<float>(_103);
        out.gl_Position.z = _3183;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = _121;
    if (_117)
    {
        float _125 = float(_87);
        _97 = _125;
    }
    float _127 = _97;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3253 = as_type<float>(_141);
        out.gl_Position.z = _3253;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_49.x;
    float _149 = in.m_49.y;
    float _151 = in.m_49.z;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    int _163 = as_type<int>(_143) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_143) & 2;
    bool _169 = _167 != 0;
    float _171 = _143;
    float _173 = _145;
    if (!_161)
    {
        float _175 = _145 * _145;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    bool _181 = !_165;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = _179;
    if (!_161)
    {
        float _187 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_169;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_161;
    float _197 = _189;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _145 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _145);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _233 = !_161;
    if (!_233)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _145 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _173 = _253;
    }
    float _255 = _173;
    float _257 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _259 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _261 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _263 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _265 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _267 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[8].x, _259);
    float _269 = _259;
    float _271 = _263;
    if (!_161)
    {
        float _273 = _121 * _121;
        float _275 = _273 * 0.5;
        _269 = _275;
    }
    float _277 = _269;
    float _279 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[8].y, _263);
    float _281 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[8].z, _265);
    float _283 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[10].x, _267);
    if (!_161)
    {
        float _285 = _277 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _271 = _285;
    }
    float _287 = _271;
    bool _289 = !_161;
    float _291 = _287;
    if (!_289)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _121 * _295;
        float _305 = 1.0 / _299;
        float _307 = _301 * 0.693147182464599609375;
        float _309 = exp2(_303);
        float _311 = 1.0 / _307;
        float _313 = _309 + (-1.0);
        float _315 = -_313;
        float _317 = fma(_315, _311, _121);
        float _319 = _317 * _305;
        float _321 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _321;
    }
    float _323 = _291;
    float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _327 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[10].z, _281);
    float _329 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _331 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[10].y, _279);
    float _333 = _325 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _335 = _325 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _337 = _325 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _339 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[8].y, _333);
    float _343 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[8].x, _335);
    float _345 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[8].z, _337);
    float _347 = fma(_255, _149, _331);
    float _349 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[10].y, _341);
    float _351 = _329;
    if (!_161)
    {
        _351 = _121;
    }
    float _353 = _351;
    bool _355 = !_161;
    float _357 = _353;
    if (!_355)
    {
        float _359 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _361 = log2(_359);
        float _363 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _365 = _363 + 1.0;
        float _367 = 1.0 / _365;
        float _369 = _121 * _361;
        float _371 = exp2(_369);
        float _373 = -_371;
        float _375 = _373 + 1.0;
        float _377 = _375 * _367;
        _357 = _377;
    }
    float _379 = _357;
    float _381 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[10].x, _343);
    float _383 = fma(_379, _149, _349);
    float _385 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[10].z, _345);
    float _387 = fma(_255, _147, _283);
    float _389 = fma(_379, _147, _381);
    float _391 = -_383;
    float _393 = _347 + _391;
    float _395 = fma(_379, _151, _385);
    float _397 = fma(_255, _151, _327);
    float _399 = -_389;
    float _401 = _387 + _399;
    float _403 = _393 * _393;
    float _405 = in.m_54.w;
    float _407 = -_395;
    float _409 = _397 + _407;
    float _411 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _413 = fma(_401, _401, _403);
    float _415 = _393 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _417 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _419 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _411);
    float _421 = fma(_409, _409, _413);
    float _423 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _415);
    float _425 = in.m_44.x;
    float _427 = in.m_44.y;
    float _429 = in.m_44.z;
    float _431 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _417);
    float _433 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _419);
    float _435 = sqrt(_421);
    float _437 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _423);
    float _439 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _431);
    bool _441 = _435 >= 9.9999999747524270787835121154785e-07;
    bool _443 = isnan(_435);
    bool _445 = _441 || _443;
    bool _447 = isnan(9.9999999747524270787835121154785e-07);
    bool _449 = _445 || _447;
    float _451 = fma(_387, _405, _425);
    float _453 = fma(_347, _405, _427);
    float _455 = fma(_397, _405, _429);
    float _457 = _437;
    float _459 = _433;
    float _461 = _439;
    float _463 = _383;
    if (!_449)
    {
        bool _465 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _467 = !_465;
        if (!_467)
        {
            float _469 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _471 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _473 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _475 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].y, _469);
            float _477 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _471);
            float _479 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].z, _473);
            float _481 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].y, _475);
            float _483 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].x, _477);
            float _485 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _479);
            float _487 = _481 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _489 = _481 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _491 = _481 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _493 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[5].x, _487);
            float _495 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[4].x, _489);
            float _497 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[6].x, _491);
            float _499 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[5].z, _493);
            float _501 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[4].z, _495);
            float _503 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[6].z, _497);
            float _505 = _499 * _499;
            float _507 = fma(_501, _501, _505);
            float _509 = fma(_503, _503, _507);
            float _511 = rsqrt(_509);
            float _513 = _511 * 9.9999999747524270787835121154785e-07;
            float _515 = _501 * _513;
            float _517 = _499 * _513;
            float _519 = _503 * _513;
            _457 = _517;
            _459 = _515;
            _461 = _519;
            _521 = true;
        }
        else
        {
            float _523 = _149 * _149;
            float _525 = fma(_147, _147, _523);
            float _527 = fma(_151, _151, _525);
            float _529 = sqrt(_527);
            bool _531 = _529 >= 9.9999999747524270787835121154785e-07;
            bool _533 = isnan(_529);
            bool _535 = _531 || _533;
            bool _537 = isnan(9.9999999747524270787835121154785e-07);
            bool _539 = _535 || _537;
            if (!_539)
            {
                float _541 = _427 * _427;
                float _543 = fma(_425, _425, _541);
                float _545 = fma(_429, _429, _543);
                float _547 = sqrt(_545);
                bool _549 = _547 >= 9.9999999747524270787835121154785e-07;
                bool _551 = isnan(_547);
                bool _553 = _549 || _551;
                bool _555 = isnan(9.9999999747524270787835121154785e-07);
                bool _557 = _553 || _555;
                if (!_557)
                {
                    float _559 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _561 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _559);
                    float _563 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _561);
                    float _565 = rsqrt(_563);
                    float _567 = _565 * 9.9999999747524270787835121154785e-07;
                    float _569 = _567 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _571 = _567 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _573 = _567 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _457 = _571;
                    _459 = _569;
                    _461 = _573;
                    _521 = true;
                }
                else
                {
                    float _575 = _427 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _577 = _427 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _579 = _427 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _581 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[5].x, _575);
                    float _583 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[4].x, _577);
                    float _585 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[6].x, _579);
                    float _587 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].z, _581);
                    float _589 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].z, _583);
                    float _591 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].z, _585);
                    float _593 = _587 * _587;
                    float _595 = fma(_589, _589, _593);
                    float _597 = fma(_591, _591, _595);
                    float _599 = rsqrt(_597);
                    float _601 = _599 * 9.9999999747524270787835121154785e-07;
                    float _603 = _589 * _601;
                    float _605 = _587 * _601;
                    float _607 = _591 * _601;
                    _457 = _605;
                    _459 = _603;
                    _461 = _607;
                    _521 = true;
                }
            }
            else
            {
                float _609 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _611 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _613 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _615 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _609);
                float _617 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _611);
                float _619 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _613);
                float _621 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _615);
                float _623 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _617);
                float _625 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _619);
                float _627 = _621 * _621;
                float _629 = fma(_623, _623, _627);
                float _631 = fma(_625, _625, _629);
                float _633 = rsqrt(_631);
                float _635 = _633 * 9.9999999747524270787835121154785e-07;
                float _637 = _623 * _635;
                float _639 = _621 * _635;
                float _641 = _625 * _635;
                _457 = _639;
                _459 = _637;
                _461 = _641;
            }
        }
    }
    _521 = false;
    float _643 = _457;
    float _645 = _459;
    float _647 = _461;
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _651 = !_649;
    float _653 = _643;
    float _655 = _645;
    float _657 = _647;
    float _675;
    if (!_651)
    {
        float _659 = in.m_56.x;
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _663 = _659 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _667 = _665 * _661;
        float _669 = floor(_667);
        float _671 = -_669;
        float _673 = _667 + _671;
        _675 = _673;
        _677 = true;
    }
    else
    {
        float _679 = float(_87);
        float _681 = 1.0 / _679;
        float _683 = _121 * _681;
        _675 = _683;
    }
    _677 = false;
    float _685 = _675;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _689 = _685 + _687;
    float _691 = in.m_54.x;
    float _693 = in.m_54.y;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _695;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _703;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _711;
    float _715 = 1.0 / _701;
    bool _717 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _719 = 1.0 / _697;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _723 = _685 + _721;
    float _725 = 1.0 / _709;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _729 = _685 + _727;
    float _731 = _689 * _715;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _735 = _685 + _733;
    float _737 = 1.0 / _713;
    float _739 = _729 * _719;
    bool _741 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _743 = isnan(_685);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    bool _753 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _755 = isnan(_685);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = 1.0 / _705;
    float _767 = _735 * _725;
    bool _769 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _771 = isnan(_685);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = -_779;
    float _783 = _781 + 1.0;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _787 = _685 + _785;
    float _789 = _787 * _737;
    float _791 = -_751;
    float _793 = _791 + 1.0;
    bool _795 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _797 = isnan(_685);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = _723 * _765;
    float _809 = _779 * _793;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _811;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _815;
    float _819 = _805 * _783;
    bool _821 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _823 = isnan(_685);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = fma(_813, _739, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _835 = fma(_817, _739, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _837 = -_763;
    float _839 = _837 + 1.0;
    float _841 = -_805;
    float _843 = _841 + 1.0;
    bool _845 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _847 = isnan(_685);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _861 = _831 * _839;
    float _863 = -_831;
    float _865 = _863 + 1.0;
    float _867 = _763 * _843;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _873 = -_855;
    float _875 = _873 + 1.0;
    float _877 = _855 * _865;
    float _879 = fma(_859, _731, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _881 = fma(_871, _731, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _883;
    float _887 = _833 * _877;
    float _889 = _835 * _877;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _891;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _899 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[143].x, _887);
    float _901 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[143].y, _889);
    float _903 = fma(_885, _807, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _905 = fma(_879, _861, _899);
    float _907 = fma(_893, _807, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _913 = fma(_881, _861, _901);
    float _915 = fma(_897, _767, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _917;
    float _921 = fma(_911, _767, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _923;
    float _927 = fma(_903, _867, _905);
    float _929 = fma(_907, _867, _913);
    float _931 = fma(_919, _789, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _933 = fma(_925, _789, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _935 = fma(_915, _819, _927);
    float _937 = fma(_921, _819, _929);
    float _939 = fma(_931, _809, _935);
    float _941 = fma(_933, _809, _937);
    float _943 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[148].x, _939);
    float _945 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[148].y, _941);
    float _947 = _943 * _691;
    float _949 = _945 * _693;
    bool _951 = !_717;
    float _969;
    if (!_951)
    {
        float _953 = in.m_56.x;
        float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _957 = _953 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _961 = _959 * _955;
        float _963 = floor(_961);
        float _965 = -_963;
        float _967 = _961 + _965;
        _969 = _967;
        _971 = true;
    }
    else
    {
        float _973 = float(_87);
        float _975 = 1.0 / _973;
        float _977 = _121 * _975;
        _969 = _977;
    }
    _971 = false;
    float _979 = _969;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _983 = _979 + _981;
    bool _985 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _987 = isnan(_979);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _999 = _979 + _997;
    bool _1001 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1003 = isnan(_979);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1009 = _1005 || _1007;
    float _1011 = float(_1009);
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1013;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1021 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1023 = isnan(_979);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = -_995;
    float _1035 = _1033 + 1.0;
    float _1037 = 1.0 / _1019;
    float _1039 = _1031 * _1035;
    float _1041 = -_1031;
    float _1043 = _1041 + 1.0;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1045;
    bool _1049 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1051 = 1.0 / _1015;
    float _1053 = _1011 * _1043;
    float _1055 = -_1011;
    float _1057 = _1055 + 1.0;
    float _1059 = _999 * _1037;
    float _1061 = _983 * _1051;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1063;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1067;
    float _1071 = fma(_1047, _1061, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1073 = fma(_1065, _1061, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1075 = fma(_1069, _1061, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1077 = _1071 * _1053;
    float _1079 = _1073 * _1053;
    float _1081 = _1075 * _1053;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1089 = _1087 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1093 = _1091 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1095 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1077);
    float _1097 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1079);
    float _1099 = fma(_1085, _1059, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1101 = fma(_1089, _1059, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1103 = fma(_1093, _1059, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1105 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1081);
    float _1107 = fma(_1099, _1039, _1095);
    float _1109 = fma(_1101, _1039, _1097);
    float _1111 = fma(_1103, _1039, _1105);
    float _1113 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1107);
    float _1115 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1109);
    float _1117 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1111);
    bool _1119 = !_1049;
    float _1137;
    if (!_1119)
    {
        float _1121 = in.m_56.x;
        float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1125 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _1129 = _1127 * _1123;
        float _1131 = floor(_1129);
        float _1133 = -_1131;
        float _1135 = _1129 + _1133;
        _1137 = _1135;
        _1139 = true;
    }
    else
    {
        float _1141 = float(_87);
        float _1143 = 1.0 / _1141;
        float _1145 = _121 * _1143;
        _1137 = _1145;
    }
    _1139 = false;
    float _1147 = _1137;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1151 = _1147 + _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1155 = _1153 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1157 = _1147 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1159 = isnan(_1147);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1165 = _1161 || _1163;
    float _1167 = float(_1165);
    float _1169 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1171 = _1169 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1173 = _1147 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1175 = isnan(_1147);
    bool _1177 = _1173 || _1175;
    bool _1179 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1181 = _1177 || _1179;
    float _1183 = float(_1181);
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1185;
    bool _1189 = _1147 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1191 = isnan(_1147);
    bool _1193 = _1189 || _1191;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1197 = _1193 || _1195;
    float _1199 = float(_1197);
    float _1201 = 1.0 / _1155;
    float _1203 = -_1167;
    float _1205 = _1203 + 1.0;
    bool _1207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1209 = _1183 * _1205;
    float _1211 = -_1183;
    float _1213 = _1211 + 1.0;
    float _1215 = 1.0 / _1171;
    float _1217 = _1187 * _1201;
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1221 = _1219 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1223 = _1115 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1225 = fma(_1217, _1151, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1227 = -_1199;
    float _1229 = _1227 + 1.0;
    float _1231 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1233 = _1225 * _1209;
    float _1235 = _1221 * _1215;
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1239 = _1147 + _1237;
    float _1241 = _1167 * _1229;
    float _1243 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1233);
    float _1245 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1247 = fma(_1235, _1239, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1249 = fma(_1247, _1241, _1243);
    float _1251 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1253 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1249);
    float _1255 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1257 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1259 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _1255;
    out.m_58.y = _1231;
    out.m_58.z = _1257;
    out.m_58.w = _1259;
    bool _1261 = !_1207;
    float _1285;
    float _1287;
    if (!_1261)
    {
        float _1263 = in.m_56.x;
        float _1265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1267 = float(_87);
        float _1269 = 1.0 / _1267;
        float _1271 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1273 = _121 * _1269;
        float _1275 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _1277 = _1275 * _1265;
        float _1279 = floor(_1277);
        float _1281 = -_1279;
        float _1283 = _1277 + _1281;
        _1285 = _1283;
        _1287 = _1273;
        _1289 = true;
    }
    else
    {
        float _1291 = float(_87);
        float _1293 = 1.0 / _1291;
        float _1295 = _121 * _1293;
        _1285 = _1295;
        _1287 = _1295;
    }
    _1289 = false;
    float _1297 = _1285;
    float _1299 = _1287;
    float _1301 = in.m_56.x;
    float _1303 = in.m_56.y;
    float _1305 = in.m_56.z;
    float _1307 = in.m_56.w;
    float _1309 = _453 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1311 = _453 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1315 = _1313 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1317;
    int _1321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1323 = _1321 != 0;
    float _1325 = 1.0 / _1315;
    int _1327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1329 = _1327 != 0;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _1335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1337 = _1335 != 0;
    float _1339 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1309);
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1343 = _1341 != 0;
    float _1345 = _453 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1347 = 1.0 / _1319;
    float _1349 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1311);
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1355 = _1353 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1357 = _1307 > 0.5;
    float _1359 = 1.0 / _1333;
    float _1361 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1363 = _1301 > 0.5;
    float _1365 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1349);
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1371 = -_183;
    int _1373 = _1363 ? as_type<int>(_1371) : as_type<int>(_183);
    float _1375 = 1.0 / _1355;
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1379 = _1377 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1383 = _1381 != 0;
    float _1385 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1345);
    float _1387 = -_1351;
    float _1389 = fma(_1361, 2.0, _1387);
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1395 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1339);
    float _1397 = 1.0 / _1379;
    float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1401 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1399;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1403;
    float _1407 = _1401 * _1325;
    float _1409 = 1.0 / _1369;
    float _1411 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1385);
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1419 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1421 = _1395 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1423;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1429 = _1297 + _1427;
    float _1431 = 1.0 / _1393;
    float _1433 = _1405 * _1397;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1435;
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1441 = _1439 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1443 = fma(_1419, -2.0, _1417);
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1447 = _1445 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1449 = 1.0 / _1415;
    float _1451 = _1411 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1455 = _1421 + _1453;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1459 = _1305;
    if (!_1383)
    {
        _1457 = _1303;
    }
    float _1461 = _1457;
    float _1463 = _1429 * _1359;
    float _1465 = _1461;
    if (_1383)
    {
        _1465 = _1301;
    }
    float _1467 = _1465;
    float _1469 = _1365 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1473 = _1451 + _1471;
    float _1475 = 1.0 / _1447;
    float _1477 = _1441 * _1431;
    bool _1479 = !_1323;
    float _1481 = _1479 ? _183 : as_type<float>(_1373);
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1485 = _1483 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    bool _1487 = _1303 > 0.5;
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1491 = _1297 + _1489;
    float _1493 = _1485 * _1409;
    float _1495 = _1425 * _1449;
    float _1497 = _1491 * _1347;
    float _1499 = -_193;
    int _1501 = _1487 ? as_type<int>(_1499) : as_type<int>(_193);
    float _1503 = _643 * _643;
    bool _1505 = _1305 > 0.5;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1509 = _1437 * _1475;
    float _1511 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1507);
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1515 = _1455 * _1455;
    float _1517 = _1507;
    if (!_1383)
    {
        _1517 = _1305;
    }
    float _1519 = _1517;
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1521;
    float _1525 = fma(_1303, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1513);
    float _1527 = _1519;
    if (_1383)
    {
        _1527 = _1303;
    }
    float _1529 = _1527;
    float _1531 = fma(_1473, _1473, _1515);
    if (_1383)
    {
        _1459 = _1303;
    }
    float _1533 = _1459;
    float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1537 = _1469 + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1541 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1539;
    float _1543 = fma(_645, _645, _1503);
    float _1545 = fma(_1523, _1497, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1547 = fma(_1537, _1537, _1531);
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1549;
    float _1553 = fma(_1541, _1497, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1557 = _1555 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1563 = fma(_1551, _1497, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1565 = rsqrt(_1547);
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1569 = _1567 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1571 = fma(_647, _647, _1543);
    float _1573 = _1557 * _1375;
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1577 = _1299 + _1575;
    float _1579 = fma(_1569, _1463, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1583 = _1581 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1587 = _1299 + _1585;
    float _1589 = rsqrt(_1571);
    float _1591 = fma(_1407, _1577, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1593 = fma(_1561, _1463, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1595 = fma(_1493, _1587, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1599 = _1299 + _1597;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1603 = _1299 + _1601;
    float _1605 = fma(_1583, _1463, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1609 = _1299 + _1607;
    float _1611 = _1455 * _1565;
    float _1613 = _1473 * _1565;
    float _1615 = fma(_1573, _1599, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1617 = fma(_1509, _1603, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1619 = -_1611;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1455);
    float _1623 = -_1613;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1473);
    float _1627 = _1537 * _1565;
    float _1629 = fma(_1433, _1609, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1631 = _1621 * _1621;
    float _1633 = _1589 * _647;
    float _1635 = _1589 * _643;
    float _1637 = -_1627;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1537);
    float _1641 = fma(_1625, _1625, _1631);
    float _1643 = _1589 * _645;
    float _1645 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1647 = _1633 * _1645;
    float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1651 = _1635 * _1649;
    float _1653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1655 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1657 = _1643 * _1655;
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1661 = -_1647;
    float _1663 = fma(_1643, _1659, _1661);
    float _1665 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1667 = -_1651;
    float _1669 = fma(_1633, _1665, _1667);
    float _1671 = fma(_1639, _1639, _1641);
    float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1675 = -_1657;
    float _1677 = fma(_1635, _1673, _1675);
    float _1679 = _1663 * _1663;
    float _1681 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1683 = _1299 + _1681;
    float _1685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1687 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1689 = _1299 + _1687;
    float _1691 = fma(_1669, _1669, _1679);
    float _1693 = fma(_1477, _1683, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1695 = fma(_1495, _1689, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1697 = fma(_1677, _1677, _1691);
    bool _1699 = !_1329;
    float _1701 = _1699 ? _193 : as_type<float>(_1501);
    float _1703 = sqrt(_1671);
    float _1705 = _1653 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1707 = -_121;
    float _1709 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1389);
    float _1711 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1713 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1443);
    float _1715 = _1701 + (-0.5);
    float _1717 = _947 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1719 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1711);
    float _1721 = rsqrt(_1697);
    float _1723 = _1481 + 0.5;
    float _1725 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1727 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1729 = isnan(_1299);
    bool _1731 = _1727 || _1729;
    bool _1733 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1735 = _1731 || _1733;
    float _1737 = float(_1735);
    float _1739 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1741 = fma(_1705, _1723, _1709);
    float _1743 = -_183;
    int _1745 = _1505 ? as_type<int>(_1743) : as_type<int>(_183);
    float _1747 = -_1725;
    float _1749 = -_1713;
    float _1751 = fma(_1747, _1715, _1749);
    float _1753 = _1565 * _1703;
    float _1755 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    bool _1757 = !_1337;
    float _1759 = _1757 ? _183 : as_type<float>(_1745);
    float _1761 = _949 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1763 = _1717 * _1753;
    bool _1765 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1767 = isnan(_1299);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1773 = _1769 || _1771;
    float _1775 = float(_1773);
    float _1777 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1779 = -_193;
    int _1781 = _1357 ? as_type<int>(_1779) : as_type<int>(_193);
    float _1783 = _1669 * _1721;
    float _1785 = _1763 * _1755;
    bool _1787 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1789 = isnan(_1299);
    bool _1791 = _1787 || _1789;
    bool _1793 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1795 = _1791 || _1793;
    float _1797 = float(_1795);
    float _1799 = -_1775;
    float _1801 = _1799 + 1.0;
    float _1803 = _1663 * _1721;
    float _1805 = _1677 * _1721;
    bool _1807 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1809 = isnan(_1299);
    bool _1811 = _1807 || _1809;
    bool _1813 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1815 = _1811 || _1813;
    float _1817 = float(_1815);
    float _1819 = _1797 * _1801;
    float _1821 = -_1797;
    float _1823 = _1821 + 1.0;
    bool _1825 = !_1343;
    float _1827 = _1825 ? _193 : as_type<float>(_1781);
    float _1829 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1831 = _1761 * _1753;
    bool _1833 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1835 = isnan(_1299);
    bool _1837 = _1833 || _1835;
    bool _1839 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1841 = _1837 || _1839;
    float _1843 = float(_1841);
    float _1845 = -_1817;
    float _1847 = _1845 + 1.0;
    bool _1849 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1851 = isnan(_1299);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1857 = _1853 || _1855;
    float _1859 = float(_1857);
    float _1861 = _1831 * _1829;
    float _1863 = _1817 * _1823;
    float _1865 = -_1843;
    float _1867 = _1865 + 1.0;
    float _1869 = _1843 * _1847;
    bool _1871 = _1297 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1873 = isnan(_1297);
    bool _1875 = _1871 || _1873;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1879 = _1875 || _1877;
    float _1881 = float(_1879);
    float _1883 = _1643 * _1803;
    bool _1885 = _1297 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1887 = isnan(_1297);
    bool _1889 = _1885 || _1887;
    bool _1891 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1893 = _1889 || _1891;
    float _1895 = float(_1893);
    float _1897 = _1861 * _1643;
    bool _1899 = _1297 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1901 = isnan(_1297);
    bool _1903 = _1899 || _1901;
    bool _1905 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1907 = _1903 || _1905;
    float _1909 = float(_1907);
    float _1911 = _1859 * _1867;
    float _1913 = -_1859;
    float _1915 = _1913 + 1.0;
    bool _1917 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1919 = isnan(_1299);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1925 = _1921 || _1923;
    float _1927 = float(_1925);
    float _1929 = -_1895;
    float _1931 = _1929 + 1.0;
    bool _1933 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1935 = isnan(_1299);
    bool _1937 = _1933 || _1935;
    bool _1939 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1941 = _1937 || _1939;
    float _1943 = float(_1941);
    float _1945 = -_1909;
    float _1947 = _1945 + 1.0;
    float _1949 = _1737 * _1915;
    float _1951 = -_1737;
    float _1953 = _1951 + 1.0;
    float _1955 = _1635 * _1805;
    float _1957 = _1895 * _1947;
    float _1959 = -_1883;
    float _1961 = fma(_1635, _1783, _1959);
    float _1963 = _1943 * _1953;
    float _1965 = _1861 * _1633;
    float _1967 = -_1955;
    float _1969 = fma(_1633, _1803, _1967);
    float _1971 = _1753 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1973 = _1971 * 0.5;
    float _1975 = fma(_1785, _1783, _1897);
    float _1977 = fma(_1785, _1805, _1965);
    float _1979 = -_1943;
    float _1981 = _1979 + 1.0;
    float _1983 = fma(_1973, _1969, _1975);
    float _1985 = fma(_1973, _1961, _1977);
    float _1987 = _1927 * _1981;
    float _1989 = _1451 + _1983;
    float _1991 = _1469 + _1985;
    float _1993 = _1591 * _1987;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1997 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1999 = _1989 + _1997;
    float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2003 = _1991 + _2001;
    float _2005 = _1881 * _1931;
    float _2007 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1995);
    float _2009 = _1999 * _1999;
    float _2011 = _2003 * _2003;
    float _2013 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2015 = -_1927;
    float _2017 = _2015 + 1.0;
    float _2019 = _2009 + _2011;
    float _2021 = _1545 * _2005;
    float _2023 = _1553 * _2005;
    float _2025 = _1563 * _2005;
    float _2027 = sqrt(_2019);
    float _2029 = fma(_1777, -2.0, _2013);
    float _2031 = _1633 * _1783;
    float _2033 = _1861 * _1635;
    float _2035 = fma(_2017, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1993);
    float _2037 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2039 = -_2031;
    float _2041 = fma(_1643, _1805, _2039);
    float _2043 = fma(_1785, _1803, _2033);
    float _2045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2047 = fma(_1595, _1963, _2035);
    float _2049 = -_2037;
    float _2051 = fma(_1739, 2.0, _2049);
    float _2053 = -_1881;
    float _2055 = _2053 + 1.0;
    float _2057 = fma(_1973, _2041, _2043);
    float _2059 = fma(_1629, _1949, _2047);
    float _2061 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2021);
    float _2063 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2065 = _2027 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2067 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2023);
    float _2069 = _1421 + _2057;
    float _2071 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2025);
    float _2073 = fma(_1615, _1911, _2059);
    float _2075 = fma(_1593, _1957, _2061);
    float _2077 = fma(_1579, _1957, _2067);
    float _2079 = fma(_1605, _1957, _2071);
    float _2081 = fma(_1617, _1869, _2073);
    float _2083 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2085 = _1759 + 0.5;
    float _2087 = _1827 + (-0.5);
    float _2089 = -_121;
    float _2091 = fma(_2089, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2051);
    float _2093 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2029);
    float _2095 = _1635;
    float _2097 = _2009;
    float _2099 = _2011;
    float _2101 = _1989;
    float _2103 = _1991;
    float _2105 = _1775;
    float _2107 = _1751;
    float _2109 = _1571;
    if (!_2065)
    {
        _2095 = _2069;
    }
    float _2111 = _2095;
    float _2113 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2115 = !_2065;
    float _2117 = _2111;
    if (!_2115)
    {
        float _2119 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2123 = _2027 + _2121;
        float _2125 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2127 = rsqrt(_2019);
        float _2129 = _2123 * _2119;
        float _2131 = _2129 * 0.15915493667125701904296875;
        float _2133 = _2131 * 6.283185482025146484375;
        float _2135 = sin(_2133);
        float _2137 = _2131 * 6.283185482025146484375;
        float _2139 = cos(_2137);
        float _2141 = fma(_2135, _2125, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2143 = _2127 * _2141;
        float _2145 = fma(_1999, _2143, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2147 = _2139 + (-1.0);
        float _2149 = fma(_2003, _2143, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2153 = _2145 + _2151;
        float _2155 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2159 = _2149 + _2157;
        float _2161 = _2153 * _2153;
        float _2163 = fma(_2069, _2139, _2155);
        float _2165 = _2159 * _2159;
        _2117 = _2163;
        _2097 = _2161;
        _2099 = _2165;
        _2101 = _2145;
        _2103 = _2149;
    }
    float _2167 = _2117;
    float _2169 = _2097;
    float _2171 = _2099;
    float _2173 = _2101;
    float _2175 = _2103;
    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2179 = _2167 + _2177;
    float _2181 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1511);
    float _2183 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1525);
    float _2185 = fma(_1693, _1863, _2081);
    float _2187 = fma(_2179, _2179, _2169);
    float _2189 = -_2181;
    float _2191 = _2189 + 1.0;
    float _2193 = -_2183;
    float _2195 = _2193 + 1.0;
    float _2197 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2075);
    float _2199 = _2187 + _2171;
    float _2201 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2077);
    float _2203 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2079);
    float _2205 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2007);
    float _2207 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1719);
    float _2209 = -_2113;
    float _2211 = -_2093;
    float _2213 = fma(_2209, _2087, _2211);
    float _2215 = sqrt(_2199);
    float _2217 = -_2191;
    float _2219 = fma(_1481, _2217, _1741);
    float _2221 = fma(_1701, _2195, _1751);
    float _2223 = fma(_2083, _2085, _2091);
    float _2225 = fma(_1695, _1819, _2185);
    float _2227 = -_2205;
    float _2229 = _2227 + 1.0;
    float _2231 = -_2207;
    float _2233 = _2231 + 1.0;
    float _2235 = _2197 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2237 = _2201 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2239 = _2203 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2241 = -_2229;
    float _2243 = fma(_1759, _2241, _2223);
    float _2245 = fma(_1827, _2233, _2213);
    float _2247 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2249 = _2235 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2251 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2253 = _2239 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2255 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2225);
    out.m_60.x = _2219;
    out.m_60.y = _2221;
    out.m_60.z = _2243;
    out.m_60.w = _2245;
    bool _2257 = _2215 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2259 = isnan(_2215);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2265 = _2261 || _2263;
    out.m_62.x = _2249;
    out.m_62.y = _2251;
    out.m_62.z = _2253;
    out.m_62.w = _2247;
    out.m_64.x = _2255;
    float _2267 = _2185;
    float _2269 = _2255;
    if (!_2265)
    {
        _2105 = 1.0;
    }
    float _2271 = _2105;
    bool _2273 = !_2265;
    float _2275 = _2271;
    if (!_2273)
    {
        bool _2277 = _2215 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2279 = isnan(_2215);
        bool _2281 = _2277 || _2279;
        bool _2283 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2285 = _2281 || _2283;
        if (!_2285)
        {
            float _2287 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2289 = _2215 + _2287;
            float _2291 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2293 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2291;
            float _2295 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2297 = _2295 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2299 = 1.0 / _2293;
            float _2301 = _2289 * _2299;
            float _2303 = fma(_2301, _2297, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2275 = _2303;
            _2305 = true;
        }
        else
        {
            bool _2307 = _2215 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2309 = isnan(_2215);
            bool _2311 = _2307 || _2309;
            bool _2313 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2315 = _2311 || _2313;
            if (!_2315)
            {
                float _2317 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2319 = _2215 + _2317;
                float _2321 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2323 = _2321 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2325 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2327 = _2325 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2329 = 1.0 / _2323;
                float _2331 = _2319 * _2329;
                float _2333 = fma(_2331, _2327, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2275 = _2333;
                _2305 = true;
            }
            else
            {
                _2275 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2305 = false;
    float _2335 = _2275;
    float _2337 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2339 = _2167 + _2337;
    float _2341 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2343 = _2173 + _2341;
    float _2345 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2347 = _2175 + _2345;
    float _2349 = fma(_2339, _2335, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2351 = fma(_2343, _2335, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2353 = fma(_2347, _2335, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2355 = -_1421;
    float _2357 = _2355 + _2349;
    float _2359 = -_1451;
    float _2361 = _2359 + _2351;
    float _2363 = -_1469;
    float _2365 = _2363 + _2353;
    float _2367 = _2357 * _2357;
    float _2369 = fma(_2361, _2361, _2367);
    float _2371 = fma(_2365, _2365, _2369);
    float _2373 = sqrt(_2371);
    bool _2375 = _2373 > 0.0;
    float _2377 = _2335;
    float _2379 = _2373;
    float _2381 = _2349;
    float _2383 = _2365;
    if (!_2375)
    {
        _2377 = _2351;
    }
    float _2385 = _2377;
    float _2387 = _2385;
    if (!_2375)
    {
        _2379 = _2353;
    }
    float _2389 = _2379;
    bool _2391 = !_2375;
    float _2393 = _2389;
    float _2395 = _2389;
    if (!_2391)
    {
        bool _2397 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2399 = _2385;
        if (_2397)
        {
            float _2401 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2399 = _2401;
        }
        float _2403 = _2399;
        if (_2397)
        {
            _2267 = _1571;
        }
        float _2405 = _2267;
        float _2407 = _2405;
        float _2409 = _2403;
        if (_2397)
        {
            float _2411 = _2403 * _645;
            _2107 = _2411;
        }
        float _2413 = _2107;
        float _2415 = _2413;
        if (_2397)
        {
            float _2417 = _2403 * _643;
            _2269 = _2417;
        }
        float _2419 = _2269;
        float _2421 = _2419;
        if (_2397)
        {
            float _2423 = _2403 * _647;
            _2109 = _2423;
        }
        float _2425 = _2109;
        float _2427 = _2425;
        if (!_2397)
        {
            float _2429 = _121 + 1.0;
            if (!_161)
            {
                float _2431 = _2429 * _2429;
                float _2433 = _2431 * 0.5;
                _123 = _2433;
            }
            float _2435 = _123;
            float _2437 = _2435;
            if (!_161)
            {
                float _2439 = _2435 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2437 = _2439;
            }
            float _2441 = _2437;
            bool _2443 = !_161;
            float _2445 = _2441;
            if (!_2443)
            {
                float _2447 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2449 = log2(_2447);
                float _2451 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2453 = _2451 + 1.0;
                float _2455 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2457 = _2449 * _2429;
                float _2459 = exp2(_2457);
                float _2461 = _2455 * 0.693147182464599609375;
                float _2463 = 1.0 / _2461;
                float _2465 = 1.0 / _2453;
                float _2467 = _2459 + (-1.0);
                float _2469 = -_2467;
                float _2471 = fma(_2469, _2463, _2429);
                float _2473 = _2471 * _2465;
                float _2475 = _2473 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2445 = _2475;
            }
            float _2477 = _2445;
            float _2479 = _2477 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2481 = _2477 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2483 = _2477 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2485 = _2477;
            if (!_161)
            {
                _2485 = _2429;
            }
            float _2487 = _2485;
            float _2489 = _2479 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2491 = _2479 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2493 = _2479 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2495 = fma(_2481, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2489);
            float _2497 = fma(_2481, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2491);
            float _2499 = fma(_2483, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2495);
            bool _2501 = !_161;
            float _2503 = _2487;
            _2409 = _2497;
            if (!_2501)
            {
                float _2505 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2507 = log2(_2505);
                float _2509 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2511 = _2509 + 1.0;
                float _2513 = 1.0 / _2511;
                float _2515 = _2507 * _2429;
                float _2517 = exp2(_2515);
                float _2519 = -_2517;
                float _2521 = _2519 + 1.0;
                float _2523 = _2521 * _2513;
                _2503 = _2523;
            }
            float _2525 = _2503;
            float _2527 = fma(_2483, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2497);
            float _2529 = fma(_2481, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2493);
            float _2531 = fma(_2525, _149, _2499);
            float _2533 = fma(_2525, _147, _2527);
            float _2535 = fma(_2483, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2529);
            float _2537 = -_383;
            float _2539 = _2537 + _2531;
            float _2541 = -_389;
            float _2543 = _2541 + _2533;
            float _2545 = fma(_2525, _151, _2535);
            float _2547 = _2539 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2549 = _2539 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2551 = _2539 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2553 = -_395;
            float _2555 = _2553 + _2545;
            float _2557 = fma(_2543, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2547);
            float _2559 = fma(_2543, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2549);
            float _2561 = fma(_2543, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2551);
            float _2563 = fma(_2555, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2557);
            float _2565 = fma(_2555, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2559);
            float _2567 = fma(_2555, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2561);
            float _2569 = _2563 * _2563;
            float _2571 = fma(_2565, _2565, _2569);
            float _2573 = fma(_2567, _2567, _2571);
            _2407 = _2573;
            _653 = _2563;
            _655 = _2565;
            _657 = _2567;
            _2415 = _2565;
            _2421 = _2563;
            _2427 = _2567;
            _2393 = _2549;
        }
        float _2575 = _2407;
        float _2577 = _653;
        float _2579 = _655;
        float _2581 = _657;
        float _2583 = _2415;
        float _2585 = _2421;
        float _2587 = _2427;
        float _2589 = _2409;
        float _2591 = _2393;
        float _2593 = sqrt(_2575);
        float _2595 = rsqrt(_2371);
        bool _2597 = _2593 > 0.0;
        float _2599 = _2357 * _2595;
        float _2601 = _2361 * _2595;
        float _2603 = _2365 * _2595;
        float _2605 = _2589;
        float _2607 = _2591;
        if (!_2597)
        {
            _2605 = _2351;
        }
        float _2609 = _2605;
        _2387 = _2609;
        if (!_2597)
        {
            _2607 = _2353;
        }
        float _2611 = _2607;
        bool _2613 = !_2597;
        _2395 = _2611;
        if (!_2613)
        {
            float _2615 = rsqrt(_2575);
            float _2617 = _2615 * _2577;
            float _2619 = _2615 * _2579;
            float _2621 = _2599 * _2617;
            float _2623 = _2615 * _2581;
            float _2625 = fma(_2601, _2619, _2621);
            float _2627 = fma(_2603, _2623, _2625);
            float _2629 = _2627 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2631 = fma(_2583, _2629, _2351);
            float _2633 = fma(_2585, _2629, _2349);
            float _2635 = fma(_2587, _2629, _2353);
            _2387 = _2631;
            _2381 = _2633;
            _2395 = _2635;
        }
    }
    float _2637 = _2387;
    float _2639 = _2381;
    float _2641 = _2395;
    float _2643 = -_1613;
    float _2645 = fma(_2643, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2637);
    float _2647 = -_1611;
    float _2649 = fma(_2647, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2639);
    float _2651 = -_1627;
    float _2653 = fma(_2651, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2641);
    bool _2655 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2657 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2659 = _2655 || _2657;
    bool _2661 = isnan(0.5);
    bool _2663 = _2659 || _2661;
    float _2665 = _2649;
    float _2667 = _2645;
    float _2669 = _2653;
    if (!_2663)
    {
        float _2671 = -_1611;
        float _2673 = fma(_2671, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1421);
        float _2675 = -_1613;
        float _2677 = fma(_2675, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1451);
        float _2679 = -_1627;
        float _2681 = fma(_2679, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1469);
        float _2683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2685 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2687 = _2673 + _2685;
        float _2689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2691 = _2677 + _2689;
        float _2693 = -_1469;
        float _2695 = _2693 + _2641;
        float _2697 = -_1451;
        float _2699 = _2697 + _2637;
        float _2701 = _2687 * _2687;
        float _2703 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2705 = _2681 + _2703;
        float _2707 = -_1421;
        float _2709 = _2707 + _2639;
        float _2711 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2713 = fma(_2691, _2691, _2701);
        float _2715 = fma(_2705, _2705, _2713);
        float _2717 = 1.0 / _1753;
        float _2719 = sqrt(_2715);
        float _2721 = _2711 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2723 = precise::min(_2719, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2725 = _2723 * _2683;
        float _2727 = _2725 * _2717;
        float _2729 = _2721 * _2727;
        float _2731 = _2695 * _2727;
        float _2733 = fma(_2699, _2729, _2677);
        float _2735 = fma(_2709, _2729, _2673);
        float _2737 = fma(_2721, _2731, _2681);
        _2665 = _2735;
        _2667 = _2733;
        _2669 = _2737;
        _2383 = _2717;
    }
    float _2739 = _2665;
    float _2741 = _2667;
    float _2743 = _2669;
    float _2745 = _2383;
    float _2747 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2749 = _2739 + _2747;
    float _2751 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2753 = _2741 + _2751;
    float _2755 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2757 = _2743 + _2755;
    float _2759 = _2749 * _2749;
    float _2761 = fma(_2753, _2753, _2759);
    float _2763 = fma(_2757, _2757, _2761);
    float _2765 = rsqrt(_2763);
    float _2767 = sqrt(_2763);
    float _2769 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2771 = _2753 * _2769;
    float _2773 = _2757 * _2769;
    float _2775 = _2771 * _2771;
    float _2777 = _2773 * _2773;
    float _2779 = _2775 + _2777;
    float _2781 = sqrt(_2779);
    bool _2783 = _2781 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2785 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2787 = _2781 + _2785;
    float _2789 = _2765;
    float _2791 = _2779;
    float _2793 = _2787;
    float _2795 = _2745;
    float _2797 = _2749;
    if (_2783)
    {
        float _2799 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2789 = _2799;
    }
    float _2801 = _2789;
    if (_2783)
    {
        float _2803 = rsqrt(_2779);
        _2791 = _2803;
    }
    float _2805 = _2791;
    float _2807 = _2805;
    if (_2783)
    {
        float _2809 = _2787 * _2801;
        _2793 = _2809;
    }
    float _2811 = _2793;
    if (_2783)
    {
        float _2813 = _2811 * 0.15915493667125701904296875;
        _2795 = _2813;
    }
    float _2815 = _2795;
    float _2817 = _2757;
    float _2819 = _2815;
    if (_2783)
    {
        float _2821 = _2815 * 6.283185482025146484375;
        float _2823 = sin(_2821);
        _2817 = _2823;
    }
    float _2825 = _2817;
    float _2827 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2829 = precise::max(0.0, _2827);
    float _2831 = _2801;
    float _2833 = _2829;
    if (_2783)
    {
        float _2835 = _2815 * 6.283185482025146484375;
        float _2837 = cos(_2835);
        _2831 = _2837;
    }
    float _2839 = _2831;
    float _2841 = -_2769;
    float _2843 = -_2829;
    float _2845 = fma(_2749, _2841, _2843);
    if (_2783)
    {
        float _2847 = _2845 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2797 = _2847;
    }
    float _2849 = _2797;
    float _2851 = _2849;
    float _2853 = _2825;
    if (_2783)
    {
        float _2855 = fma(_2825, _2849, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2851 = _2855;
    }
    float _2857 = _2851;
    float _2859 = _2857;
    if (!_2783)
    {
        _2853 = _2771;
    }
    float _2861 = _2853;
    float _2863 = _2861;
    float _2865 = _2839;
    if (_2783)
    {
        float _2867 = _2839 + (-1.0);
        _2833 = _2867;
    }
    float _2869 = _2833;
    float _2871 = _2869;
    if (_2783)
    {
        float _2873 = _2805 * _2857;
        _463 = _2873;
    }
    float _2875 = _463;
    if (!_2783)
    {
        _2859 = _2845;
    }
    float _2877 = _2859;
    float _2879 = _2877;
    if (_2783)
    {
        float _2881 = _2869 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2819 = _2881;
    }
    float _2883 = _2819;
    if (_2783)
    {
        float _2885 = _2771 * _2875;
        _2863 = _2885;
    }
    float _2887 = _2863;
    if (!_2783)
    {
        _2871 = _2773;
    }
    float _2889 = _2871;
    float _2891 = _2889;
    if (_2783)
    {
        float _2893 = _2773 * _2875;
        _2891 = _2893;
    }
    float _2895 = _2891;
    if (!_2783)
    {
        _2807 = _2775;
    }
    float _2897 = _2807;
    float _2899 = _2897;
    if (_2783)
    {
        float _2901 = fma(_2845, _2839, _2883);
        _2879 = _2901;
    }
    float _2903 = _2879;
    if (_2783)
    {
        float _2905 = _2887 * _2887;
        _2899 = _2905;
    }
    float _2907 = _2899;
    if (!_2783)
    {
        _2865 = _2777;
    }
    float _2909 = _2865;
    float _2911 = _2909;
    if (_2783)
    {
        float _2913 = _2895 * _2895;
        _2911 = _2913;
    }
    float _2915 = _2911;
    float _2917 = fma(_2903, _2903, _2907);
    float _2919 = _2917 + _2915;
    float _2921 = _2739 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2923 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2925 = fma(_2767, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2923);
    float _2927 = precise::clamp(_2925, 0.0, 1.0);
    float _2929 = _2739 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2931 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2933 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2921);
    float _2935 = rsqrt(_2919);
    float _2937 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2929);
    float _2939 = -_2927;
    float _2941 = _2939 + 1.0;
    float _2943 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2933);
    float _2945 = _2739 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2947 = _2739 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2949 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2937);
    float _2951 = _2943 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2953 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2945);
    float _2955 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2947);
    float _2957 = _2949 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2959 = _2951 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2961 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2953);
    float _2963 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2955);
    float _2965 = abs(_2941);
    float _2967 = log2(_2965);
    float _2969 = -_2959;
    float _2971 = fma(_2969, _2931, 1.0);
    float _2973 = _2935 * _2887;
    float _2975 = _2961 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2977 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2979 = _2935 * _2903;
    float _2981 = _2935 * _2895;
    float _2983 = _2963 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2985 = fma(_2975, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2977);
    float _2987 = _2973 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2989 = log2(_2971);
    float _2991 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2993 = fma(_2951, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2985);
    float _2995 = -_2987;
    float _2997 = fma(_2979, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2995);
    float _2999 = _2979 + 1.0;
    float _3001 = fma(_2983, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2993);
    float _3003 = -_2981;
    float _3005 = fma(_3003, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2997);
    float _3007 = _2967 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3009 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3011 = 1.0 / _3001;
    float _3013 = fma(_3005, -0.5, 0.5);
    float _3015 = fma(_3005, 0.5, 0.5);
    float _3017 = fma(_2975, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3009);
    float _3019 = fma(_2975, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2991);
    float _3021 = fma(_2951, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3017);
    float _3023 = exp2(_3007);
    float _3025 = fma(_2951, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3019);
    float _3027 = fma(_2983, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3021);
    float _3029 = fma(_2983, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3025);
    float _3031 = _2989 * 0.693147182464599609375;
    float _3033 = sqrt(_3013);
    float _3035 = fma(_3015, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3037 = _3027 * _3011;
    float _3039 = _3029 * _3011;
    float _3041 = fma(_3015, _3035, -0.212114393711090087890625);
    float _3043 = fma(_3037, 0.5, 0.5);
    float _3045 = fma(_3039, -0.5, 0.5);
    float _3047 = -_2979;
    float _3049 = fma(_3023, _2999, _3047);
    float _3051 = fma(_3015, _3041, 1.570728778839111328125);
    float _3053 = _3031 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3055 = fma(_3049, 0.5, 0.5);
    float _3057 = _3033 * 0.636619746685028076171875;
    float3 _8048 = float3(_3043, _3045, _3053);
    float _3059 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8048, float3(0.0), isnan(_8048)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8048, float3(0.0), isnan(_8048)), level(0.0)).x;
    float _3061 = -_3051;
    float _3063 = fma(_3057, _3061, 1.0);
    float3 _8064 = float3(_3043, _3045, _3053);
    float4 _3066 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8064, float3(0.0), isnan(_8064)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8064, float3(0.0), isnan(_8064)), level(0.0)).xyzw;
    float _3068 = _3066.x;
    float _3070 = _3066.y;
    float _3072 = _3066.z;
    float _3074 = _3066.w;
    float2 _8081 = float2(_3063, _3055);
    float3 _3078 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8081, float2(0.0), isnan(_8081)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8081, float2(0.0), isnan(_8081)), level(0.0)).xyz;
    float _3080 = _3078.x;
    float _3082 = _3078.y;
    float _3084 = _3078.z;
    float _3086 = _2967 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3088 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3090 = fma(_2975, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3088);
    float _3092 = exp2(_3086);
    float _3094 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3096 = fma(_2951, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3090);
    float _3098 = fma(_2983, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3096);
    out.m_47.x = _3094;
    float _3100 = _3098 + _3001;
    out.gl_Position.x = _3027;
    out.gl_Position.y = _3029;
    out.gl_Position.z = _3098;
    out.gl_Position.w = _3001;
    float _3102 = _3100 * 0.5;
    float _3104 = -_3092;
    float _3106 = _3104 + 1.0;
    float _3108 = _3106 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _3102;
    out.m_66.w = _3001;
    float _3110 = _3108 * _3059;
    float _3112 = -_3108;
    float _3114 = _3112 + 1.0;
    float _3116 = _3074 * _3110;
    float _3118 = _3074 * _3114;
    float _3120 = _3084 * _3110;
    float _3122 = fma(_3080, _3116, _3068);
    float _3124 = fma(_3082, _3116, _3070);
    float _3126 = fma(_3074, _3120, _3072);
    out.m_68.x = _3122;
    out.m_68.y = _3124;
    out.m_68.z = _3126;
    out.m_68.w = _3118;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2305 = false;
    bool _1289 = false;
    bool _1139 = false;
    bool _971 = false;
    bool _677 = false;
    bool _521 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3183 = as_type<float>(_103);
        out.gl_Position.z = _3183;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = _121;
    if (_117)
    {
        float _125 = float(_87);
        _97 = _125;
    }
    float _127 = _97;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3253 = as_type<float>(_141);
        out.gl_Position.z = _3253;
    }
    if (_133)
    {
        return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_49.x;
    float _149 = in.m_49.y;
    float _151 = in.m_49.z;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    int _163 = as_type<int>(_143) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_143) & 2;
    bool _169 = _167 != 0;
    float _171 = _143;
    float _173 = _145;
    if (!_161)
    {
        float _175 = _145 * _145;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    bool _181 = !_165;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = _179;
    if (!_161)
    {
        float _187 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_169;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_161;
    float _197 = _189;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _145 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _145);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _233 = !_161;
    if (!_233)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _145 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _173 = _253;
    }
    float _255 = _173;
    float _257 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _259 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _261 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _263 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _265 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _267 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[8].x, _259);
    float _269 = _259;
    float _271 = _263;
    if (!_161)
    {
        float _273 = _121 * _121;
        float _275 = _273 * 0.5;
        _269 = _275;
    }
    float _277 = _269;
    float _279 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[8].y, _263);
    float _281 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[8].z, _265);
    float _283 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[10].x, _267);
    if (!_161)
    {
        float _285 = _277 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _271 = _285;
    }
    float _287 = _271;
    bool _289 = !_161;
    float _291 = _287;
    if (!_289)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _121 * _295;
        float _305 = 1.0 / _299;
        float _307 = _301 * 0.693147182464599609375;
        float _309 = exp2(_303);
        float _311 = 1.0 / _307;
        float _313 = _309 + (-1.0);
        float _315 = -_313;
        float _317 = fma(_315, _311, _121);
        float _319 = _317 * _305;
        float _321 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _321;
    }
    float _323 = _291;
    float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _327 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[10].z, _281);
    float _329 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _331 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[10].y, _279);
    float _333 = _325 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _335 = _325 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _337 = _325 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _339 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[8].y, _333);
    float _343 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[8].x, _335);
    float _345 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[8].z, _337);
    float _347 = fma(_255, _149, _331);
    float _349 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[10].y, _341);
    float _351 = _329;
    if (!_161)
    {
        _351 = _121;
    }
    float _353 = _351;
    bool _355 = !_161;
    float _357 = _353;
    if (!_355)
    {
        float _359 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _361 = log2(_359);
        float _363 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _365 = _363 + 1.0;
        float _367 = 1.0 / _365;
        float _369 = _121 * _361;
        float _371 = exp2(_369);
        float _373 = -_371;
        float _375 = _373 + 1.0;
        float _377 = _375 * _367;
        _357 = _377;
    }
    float _379 = _357;
    float _381 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[10].x, _343);
    float _383 = fma(_379, _149, _349);
    float _385 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[10].z, _345);
    float _387 = fma(_255, _147, _283);
    float _389 = fma(_379, _147, _381);
    float _391 = -_383;
    float _393 = _347 + _391;
    float _395 = fma(_379, _151, _385);
    float _397 = fma(_255, _151, _327);
    float _399 = -_389;
    float _401 = _387 + _399;
    float _403 = _393 * _393;
    float _405 = in.m_54.w;
    float _407 = -_395;
    float _409 = _397 + _407;
    float _411 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _413 = fma(_401, _401, _403);
    float _415 = _393 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _417 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _419 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _411);
    float _421 = fma(_409, _409, _413);
    float _423 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _415);
    float _425 = in.m_44.x;
    float _427 = in.m_44.y;
    float _429 = in.m_44.z;
    float _431 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _417);
    float _433 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _419);
    float _435 = sqrt(_421);
    float _437 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _423);
    float _439 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _431);
    bool _441 = _435 >= 9.9999999747524270787835121154785e-07;
    bool _443 = isnan(_435);
    bool _445 = _441 || _443;
    bool _447 = isnan(9.9999999747524270787835121154785e-07);
    bool _449 = _445 || _447;
    float _451 = fma(_387, _405, _425);
    float _453 = fma(_347, _405, _427);
    float _455 = fma(_397, _405, _429);
    float _457 = _437;
    float _459 = _433;
    float _461 = _439;
    float _463 = _383;
    if (!_449)
    {
        bool _465 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _467 = !_465;
        if (!_467)
        {
            float _469 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _471 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _473 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _475 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].y, _469);
            float _477 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _471);
            float _479 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].z, _473);
            float _481 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].y, _475);
            float _483 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].x, _477);
            float _485 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _479);
            float _487 = _481 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _489 = _481 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _491 = _481 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _493 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[5].x, _487);
            float _495 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[4].x, _489);
            float _497 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[6].x, _491);
            float _499 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[5].z, _493);
            float _501 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[4].z, _495);
            float _503 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[6].z, _497);
            float _505 = _499 * _499;
            float _507 = fma(_501, _501, _505);
            float _509 = fma(_503, _503, _507);
            float _511 = rsqrt(_509);
            float _513 = _511 * 9.9999999747524270787835121154785e-07;
            float _515 = _501 * _513;
            float _517 = _499 * _513;
            float _519 = _503 * _513;
            _457 = _517;
            _459 = _515;
            _461 = _519;
            _521 = true;
        }
        else
        {
            float _523 = _149 * _149;
            float _525 = fma(_147, _147, _523);
            float _527 = fma(_151, _151, _525);
            float _529 = sqrt(_527);
            bool _531 = _529 >= 9.9999999747524270787835121154785e-07;
            bool _533 = isnan(_529);
            bool _535 = _531 || _533;
            bool _537 = isnan(9.9999999747524270787835121154785e-07);
            bool _539 = _535 || _537;
            if (!_539)
            {
                float _541 = _427 * _427;
                float _543 = fma(_425, _425, _541);
                float _545 = fma(_429, _429, _543);
                float _547 = sqrt(_545);
                bool _549 = _547 >= 9.9999999747524270787835121154785e-07;
                bool _551 = isnan(_547);
                bool _553 = _549 || _551;
                bool _555 = isnan(9.9999999747524270787835121154785e-07);
                bool _557 = _553 || _555;
                if (!_557)
                {
                    float _559 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _561 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _559);
                    float _563 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _561);
                    float _565 = rsqrt(_563);
                    float _567 = _565 * 9.9999999747524270787835121154785e-07;
                    float _569 = _567 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _571 = _567 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _573 = _567 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _457 = _571;
                    _459 = _569;
                    _461 = _573;
                    _521 = true;
                }
                else
                {
                    float _575 = _427 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _577 = _427 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _579 = _427 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _581 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[5].x, _575);
                    float _583 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[4].x, _577);
                    float _585 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[6].x, _579);
                    float _587 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].z, _581);
                    float _589 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].z, _583);
                    float _591 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].z, _585);
                    float _593 = _587 * _587;
                    float _595 = fma(_589, _589, _593);
                    float _597 = fma(_591, _591, _595);
                    float _599 = rsqrt(_597);
                    float _601 = _599 * 9.9999999747524270787835121154785e-07;
                    float _603 = _589 * _601;
                    float _605 = _587 * _601;
                    float _607 = _591 * _601;
                    _457 = _605;
                    _459 = _603;
                    _461 = _607;
                    _521 = true;
                }
            }
            else
            {
                float _609 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _611 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _613 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _615 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _609);
                float _617 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _611);
                float _619 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _613);
                float _621 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _615);
                float _623 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _617);
                float _625 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _619);
                float _627 = _621 * _621;
                float _629 = fma(_623, _623, _627);
                float _631 = fma(_625, _625, _629);
                float _633 = rsqrt(_631);
                float _635 = _633 * 9.9999999747524270787835121154785e-07;
                float _637 = _623 * _635;
                float _639 = _621 * _635;
                float _641 = _625 * _635;
                _457 = _639;
                _459 = _637;
                _461 = _641;
            }
        }
    }
    _521 = false;
    float _643 = _457;
    float _645 = _459;
    float _647 = _461;
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _651 = !_649;
    float _653 = _643;
    float _655 = _645;
    float _657 = _647;
    float _675;
    if (!_651)
    {
        float _659 = in.m_56.x;
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _663 = _659 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _667 = _665 * _661;
        float _669 = floor(_667);
        float _671 = -_669;
        float _673 = _667 + _671;
        _675 = _673;
        _677 = true;
    }
    else
    {
        float _679 = float(_87);
        float _681 = 1.0 / _679;
        float _683 = _121 * _681;
        _675 = _683;
    }
    _677 = false;
    float _685 = _675;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _689 = _685 + _687;
    float _691 = in.m_54.x;
    float _693 = in.m_54.y;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _695;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _703;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _711;
    float _715 = 1.0 / _701;
    bool _717 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _719 = 1.0 / _697;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _723 = _685 + _721;
    float _725 = 1.0 / _709;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _729 = _685 + _727;
    float _731 = _689 * _715;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _735 = _685 + _733;
    float _737 = 1.0 / _713;
    float _739 = _729 * _719;
    bool _741 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _743 = isnan(_685);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    bool _753 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _755 = isnan(_685);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = 1.0 / _705;
    float _767 = _735 * _725;
    bool _769 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _771 = isnan(_685);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = -_779;
    float _783 = _781 + 1.0;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _787 = _685 + _785;
    float _789 = _787 * _737;
    float _791 = -_751;
    float _793 = _791 + 1.0;
    bool _795 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _797 = isnan(_685);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = _723 * _765;
    float _809 = _779 * _793;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _811;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _815;
    float _819 = _805 * _783;
    bool _821 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _823 = isnan(_685);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = fma(_813, _739, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _835 = fma(_817, _739, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _837 = -_763;
    float _839 = _837 + 1.0;
    float _841 = -_805;
    float _843 = _841 + 1.0;
    bool _845 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _847 = isnan(_685);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _861 = _831 * _839;
    float _863 = -_831;
    float _865 = _863 + 1.0;
    float _867 = _763 * _843;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _873 = -_855;
    float _875 = _873 + 1.0;
    float _877 = _855 * _865;
    float _879 = fma(_859, _731, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _881 = fma(_871, _731, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _883;
    float _887 = _833 * _877;
    float _889 = _835 * _877;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _891;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _899 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[143].x, _887);
    float _901 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[143].y, _889);
    float _903 = fma(_885, _807, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _905 = fma(_879, _861, _899);
    float _907 = fma(_893, _807, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _913 = fma(_881, _861, _901);
    float _915 = fma(_897, _767, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _917;
    float _921 = fma(_911, _767, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _923;
    float _927 = fma(_903, _867, _905);
    float _929 = fma(_907, _867, _913);
    float _931 = fma(_919, _789, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _933 = fma(_925, _789, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _935 = fma(_915, _819, _927);
    float _937 = fma(_921, _819, _929);
    float _939 = fma(_931, _809, _935);
    float _941 = fma(_933, _809, _937);
    float _943 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[148].x, _939);
    float _945 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[148].y, _941);
    float _947 = _943 * _691;
    float _949 = _945 * _693;
    bool _951 = !_717;
    float _969;
    if (!_951)
    {
        float _953 = in.m_56.x;
        float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _957 = _953 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _961 = _959 * _955;
        float _963 = floor(_961);
        float _965 = -_963;
        float _967 = _961 + _965;
        _969 = _967;
        _971 = true;
    }
    else
    {
        float _973 = float(_87);
        float _975 = 1.0 / _973;
        float _977 = _121 * _975;
        _969 = _977;
    }
    _971 = false;
    float _979 = _969;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _983 = _979 + _981;
    bool _985 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _987 = isnan(_979);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _999 = _979 + _997;
    bool _1001 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1003 = isnan(_979);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1009 = _1005 || _1007;
    float _1011 = float(_1009);
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1013;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1021 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1023 = isnan(_979);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = -_995;
    float _1035 = _1033 + 1.0;
    float _1037 = 1.0 / _1019;
    float _1039 = _1031 * _1035;
    float _1041 = -_1031;
    float _1043 = _1041 + 1.0;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1045;
    bool _1049 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1051 = 1.0 / _1015;
    float _1053 = _1011 * _1043;
    float _1055 = -_1011;
    float _1057 = _1055 + 1.0;
    float _1059 = _999 * _1037;
    float _1061 = _983 * _1051;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1063;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1067;
    float _1071 = fma(_1047, _1061, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1073 = fma(_1065, _1061, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1075 = fma(_1069, _1061, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1077 = _1071 * _1053;
    float _1079 = _1073 * _1053;
    float _1081 = _1075 * _1053;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1089 = _1087 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1093 = _1091 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1095 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1077);
    float _1097 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1079);
    float _1099 = fma(_1085, _1059, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1101 = fma(_1089, _1059, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1103 = fma(_1093, _1059, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1105 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1081);
    float _1107 = fma(_1099, _1039, _1095);
    float _1109 = fma(_1101, _1039, _1097);
    float _1111 = fma(_1103, _1039, _1105);
    float _1113 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1107);
    float _1115 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1109);
    float _1117 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1111);
    bool _1119 = !_1049;
    float _1137;
    if (!_1119)
    {
        float _1121 = in.m_56.x;
        float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1125 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _1129 = _1127 * _1123;
        float _1131 = floor(_1129);
        float _1133 = -_1131;
        float _1135 = _1129 + _1133;
        _1137 = _1135;
        _1139 = true;
    }
    else
    {
        float _1141 = float(_87);
        float _1143 = 1.0 / _1141;
        float _1145 = _121 * _1143;
        _1137 = _1145;
    }
    _1139 = false;
    float _1147 = _1137;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1151 = _1147 + _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1155 = _1153 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1157 = _1147 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1159 = isnan(_1147);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1165 = _1161 || _1163;
    float _1167 = float(_1165);
    float _1169 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1171 = _1169 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1173 = _1147 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1175 = isnan(_1147);
    bool _1177 = _1173 || _1175;
    bool _1179 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1181 = _1177 || _1179;
    float _1183 = float(_1181);
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1185;
    bool _1189 = _1147 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1191 = isnan(_1147);
    bool _1193 = _1189 || _1191;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1197 = _1193 || _1195;
    float _1199 = float(_1197);
    float _1201 = 1.0 / _1155;
    float _1203 = -_1167;
    float _1205 = _1203 + 1.0;
    bool _1207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1209 = _1183 * _1205;
    float _1211 = -_1183;
    float _1213 = _1211 + 1.0;
    float _1215 = 1.0 / _1171;
    float _1217 = _1187 * _1201;
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1221 = _1219 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1223 = _1115 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1225 = fma(_1217, _1151, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1227 = -_1199;
    float _1229 = _1227 + 1.0;
    float _1231 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1233 = _1225 * _1209;
    float _1235 = _1221 * _1215;
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1239 = _1147 + _1237;
    float _1241 = _1167 * _1229;
    float _1243 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1233);
    float _1245 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1247 = fma(_1235, _1239, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1249 = fma(_1247, _1241, _1243);
    float _1251 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1253 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1249);
    float _1255 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1257 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1259 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _1255;
    out.m_58.y = _1231;
    out.m_58.z = _1257;
    out.m_58.w = _1259;
    bool _1261 = !_1207;
    float _1285;
    float _1287;
    if (!_1261)
    {
        float _1263 = in.m_56.x;
        float _1265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1267 = float(_87);
        float _1269 = 1.0 / _1267;
        float _1271 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1273 = _121 * _1269;
        float _1275 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _1277 = _1275 * _1265;
        float _1279 = floor(_1277);
        float _1281 = -_1279;
        float _1283 = _1277 + _1281;
        _1285 = _1283;
        _1287 = _1273;
        _1289 = true;
    }
    else
    {
        float _1291 = float(_87);
        float _1293 = 1.0 / _1291;
        float _1295 = _121 * _1293;
        _1285 = _1295;
        _1287 = _1295;
    }
    _1289 = false;
    float _1297 = _1285;
    float _1299 = _1287;
    float _1301 = in.m_56.x;
    float _1303 = in.m_56.y;
    float _1305 = in.m_56.z;
    float _1307 = in.m_56.w;
    float _1309 = _453 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1311 = _453 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1315 = _1313 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1317;
    int _1321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1323 = _1321 != 0;
    float _1325 = 1.0 / _1315;
    int _1327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1329 = _1327 != 0;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _1335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1337 = _1335 != 0;
    float _1339 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1309);
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1343 = _1341 != 0;
    float _1345 = _453 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1347 = 1.0 / _1319;
    float _1349 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1311);
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1355 = _1353 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1357 = _1307 > 0.5;
    float _1359 = 1.0 / _1333;
    float _1361 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1363 = _1301 > 0.5;
    float _1365 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1349);
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1371 = -_183;
    int _1373 = _1363 ? as_type<int>(_1371) : as_type<int>(_183);
    float _1375 = 1.0 / _1355;
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1379 = _1377 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1383 = _1381 != 0;
    float _1385 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1345);
    float _1387 = -_1351;
    float _1389 = fma(_1361, 2.0, _1387);
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1395 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1339);
    float _1397 = 1.0 / _1379;
    float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1401 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1399;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1403;
    float _1407 = _1401 * _1325;
    float _1409 = 1.0 / _1369;
    float _1411 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1385);
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1419 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1421 = _1395 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1423;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1429 = _1297 + _1427;
    float _1431 = 1.0 / _1393;
    float _1433 = _1405 * _1397;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1435;
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1441 = _1439 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1443 = fma(_1419, -2.0, _1417);
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1447 = _1445 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1449 = 1.0 / _1415;
    float _1451 = _1411 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1455 = _1421 + _1453;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1459 = _1305;
    if (!_1383)
    {
        _1457 = _1303;
    }
    float _1461 = _1457;
    float _1463 = _1429 * _1359;
    float _1465 = _1461;
    if (_1383)
    {
        _1465 = _1301;
    }
    float _1467 = _1465;
    float _1469 = _1365 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1473 = _1451 + _1471;
    float _1475 = 1.0 / _1447;
    float _1477 = _1441 * _1431;
    bool _1479 = !_1323;
    float _1481 = _1479 ? _183 : as_type<float>(_1373);
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1485 = _1483 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    bool _1487 = _1303 > 0.5;
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1491 = _1297 + _1489;
    float _1493 = _1485 * _1409;
    float _1495 = _1425 * _1449;
    float _1497 = _1491 * _1347;
    float _1499 = -_193;
    int _1501 = _1487 ? as_type<int>(_1499) : as_type<int>(_193);
    float _1503 = _643 * _643;
    bool _1505 = _1305 > 0.5;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1509 = _1437 * _1475;
    float _1511 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1507);
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1515 = _1455 * _1455;
    float _1517 = _1507;
    if (!_1383)
    {
        _1517 = _1305;
    }
    float _1519 = _1517;
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1521;
    float _1525 = fma(_1303, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1513);
    float _1527 = _1519;
    if (_1383)
    {
        _1527 = _1303;
    }
    float _1529 = _1527;
    float _1531 = fma(_1473, _1473, _1515);
    if (_1383)
    {
        _1459 = _1303;
    }
    float _1533 = _1459;
    float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1537 = _1469 + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1541 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1539;
    float _1543 = fma(_645, _645, _1503);
    float _1545 = fma(_1523, _1497, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1547 = fma(_1537, _1537, _1531);
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1549;
    float _1553 = fma(_1541, _1497, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1557 = _1555 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1563 = fma(_1551, _1497, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1565 = rsqrt(_1547);
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1569 = _1567 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1571 = fma(_647, _647, _1543);
    float _1573 = _1557 * _1375;
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1577 = _1299 + _1575;
    float _1579 = fma(_1569, _1463, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1583 = _1581 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1587 = _1299 + _1585;
    float _1589 = rsqrt(_1571);
    float _1591 = fma(_1407, _1577, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1593 = fma(_1561, _1463, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1595 = fma(_1493, _1587, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1599 = _1299 + _1597;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1603 = _1299 + _1601;
    float _1605 = fma(_1583, _1463, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1609 = _1299 + _1607;
    float _1611 = _1455 * _1565;
    float _1613 = _1473 * _1565;
    float _1615 = fma(_1573, _1599, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1617 = fma(_1509, _1603, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1619 = -_1611;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1455);
    float _1623 = -_1613;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1473);
    float _1627 = _1537 * _1565;
    float _1629 = fma(_1433, _1609, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1631 = _1621 * _1621;
    float _1633 = _1589 * _647;
    float _1635 = _1589 * _643;
    float _1637 = -_1627;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1537);
    float _1641 = fma(_1625, _1625, _1631);
    float _1643 = _1589 * _645;
    float _1645 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1647 = _1633 * _1645;
    float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1651 = _1635 * _1649;
    float _1653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1655 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1657 = _1643 * _1655;
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1661 = -_1647;
    float _1663 = fma(_1643, _1659, _1661);
    float _1665 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1667 = -_1651;
    float _1669 = fma(_1633, _1665, _1667);
    float _1671 = fma(_1639, _1639, _1641);
    float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1675 = -_1657;
    float _1677 = fma(_1635, _1673, _1675);
    float _1679 = _1663 * _1663;
    float _1681 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1683 = _1299 + _1681;
    float _1685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1687 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1689 = _1299 + _1687;
    float _1691 = fma(_1669, _1669, _1679);
    float _1693 = fma(_1477, _1683, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1695 = fma(_1495, _1689, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1697 = fma(_1677, _1677, _1691);
    bool _1699 = !_1329;
    float _1701 = _1699 ? _193 : as_type<float>(_1501);
    float _1703 = sqrt(_1671);
    float _1705 = _1653 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1707 = -_121;
    float _1709 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1389);
    float _1711 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1713 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1443);
    float _1715 = _1701 + (-0.5);
    float _1717 = _947 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1719 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1711);
    float _1721 = rsqrt(_1697);
    float _1723 = _1481 + 0.5;
    float _1725 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1727 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1729 = isnan(_1299);
    bool _1731 = _1727 || _1729;
    bool _1733 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1735 = _1731 || _1733;
    float _1737 = float(_1735);
    float _1739 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1741 = fma(_1705, _1723, _1709);
    float _1743 = -_183;
    int _1745 = _1505 ? as_type<int>(_1743) : as_type<int>(_183);
    float _1747 = -_1725;
    float _1749 = -_1713;
    float _1751 = fma(_1747, _1715, _1749);
    float _1753 = _1565 * _1703;
    float _1755 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    bool _1757 = !_1337;
    float _1759 = _1757 ? _183 : as_type<float>(_1745);
    float _1761 = _949 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1763 = _1717 * _1753;
    bool _1765 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1767 = isnan(_1299);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1773 = _1769 || _1771;
    float _1775 = float(_1773);
    float _1777 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1779 = -_193;
    int _1781 = _1357 ? as_type<int>(_1779) : as_type<int>(_193);
    float _1783 = _1669 * _1721;
    float _1785 = _1763 * _1755;
    bool _1787 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1789 = isnan(_1299);
    bool _1791 = _1787 || _1789;
    bool _1793 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1795 = _1791 || _1793;
    float _1797 = float(_1795);
    float _1799 = -_1775;
    float _1801 = _1799 + 1.0;
    float _1803 = _1663 * _1721;
    float _1805 = _1677 * _1721;
    bool _1807 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1809 = isnan(_1299);
    bool _1811 = _1807 || _1809;
    bool _1813 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1815 = _1811 || _1813;
    float _1817 = float(_1815);
    float _1819 = _1797 * _1801;
    float _1821 = -_1797;
    float _1823 = _1821 + 1.0;
    bool _1825 = !_1343;
    float _1827 = _1825 ? _193 : as_type<float>(_1781);
    float _1829 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1831 = _1761 * _1753;
    bool _1833 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1835 = isnan(_1299);
    bool _1837 = _1833 || _1835;
    bool _1839 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1841 = _1837 || _1839;
    float _1843 = float(_1841);
    float _1845 = -_1817;
    float _1847 = _1845 + 1.0;
    bool _1849 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1851 = isnan(_1299);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1857 = _1853 || _1855;
    float _1859 = float(_1857);
    float _1861 = _1831 * _1829;
    float _1863 = _1817 * _1823;
    float _1865 = -_1843;
    float _1867 = _1865 + 1.0;
    float _1869 = _1843 * _1847;
    bool _1871 = _1297 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1873 = isnan(_1297);
    bool _1875 = _1871 || _1873;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1879 = _1875 || _1877;
    float _1881 = float(_1879);
    float _1883 = _1643 * _1803;
    bool _1885 = _1297 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1887 = isnan(_1297);
    bool _1889 = _1885 || _1887;
    bool _1891 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1893 = _1889 || _1891;
    float _1895 = float(_1893);
    float _1897 = _1861 * _1643;
    bool _1899 = _1297 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1901 = isnan(_1297);
    bool _1903 = _1899 || _1901;
    bool _1905 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1907 = _1903 || _1905;
    float _1909 = float(_1907);
    float _1911 = _1859 * _1867;
    float _1913 = -_1859;
    float _1915 = _1913 + 1.0;
    bool _1917 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1919 = isnan(_1299);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1925 = _1921 || _1923;
    float _1927 = float(_1925);
    float _1929 = -_1895;
    float _1931 = _1929 + 1.0;
    bool _1933 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1935 = isnan(_1299);
    bool _1937 = _1933 || _1935;
    bool _1939 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1941 = _1937 || _1939;
    float _1943 = float(_1941);
    float _1945 = -_1909;
    float _1947 = _1945 + 1.0;
    float _1949 = _1737 * _1915;
    float _1951 = -_1737;
    float _1953 = _1951 + 1.0;
    float _1955 = _1635 * _1805;
    float _1957 = _1895 * _1947;
    float _1959 = -_1883;
    float _1961 = fma(_1635, _1783, _1959);
    float _1963 = _1943 * _1953;
    float _1965 = _1861 * _1633;
    float _1967 = -_1955;
    float _1969 = fma(_1633, _1803, _1967);
    float _1971 = _1753 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1973 = _1971 * 0.5;
    float _1975 = fma(_1785, _1783, _1897);
    float _1977 = fma(_1785, _1805, _1965);
    float _1979 = -_1943;
    float _1981 = _1979 + 1.0;
    float _1983 = fma(_1973, _1969, _1975);
    float _1985 = fma(_1973, _1961, _1977);
    float _1987 = _1927 * _1981;
    float _1989 = _1451 + _1983;
    float _1991 = _1469 + _1985;
    float _1993 = _1591 * _1987;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1997 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1999 = _1989 + _1997;
    float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2003 = _1991 + _2001;
    float _2005 = _1881 * _1931;
    float _2007 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1995);
    float _2009 = _1999 * _1999;
    float _2011 = _2003 * _2003;
    float _2013 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2015 = -_1927;
    float _2017 = _2015 + 1.0;
    float _2019 = _2009 + _2011;
    float _2021 = _1545 * _2005;
    float _2023 = _1553 * _2005;
    float _2025 = _1563 * _2005;
    float _2027 = sqrt(_2019);
    float _2029 = fma(_1777, -2.0, _2013);
    float _2031 = _1633 * _1783;
    float _2033 = _1861 * _1635;
    float _2035 = fma(_2017, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1993);
    float _2037 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2039 = -_2031;
    float _2041 = fma(_1643, _1805, _2039);
    float _2043 = fma(_1785, _1803, _2033);
    float _2045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2047 = fma(_1595, _1963, _2035);
    float _2049 = -_2037;
    float _2051 = fma(_1739, 2.0, _2049);
    float _2053 = -_1881;
    float _2055 = _2053 + 1.0;
    float _2057 = fma(_1973, _2041, _2043);
    float _2059 = fma(_1629, _1949, _2047);
    float _2061 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2021);
    float _2063 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2065 = _2027 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2067 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2023);
    float _2069 = _1421 + _2057;
    float _2071 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2025);
    float _2073 = fma(_1615, _1911, _2059);
    float _2075 = fma(_1593, _1957, _2061);
    float _2077 = fma(_1579, _1957, _2067);
    float _2079 = fma(_1605, _1957, _2071);
    float _2081 = fma(_1617, _1869, _2073);
    float _2083 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2085 = _1759 + 0.5;
    float _2087 = _1827 + (-0.5);
    float _2089 = -_121;
    float _2091 = fma(_2089, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2051);
    float _2093 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2029);
    float _2095 = _1635;
    float _2097 = _2009;
    float _2099 = _2011;
    float _2101 = _1989;
    float _2103 = _1991;
    float _2105 = _1775;
    float _2107 = _1751;
    float _2109 = _1571;
    if (!_2065)
    {
        _2095 = _2069;
    }
    float _2111 = _2095;
    float _2113 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2115 = !_2065;
    float _2117 = _2111;
    if (!_2115)
    {
        float _2119 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2123 = _2027 + _2121;
        float _2125 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2127 = rsqrt(_2019);
        float _2129 = _2123 * _2119;
        float _2131 = _2129 * 0.15915493667125701904296875;
        float _2133 = _2131 * 6.283185482025146484375;
        float _2135 = sin(_2133);
        float _2137 = _2131 * 6.283185482025146484375;
        float _2139 = cos(_2137);
        float _2141 = fma(_2135, _2125, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2143 = _2127 * _2141;
        float _2145 = fma(_1999, _2143, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2147 = _2139 + (-1.0);
        float _2149 = fma(_2003, _2143, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2153 = _2145 + _2151;
        float _2155 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2159 = _2149 + _2157;
        float _2161 = _2153 * _2153;
        float _2163 = fma(_2069, _2139, _2155);
        float _2165 = _2159 * _2159;
        _2117 = _2163;
        _2097 = _2161;
        _2099 = _2165;
        _2101 = _2145;
        _2103 = _2149;
    }
    float _2167 = _2117;
    float _2169 = _2097;
    float _2171 = _2099;
    float _2173 = _2101;
    float _2175 = _2103;
    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2179 = _2167 + _2177;
    float _2181 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1511);
    float _2183 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1525);
    float _2185 = fma(_1693, _1863, _2081);
    float _2187 = fma(_2179, _2179, _2169);
    float _2189 = -_2181;
    float _2191 = _2189 + 1.0;
    float _2193 = -_2183;
    float _2195 = _2193 + 1.0;
    float _2197 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2075);
    float _2199 = _2187 + _2171;
    float _2201 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2077);
    float _2203 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2079);
    float _2205 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2007);
    float _2207 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1719);
    float _2209 = -_2113;
    float _2211 = -_2093;
    float _2213 = fma(_2209, _2087, _2211);
    float _2215 = sqrt(_2199);
    float _2217 = -_2191;
    float _2219 = fma(_1481, _2217, _1741);
    float _2221 = fma(_1701, _2195, _1751);
    float _2223 = fma(_2083, _2085, _2091);
    float _2225 = fma(_1695, _1819, _2185);
    float _2227 = -_2205;
    float _2229 = _2227 + 1.0;
    float _2231 = -_2207;
    float _2233 = _2231 + 1.0;
    float _2235 = _2197 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2237 = _2201 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2239 = _2203 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2241 = -_2229;
    float _2243 = fma(_1759, _2241, _2223);
    float _2245 = fma(_1827, _2233, _2213);
    float _2247 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2249 = _2235 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2251 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2253 = _2239 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2255 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2225);
    out.m_60.x = _2219;
    out.m_60.y = _2221;
    out.m_60.z = _2243;
    out.m_60.w = _2245;
    bool _2257 = _2215 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2259 = isnan(_2215);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2265 = _2261 || _2263;
    out.m_62.x = _2249;
    out.m_62.y = _2251;
    out.m_62.z = _2253;
    out.m_62.w = _2247;
    out.m_64.x = _2255;
    float _2267 = _2185;
    float _2269 = _2255;
    if (!_2265)
    {
        _2105 = 1.0;
    }
    float _2271 = _2105;
    bool _2273 = !_2265;
    float _2275 = _2271;
    if (!_2273)
    {
        bool _2277 = _2215 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2279 = isnan(_2215);
        bool _2281 = _2277 || _2279;
        bool _2283 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2285 = _2281 || _2283;
        if (!_2285)
        {
            float _2287 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2289 = _2215 + _2287;
            float _2291 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2293 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2291;
            float _2295 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2297 = _2295 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2299 = 1.0 / _2293;
            float _2301 = _2289 * _2299;
            float _2303 = fma(_2301, _2297, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2275 = _2303;
            _2305 = true;
        }
        else
        {
            bool _2307 = _2215 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2309 = isnan(_2215);
            bool _2311 = _2307 || _2309;
            bool _2313 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2315 = _2311 || _2313;
            if (!_2315)
            {
                float _2317 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2319 = _2215 + _2317;
                float _2321 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2323 = _2321 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2325 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2327 = _2325 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2329 = 1.0 / _2323;
                float _2331 = _2319 * _2329;
                float _2333 = fma(_2331, _2327, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2275 = _2333;
                _2305 = true;
            }
            else
            {
                _2275 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2305 = false;
    float _2335 = _2275;
    float _2337 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2339 = _2167 + _2337;
    float _2341 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2343 = _2173 + _2341;
    float _2345 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2347 = _2175 + _2345;
    float _2349 = fma(_2339, _2335, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2351 = fma(_2343, _2335, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2353 = fma(_2347, _2335, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2355 = -_1421;
    float _2357 = _2355 + _2349;
    float _2359 = -_1451;
    float _2361 = _2359 + _2351;
    float _2363 = -_1469;
    float _2365 = _2363 + _2353;
    float _2367 = _2357 * _2357;
    float _2369 = fma(_2361, _2361, _2367);
    float _2371 = fma(_2365, _2365, _2369);
    float _2373 = sqrt(_2371);
    bool _2375 = _2373 > 0.0;
    float _2377 = _2335;
    float _2379 = _2373;
    float _2381 = _2349;
    float _2383 = _2365;
    if (!_2375)
    {
        _2377 = _2351;
    }
    float _2385 = _2377;
    float _2387 = _2385;
    if (!_2375)
    {
        _2379 = _2353;
    }
    float _2389 = _2379;
    bool _2391 = !_2375;
    float _2393 = _2389;
    float _2395 = _2389;
    if (!_2391)
    {
        bool _2397 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2399 = _2385;
        if (_2397)
        {
            float _2401 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2399 = _2401;
        }
        float _2403 = _2399;
        if (_2397)
        {
            _2267 = _1571;
        }
        float _2405 = _2267;
        float _2407 = _2405;
        float _2409 = _2403;
        if (_2397)
        {
            float _2411 = _2403 * _645;
            _2107 = _2411;
        }
        float _2413 = _2107;
        float _2415 = _2413;
        if (_2397)
        {
            float _2417 = _2403 * _643;
            _2269 = _2417;
        }
        float _2419 = _2269;
        float _2421 = _2419;
        if (_2397)
        {
            float _2423 = _2403 * _647;
            _2109 = _2423;
        }
        float _2425 = _2109;
        float _2427 = _2425;
        if (!_2397)
        {
            float _2429 = _121 + 1.0;
            if (!_161)
            {
                float _2431 = _2429 * _2429;
                float _2433 = _2431 * 0.5;
                _123 = _2433;
            }
            float _2435 = _123;
            float _2437 = _2435;
            if (!_161)
            {
                float _2439 = _2435 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2437 = _2439;
            }
            float _2441 = _2437;
            bool _2443 = !_161;
            float _2445 = _2441;
            if (!_2443)
            {
                float _2447 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2449 = log2(_2447);
                float _2451 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2453 = _2451 + 1.0;
                float _2455 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2457 = _2449 * _2429;
                float _2459 = exp2(_2457);
                float _2461 = _2455 * 0.693147182464599609375;
                float _2463 = 1.0 / _2461;
                float _2465 = 1.0 / _2453;
                float _2467 = _2459 + (-1.0);
                float _2469 = -_2467;
                float _2471 = fma(_2469, _2463, _2429);
                float _2473 = _2471 * _2465;
                float _2475 = _2473 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2445 = _2475;
            }
            float _2477 = _2445;
            float _2479 = _2477 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2481 = _2477 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2483 = _2477 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2485 = _2477;
            if (!_161)
            {
                _2485 = _2429;
            }
            float _2487 = _2485;
            float _2489 = _2479 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2491 = _2479 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2493 = _2479 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2495 = fma(_2481, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2489);
            float _2497 = fma(_2481, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2491);
            float _2499 = fma(_2483, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2495);
            bool _2501 = !_161;
            float _2503 = _2487;
            _2409 = _2497;
            if (!_2501)
            {
                float _2505 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2507 = log2(_2505);
                float _2509 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2511 = _2509 + 1.0;
                float _2513 = 1.0 / _2511;
                float _2515 = _2507 * _2429;
                float _2517 = exp2(_2515);
                float _2519 = -_2517;
                float _2521 = _2519 + 1.0;
                float _2523 = _2521 * _2513;
                _2503 = _2523;
            }
            float _2525 = _2503;
            float _2527 = fma(_2483, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2497);
            float _2529 = fma(_2481, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2493);
            float _2531 = fma(_2525, _149, _2499);
            float _2533 = fma(_2525, _147, _2527);
            float _2535 = fma(_2483, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2529);
            float _2537 = -_383;
            float _2539 = _2537 + _2531;
            float _2541 = -_389;
            float _2543 = _2541 + _2533;
            float _2545 = fma(_2525, _151, _2535);
            float _2547 = _2539 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2549 = _2539 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2551 = _2539 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2553 = -_395;
            float _2555 = _2553 + _2545;
            float _2557 = fma(_2543, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2547);
            float _2559 = fma(_2543, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2549);
            float _2561 = fma(_2543, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2551);
            float _2563 = fma(_2555, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2557);
            float _2565 = fma(_2555, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2559);
            float _2567 = fma(_2555, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2561);
            float _2569 = _2563 * _2563;
            float _2571 = fma(_2565, _2565, _2569);
            float _2573 = fma(_2567, _2567, _2571);
            _2407 = _2573;
            _653 = _2563;
            _655 = _2565;
            _657 = _2567;
            _2415 = _2565;
            _2421 = _2563;
            _2427 = _2567;
            _2393 = _2549;
        }
        float _2575 = _2407;
        float _2577 = _653;
        float _2579 = _655;
        float _2581 = _657;
        float _2583 = _2415;
        float _2585 = _2421;
        float _2587 = _2427;
        float _2589 = _2409;
        float _2591 = _2393;
        float _2593 = sqrt(_2575);
        float _2595 = rsqrt(_2371);
        bool _2597 = _2593 > 0.0;
        float _2599 = _2357 * _2595;
        float _2601 = _2361 * _2595;
        float _2603 = _2365 * _2595;
        float _2605 = _2589;
        float _2607 = _2591;
        if (!_2597)
        {
            _2605 = _2351;
        }
        float _2609 = _2605;
        _2387 = _2609;
        if (!_2597)
        {
            _2607 = _2353;
        }
        float _2611 = _2607;
        bool _2613 = !_2597;
        _2395 = _2611;
        if (!_2613)
        {
            float _2615 = rsqrt(_2575);
            float _2617 = _2615 * _2577;
            float _2619 = _2615 * _2579;
            float _2621 = _2599 * _2617;
            float _2623 = _2615 * _2581;
            float _2625 = fma(_2601, _2619, _2621);
            float _2627 = fma(_2603, _2623, _2625);
            float _2629 = _2627 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2631 = fma(_2583, _2629, _2351);
            float _2633 = fma(_2585, _2629, _2349);
            float _2635 = fma(_2587, _2629, _2353);
            _2387 = _2631;
            _2381 = _2633;
            _2395 = _2635;
        }
    }
    float _2637 = _2387;
    float _2639 = _2381;
    float _2641 = _2395;
    float _2643 = -_1613;
    float _2645 = fma(_2643, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2637);
    float _2647 = -_1611;
    float _2649 = fma(_2647, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2639);
    float _2651 = -_1627;
    float _2653 = fma(_2651, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2641);
    bool _2655 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2657 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2659 = _2655 || _2657;
    bool _2661 = isnan(0.5);
    bool _2663 = _2659 || _2661;
    float _2665 = _2649;
    float _2667 = _2645;
    float _2669 = _2653;
    if (!_2663)
    {
        float _2671 = -_1611;
        float _2673 = fma(_2671, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1421);
        float _2675 = -_1613;
        float _2677 = fma(_2675, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1451);
        float _2679 = -_1627;
        float _2681 = fma(_2679, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1469);
        float _2683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2685 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2687 = _2673 + _2685;
        float _2689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2691 = _2677 + _2689;
        float _2693 = -_1469;
        float _2695 = _2693 + _2641;
        float _2697 = -_1451;
        float _2699 = _2697 + _2637;
        float _2701 = _2687 * _2687;
        float _2703 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2705 = _2681 + _2703;
        float _2707 = -_1421;
        float _2709 = _2707 + _2639;
        float _2711 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2713 = fma(_2691, _2691, _2701);
        float _2715 = fma(_2705, _2705, _2713);
        float _2717 = 1.0 / _1753;
        float _2719 = sqrt(_2715);
        float _2721 = _2711 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2723 = precise::min(_2719, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2725 = _2723 * _2683;
        float _2727 = _2725 * _2717;
        float _2729 = _2721 * _2727;
        float _2731 = _2695 * _2727;
        float _2733 = fma(_2699, _2729, _2677);
        float _2735 = fma(_2709, _2729, _2673);
        float _2737 = fma(_2721, _2731, _2681);
        _2665 = _2735;
        _2667 = _2733;
        _2669 = _2737;
        _2383 = _2717;
    }
    float _2739 = _2665;
    float _2741 = _2667;
    float _2743 = _2669;
    float _2745 = _2383;
    float _2747 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2749 = _2739 + _2747;
    float _2751 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2753 = _2741 + _2751;
    float _2755 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2757 = _2743 + _2755;
    float _2759 = _2749 * _2749;
    float _2761 = fma(_2753, _2753, _2759);
    float _2763 = fma(_2757, _2757, _2761);
    float _2765 = rsqrt(_2763);
    float _2767 = sqrt(_2763);
    float _2769 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2771 = _2753 * _2769;
    float _2773 = _2757 * _2769;
    float _2775 = _2771 * _2771;
    float _2777 = _2773 * _2773;
    float _2779 = _2775 + _2777;
    float _2781 = sqrt(_2779);
    bool _2783 = _2781 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2785 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2787 = _2781 + _2785;
    float _2789 = _2765;
    float _2791 = _2779;
    float _2793 = _2787;
    float _2795 = _2745;
    float _2797 = _2749;
    if (_2783)
    {
        float _2799 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2789 = _2799;
    }
    float _2801 = _2789;
    if (_2783)
    {
        float _2803 = rsqrt(_2779);
        _2791 = _2803;
    }
    float _2805 = _2791;
    float _2807 = _2805;
    if (_2783)
    {
        float _2809 = _2787 * _2801;
        _2793 = _2809;
    }
    float _2811 = _2793;
    if (_2783)
    {
        float _2813 = _2811 * 0.15915493667125701904296875;
        _2795 = _2813;
    }
    float _2815 = _2795;
    float _2817 = _2757;
    float _2819 = _2815;
    if (_2783)
    {
        float _2821 = _2815 * 6.283185482025146484375;
        float _2823 = sin(_2821);
        _2817 = _2823;
    }
    float _2825 = _2817;
    float _2827 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2829 = precise::max(0.0, _2827);
    float _2831 = _2801;
    float _2833 = _2829;
    if (_2783)
    {
        float _2835 = _2815 * 6.283185482025146484375;
        float _2837 = cos(_2835);
        _2831 = _2837;
    }
    float _2839 = _2831;
    float _2841 = -_2769;
    float _2843 = -_2829;
    float _2845 = fma(_2749, _2841, _2843);
    if (_2783)
    {
        float _2847 = _2845 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2797 = _2847;
    }
    float _2849 = _2797;
    float _2851 = _2849;
    float _2853 = _2825;
    if (_2783)
    {
        float _2855 = fma(_2825, _2849, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2851 = _2855;
    }
    float _2857 = _2851;
    float _2859 = _2857;
    if (!_2783)
    {
        _2853 = _2771;
    }
    float _2861 = _2853;
    float _2863 = _2861;
    float _2865 = _2839;
    if (_2783)
    {
        float _2867 = _2839 + (-1.0);
        _2833 = _2867;
    }
    float _2869 = _2833;
    float _2871 = _2869;
    if (_2783)
    {
        float _2873 = _2805 * _2857;
        _463 = _2873;
    }
    float _2875 = _463;
    if (!_2783)
    {
        _2859 = _2845;
    }
    float _2877 = _2859;
    float _2879 = _2877;
    if (_2783)
    {
        float _2881 = _2869 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2819 = _2881;
    }
    float _2883 = _2819;
    if (_2783)
    {
        float _2885 = _2771 * _2875;
        _2863 = _2885;
    }
    float _2887 = _2863;
    if (!_2783)
    {
        _2871 = _2773;
    }
    float _2889 = _2871;
    float _2891 = _2889;
    if (_2783)
    {
        float _2893 = _2773 * _2875;
        _2891 = _2893;
    }
    float _2895 = _2891;
    if (!_2783)
    {
        _2807 = _2775;
    }
    float _2897 = _2807;
    float _2899 = _2897;
    if (_2783)
    {
        float _2901 = fma(_2845, _2839, _2883);
        _2879 = _2901;
    }
    float _2903 = _2879;
    if (_2783)
    {
        float _2905 = _2887 * _2887;
        _2899 = _2905;
    }
    float _2907 = _2899;
    if (!_2783)
    {
        _2865 = _2777;
    }
    float _2909 = _2865;
    float _2911 = _2909;
    if (_2783)
    {
        float _2913 = _2895 * _2895;
        _2911 = _2913;
    }
    float _2915 = _2911;
    float _2917 = fma(_2903, _2903, _2907);
    float _2919 = _2917 + _2915;
    float _2921 = _2739 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2923 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2925 = fma(_2767, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2923);
    float _2927 = precise::clamp(_2925, 0.0, 1.0);
    float _2929 = _2739 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2931 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2933 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2921);
    float _2935 = rsqrt(_2919);
    float _2937 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2929);
    float _2939 = -_2927;
    float _2941 = _2939 + 1.0;
    float _2943 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2933);
    float _2945 = _2739 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2947 = _2739 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2949 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2937);
    float _2951 = _2943 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2953 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2945);
    float _2955 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2947);
    float _2957 = _2949 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2959 = _2951 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2961 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2953);
    float _2963 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2955);
    float _2965 = abs(_2941);
    float _2967 = log2(_2965);
    float _2969 = -_2959;
    float _2971 = fma(_2969, _2931, 1.0);
    float _2973 = _2935 * _2887;
    float _2975 = _2961 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2977 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2979 = _2935 * _2903;
    float _2981 = _2935 * _2895;
    float _2983 = _2963 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2985 = fma(_2975, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2977);
    float _2987 = _2973 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2989 = log2(_2971);
    float _2991 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2993 = fma(_2951, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2985);
    float _2995 = -_2987;
    float _2997 = fma(_2979, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2995);
    float _2999 = _2979 + 1.0;
    float _3001 = fma(_2983, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2993);
    float _3003 = -_2981;
    float _3005 = fma(_3003, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2997);
    float _3007 = _2967 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3009 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3011 = 1.0 / _3001;
    float _3013 = fma(_3005, -0.5, 0.5);
    float _3015 = fma(_3005, 0.5, 0.5);
    float _3017 = fma(_2975, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3009);
    float _3019 = fma(_2975, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2991);
    float _3021 = fma(_2951, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3017);
    float _3023 = exp2(_3007);
    float _3025 = fma(_2951, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3019);
    float _3027 = fma(_2983, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3021);
    float _3029 = fma(_2983, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3025);
    float _3031 = _2989 * 0.693147182464599609375;
    float _3033 = sqrt(_3013);
    float _3035 = fma(_3015, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3037 = _3027 * _3011;
    float _3039 = _3029 * _3011;
    float _3041 = fma(_3015, _3035, -0.212114393711090087890625);
    float _3043 = fma(_3037, 0.5, 0.5);
    float _3045 = fma(_3039, -0.5, 0.5);
    float _3047 = -_2979;
    float _3049 = fma(_3023, _2999, _3047);
    float _3051 = fma(_3015, _3041, 1.570728778839111328125);
    float _3053 = _3031 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3055 = fma(_3049, 0.5, 0.5);
    float _3057 = _3033 * 0.636619746685028076171875;
    float3 _8048 = float3(_3043, _3045, _3053);
    float _3059 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8048, float3(0.0), isnan(_8048)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8048, float3(0.0), isnan(_8048)), level(0.0)).x;
    float _3061 = -_3051;
    float _3063 = fma(_3057, _3061, 1.0);
    float3 _8064 = float3(_3043, _3045, _3053);
    float4 _3066 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8064, float3(0.0), isnan(_8064)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8064, float3(0.0), isnan(_8064)), level(0.0)).xyzw;
    float _3068 = _3066.x;
    float _3070 = _3066.y;
    float _3072 = _3066.z;
    float _3074 = _3066.w;
    float2 _8081 = float2(_3063, _3055);
    float3 _3078 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8081, float2(0.0), isnan(_8081)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8081, float2(0.0), isnan(_8081)), level(0.0)).xyz;
    float _3080 = _3078.x;
    float _3082 = _3078.y;
    float _3084 = _3078.z;
    float _3086 = _2967 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3088 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3090 = fma(_2975, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3088);
    float _3092 = exp2(_3086);
    float _3094 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3096 = fma(_2951, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3090);
    float _3098 = fma(_2983, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3096);
    out.m_47.x = _3094;
    float _3100 = _3098 + _3001;
    out.gl_Position.x = _3027;
    out.gl_Position.y = _3029;
    out.gl_Position.z = _3098;
    out.gl_Position.w = _3001;
    float _3102 = _3100 * 0.5;
    float _3104 = -_3092;
    float _3106 = _3104 + 1.0;
    float _3108 = _3106 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _3102;
    out.m_66.w = _3001;
    float _3110 = _3108 * _3059;
    float _3112 = -_3108;
    float _3114 = _3112 + 1.0;
    float _3116 = _3074 * _3110;
    float _3118 = _3074 * _3114;
    float _3120 = _3084 * _3110;
    float _3122 = fma(_3080, _3116, _3068);
    float _3124 = fma(_3082, _3116, _3070);
    float _3126 = fma(_3074, _3120, _3072);
    out.m_68.x = _3122;
    out.m_68.y = _3124;
    out.m_68.z = _3126;
    out.m_68.w = _3118;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2305 = false;
    bool _1289 = false;
    bool _1139 = false;
    bool _971 = false;
    bool _677 = false;
    bool _521 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3183 = as_type<float>(_103);
        out.gl_Position.z = _3183;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = _121;
    if (_117)
    {
        float _125 = float(_87);
        _97 = _125;
    }
    float _127 = _97;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3253 = as_type<float>(_141);
        out.gl_Position.z = _3253;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_49.x;
    float _149 = in.m_49.y;
    float _151 = in.m_49.z;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    int _163 = as_type<int>(_143) & 1;
    bool _165 = _163 != 0;
    int _167 = as_type<int>(_143) & 2;
    bool _169 = _167 != 0;
    float _171 = _143;
    float _173 = _145;
    if (!_161)
    {
        float _175 = _145 * _145;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    bool _181 = !_165;
    float _183 = _181 ? (-0.5) : 0.5;
    float _185 = _179;
    if (!_161)
    {
        float _187 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _187;
    }
    float _189 = _185;
    bool _191 = !_169;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_161;
    float _197 = _189;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _145 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _145);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _233 = !_161;
    if (!_233)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _145 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _173 = _253;
    }
    float _255 = _173;
    float _257 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _259 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _261 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _263 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _265 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _267 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[8].x, _259);
    float _269 = _259;
    float _271 = _263;
    if (!_161)
    {
        float _273 = _121 * _121;
        float _275 = _273 * 0.5;
        _269 = _275;
    }
    float _277 = _269;
    float _279 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[8].y, _263);
    float _281 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[8].z, _265);
    float _283 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[10].x, _267);
    if (!_161)
    {
        float _285 = _277 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _271 = _285;
    }
    float _287 = _271;
    bool _289 = !_161;
    float _291 = _287;
    if (!_289)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _121 * _295;
        float _305 = 1.0 / _299;
        float _307 = _301 * 0.693147182464599609375;
        float _309 = exp2(_303);
        float _311 = 1.0 / _307;
        float _313 = _309 + (-1.0);
        float _315 = -_313;
        float _317 = fma(_315, _311, _121);
        float _319 = _317 * _305;
        float _321 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _321;
    }
    float _323 = _291;
    float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _327 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[10].z, _281);
    float _329 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _331 = fma(_261, (*spvDescriptorSet0.vp_c10)._m0[10].y, _279);
    float _333 = _325 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _335 = _325 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _337 = _325 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _339 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[8].y, _333);
    float _343 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[8].x, _335);
    float _345 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[8].z, _337);
    float _347 = fma(_255, _149, _331);
    float _349 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[10].y, _341);
    float _351 = _329;
    if (!_161)
    {
        _351 = _121;
    }
    float _353 = _351;
    bool _355 = !_161;
    float _357 = _353;
    if (!_355)
    {
        float _359 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _361 = log2(_359);
        float _363 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _365 = _363 + 1.0;
        float _367 = 1.0 / _365;
        float _369 = _121 * _361;
        float _371 = exp2(_369);
        float _373 = -_371;
        float _375 = _373 + 1.0;
        float _377 = _375 * _367;
        _357 = _377;
    }
    float _379 = _357;
    float _381 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[10].x, _343);
    float _383 = fma(_379, _149, _349);
    float _385 = fma(_339, (*spvDescriptorSet0.vp_c10)._m0[10].z, _345);
    float _387 = fma(_255, _147, _283);
    float _389 = fma(_379, _147, _381);
    float _391 = -_383;
    float _393 = _347 + _391;
    float _395 = fma(_379, _151, _385);
    float _397 = fma(_255, _151, _327);
    float _399 = -_389;
    float _401 = _387 + _399;
    float _403 = _393 * _393;
    float _405 = in.m_54.w;
    float _407 = -_395;
    float _409 = _397 + _407;
    float _411 = _393 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _413 = fma(_401, _401, _403);
    float _415 = _393 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _417 = _393 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _419 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _411);
    float _421 = fma(_409, _409, _413);
    float _423 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _415);
    float _425 = in.m_44.x;
    float _427 = in.m_44.y;
    float _429 = in.m_44.z;
    float _431 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _417);
    float _433 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _419);
    float _435 = sqrt(_421);
    float _437 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _423);
    float _439 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _431);
    bool _441 = _435 >= 9.9999999747524270787835121154785e-07;
    bool _443 = isnan(_435);
    bool _445 = _441 || _443;
    bool _447 = isnan(9.9999999747524270787835121154785e-07);
    bool _449 = _445 || _447;
    float _451 = fma(_387, _405, _425);
    float _453 = fma(_347, _405, _427);
    float _455 = fma(_397, _405, _429);
    float _457 = _437;
    float _459 = _433;
    float _461 = _439;
    float _463 = _383;
    if (!_449)
    {
        bool _465 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _467 = !_465;
        if (!_467)
        {
            float _469 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _471 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _473 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _475 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].y, _469);
            float _477 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].x, _471);
            float _479 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[8].z, _473);
            float _481 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].y, _475);
            float _483 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].x, _477);
            float _485 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[10].z, _479);
            float _487 = _481 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _489 = _481 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _491 = _481 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _493 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[5].x, _487);
            float _495 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[4].x, _489);
            float _497 = fma(_483, (*spvDescriptorSet0.vp_c10)._m0[6].x, _491);
            float _499 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[5].z, _493);
            float _501 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[4].z, _495);
            float _503 = fma(_485, (*spvDescriptorSet0.vp_c10)._m0[6].z, _497);
            float _505 = _499 * _499;
            float _507 = fma(_501, _501, _505);
            float _509 = fma(_503, _503, _507);
            float _511 = rsqrt(_509);
            float _513 = _511 * 9.9999999747524270787835121154785e-07;
            float _515 = _501 * _513;
            float _517 = _499 * _513;
            float _519 = _503 * _513;
            _457 = _517;
            _459 = _515;
            _461 = _519;
            _521 = true;
        }
        else
        {
            float _523 = _149 * _149;
            float _525 = fma(_147, _147, _523);
            float _527 = fma(_151, _151, _525);
            float _529 = sqrt(_527);
            bool _531 = _529 >= 9.9999999747524270787835121154785e-07;
            bool _533 = isnan(_529);
            bool _535 = _531 || _533;
            bool _537 = isnan(9.9999999747524270787835121154785e-07);
            bool _539 = _535 || _537;
            if (!_539)
            {
                float _541 = _427 * _427;
                float _543 = fma(_425, _425, _541);
                float _545 = fma(_429, _429, _543);
                float _547 = sqrt(_545);
                bool _549 = _547 >= 9.9999999747524270787835121154785e-07;
                bool _551 = isnan(_547);
                bool _553 = _549 || _551;
                bool _555 = isnan(9.9999999747524270787835121154785e-07);
                bool _557 = _553 || _555;
                if (!_557)
                {
                    float _559 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _561 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _559);
                    float _563 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _561);
                    float _565 = rsqrt(_563);
                    float _567 = _565 * 9.9999999747524270787835121154785e-07;
                    float _569 = _567 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _571 = _567 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _573 = _567 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _457 = _571;
                    _459 = _569;
                    _461 = _573;
                    _521 = true;
                }
                else
                {
                    float _575 = _427 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _577 = _427 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _579 = _427 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _581 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[5].x, _575);
                    float _583 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[4].x, _577);
                    float _585 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[6].x, _579);
                    float _587 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[5].z, _581);
                    float _589 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[4].z, _583);
                    float _591 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[6].z, _585);
                    float _593 = _587 * _587;
                    float _595 = fma(_589, _589, _593);
                    float _597 = fma(_591, _591, _595);
                    float _599 = rsqrt(_597);
                    float _601 = _599 * 9.9999999747524270787835121154785e-07;
                    float _603 = _589 * _601;
                    float _605 = _587 * _601;
                    float _607 = _591 * _601;
                    _457 = _605;
                    _459 = _603;
                    _461 = _607;
                    _521 = true;
                }
            }
            else
            {
                float _609 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _611 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _613 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _615 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _609);
                float _617 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _611);
                float _619 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _613);
                float _621 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _615);
                float _623 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _617);
                float _625 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _619);
                float _627 = _621 * _621;
                float _629 = fma(_623, _623, _627);
                float _631 = fma(_625, _625, _629);
                float _633 = rsqrt(_631);
                float _635 = _633 * 9.9999999747524270787835121154785e-07;
                float _637 = _623 * _635;
                float _639 = _621 * _635;
                float _641 = _625 * _635;
                _457 = _639;
                _459 = _637;
                _461 = _641;
            }
        }
    }
    _521 = false;
    float _643 = _457;
    float _645 = _459;
    float _647 = _461;
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _651 = !_649;
    float _653 = _643;
    float _655 = _645;
    float _657 = _647;
    float _675;
    if (!_651)
    {
        float _659 = in.m_56.x;
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _663 = _659 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _667 = _665 * _661;
        float _669 = floor(_667);
        float _671 = -_669;
        float _673 = _667 + _671;
        _675 = _673;
        _677 = true;
    }
    else
    {
        float _679 = float(_87);
        float _681 = 1.0 / _679;
        float _683 = _121 * _681;
        _675 = _683;
    }
    _677 = false;
    float _685 = _675;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _689 = _685 + _687;
    float _691 = in.m_54.x;
    float _693 = in.m_54.y;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _695;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _703;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _711;
    float _715 = 1.0 / _701;
    bool _717 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _719 = 1.0 / _697;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _723 = _685 + _721;
    float _725 = 1.0 / _709;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _729 = _685 + _727;
    float _731 = _689 * _715;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _735 = _685 + _733;
    float _737 = 1.0 / _713;
    float _739 = _729 * _719;
    bool _741 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _743 = isnan(_685);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    bool _753 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _755 = isnan(_685);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = 1.0 / _705;
    float _767 = _735 * _725;
    bool _769 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _771 = isnan(_685);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = -_779;
    float _783 = _781 + 1.0;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _787 = _685 + _785;
    float _789 = _787 * _737;
    float _791 = -_751;
    float _793 = _791 + 1.0;
    bool _795 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _797 = isnan(_685);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = _723 * _765;
    float _809 = _779 * _793;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _811;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _815;
    float _819 = _805 * _783;
    bool _821 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _823 = isnan(_685);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = fma(_813, _739, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _835 = fma(_817, _739, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _837 = -_763;
    float _839 = _837 + 1.0;
    float _841 = -_805;
    float _843 = _841 + 1.0;
    bool _845 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _847 = isnan(_685);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _859 = _857 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _861 = _831 * _839;
    float _863 = -_831;
    float _865 = _863 + 1.0;
    float _867 = _763 * _843;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _873 = -_855;
    float _875 = _873 + 1.0;
    float _877 = _855 * _865;
    float _879 = fma(_859, _731, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _881 = fma(_871, _731, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _883;
    float _887 = _833 * _877;
    float _889 = _835 * _877;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _893 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _891;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _899 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[143].x, _887);
    float _901 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[143].y, _889);
    float _903 = fma(_885, _807, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _905 = fma(_879, _861, _899);
    float _907 = fma(_893, _807, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _913 = fma(_881, _861, _901);
    float _915 = fma(_897, _767, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _917;
    float _921 = fma(_911, _767, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _923;
    float _927 = fma(_903, _867, _905);
    float _929 = fma(_907, _867, _913);
    float _931 = fma(_919, _789, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _933 = fma(_925, _789, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _935 = fma(_915, _819, _927);
    float _937 = fma(_921, _819, _929);
    float _939 = fma(_931, _809, _935);
    float _941 = fma(_933, _809, _937);
    float _943 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[148].x, _939);
    float _945 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[148].y, _941);
    float _947 = _943 * _691;
    float _949 = _945 * _693;
    bool _951 = !_717;
    float _969;
    if (!_951)
    {
        float _953 = in.m_56.x;
        float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _957 = _953 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _961 = _959 * _955;
        float _963 = floor(_961);
        float _965 = -_963;
        float _967 = _961 + _965;
        _969 = _967;
        _971 = true;
    }
    else
    {
        float _973 = float(_87);
        float _975 = 1.0 / _973;
        float _977 = _121 * _975;
        _969 = _977;
    }
    _971 = false;
    float _979 = _969;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _983 = _979 + _981;
    bool _985 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _987 = isnan(_979);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _999 = _979 + _997;
    bool _1001 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1003 = isnan(_979);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1009 = _1005 || _1007;
    float _1011 = float(_1009);
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1013;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1021 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1023 = isnan(_979);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = -_995;
    float _1035 = _1033 + 1.0;
    float _1037 = 1.0 / _1019;
    float _1039 = _1031 * _1035;
    float _1041 = -_1031;
    float _1043 = _1041 + 1.0;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1045;
    bool _1049 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1051 = 1.0 / _1015;
    float _1053 = _1011 * _1043;
    float _1055 = -_1011;
    float _1057 = _1055 + 1.0;
    float _1059 = _999 * _1037;
    float _1061 = _983 * _1051;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1063;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1067;
    float _1071 = fma(_1047, _1061, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1073 = fma(_1065, _1061, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1075 = fma(_1069, _1061, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1077 = _1071 * _1053;
    float _1079 = _1073 * _1053;
    float _1081 = _1075 * _1053;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1089 = _1087 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1091 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1093 = _1091 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1095 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1077);
    float _1097 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1079);
    float _1099 = fma(_1085, _1059, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1101 = fma(_1089, _1059, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1103 = fma(_1093, _1059, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1105 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1081);
    float _1107 = fma(_1099, _1039, _1095);
    float _1109 = fma(_1101, _1039, _1097);
    float _1111 = fma(_1103, _1039, _1105);
    float _1113 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1107);
    float _1115 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1109);
    float _1117 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1111);
    bool _1119 = !_1049;
    float _1137;
    if (!_1119)
    {
        float _1121 = in.m_56.x;
        float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1125 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _1129 = _1127 * _1123;
        float _1131 = floor(_1129);
        float _1133 = -_1131;
        float _1135 = _1129 + _1133;
        _1137 = _1135;
        _1139 = true;
    }
    else
    {
        float _1141 = float(_87);
        float _1143 = 1.0 / _1141;
        float _1145 = _121 * _1143;
        _1137 = _1145;
    }
    _1139 = false;
    float _1147 = _1137;
    float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1151 = _1147 + _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1155 = _1153 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1157 = _1147 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1159 = isnan(_1147);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1165 = _1161 || _1163;
    float _1167 = float(_1165);
    float _1169 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1171 = _1169 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1173 = _1147 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1175 = isnan(_1147);
    bool _1177 = _1173 || _1175;
    bool _1179 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1181 = _1177 || _1179;
    float _1183 = float(_1181);
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1187 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1185;
    bool _1189 = _1147 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1191 = isnan(_1147);
    bool _1193 = _1189 || _1191;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1197 = _1193 || _1195;
    float _1199 = float(_1197);
    float _1201 = 1.0 / _1155;
    float _1203 = -_1167;
    float _1205 = _1203 + 1.0;
    bool _1207 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1209 = _1183 * _1205;
    float _1211 = -_1183;
    float _1213 = _1211 + 1.0;
    float _1215 = 1.0 / _1171;
    float _1217 = _1187 * _1201;
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1221 = _1219 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1223 = _1115 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1225 = fma(_1217, _1151, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1227 = -_1199;
    float _1229 = _1227 + 1.0;
    float _1231 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1233 = _1225 * _1209;
    float _1235 = _1221 * _1215;
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1239 = _1147 + _1237;
    float _1241 = _1167 * _1229;
    float _1243 = fma(_1213, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1233);
    float _1245 = _1113 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1247 = fma(_1235, _1239, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1249 = fma(_1247, _1241, _1243);
    float _1251 = _1117 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1253 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1249);
    float _1255 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1257 = _1251 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1259 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _1255;
    out.m_58.y = _1231;
    out.m_58.z = _1257;
    out.m_58.w = _1259;
    bool _1261 = !_1207;
    float _1285;
    float _1287;
    if (!_1261)
    {
        float _1263 = in.m_56.x;
        float _1265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1267 = float(_87);
        float _1269 = 1.0 / _1267;
        float _1271 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1273 = _121 * _1269;
        float _1275 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[11].z, _121);
        float _1277 = _1275 * _1265;
        float _1279 = floor(_1277);
        float _1281 = -_1279;
        float _1283 = _1277 + _1281;
        _1285 = _1283;
        _1287 = _1273;
        _1289 = true;
    }
    else
    {
        float _1291 = float(_87);
        float _1293 = 1.0 / _1291;
        float _1295 = _121 * _1293;
        _1285 = _1295;
        _1287 = _1295;
    }
    _1289 = false;
    float _1297 = _1285;
    float _1299 = _1287;
    float _1301 = in.m_56.x;
    float _1303 = in.m_56.y;
    float _1305 = in.m_56.z;
    float _1307 = in.m_56.w;
    float _1309 = _453 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1311 = _453 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1313 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1315 = _1313 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1317;
    int _1321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1323 = _1321 != 0;
    float _1325 = 1.0 / _1315;
    int _1327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1329 = _1327 != 0;
    float _1331 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _1335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1337 = _1335 != 0;
    float _1339 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1309);
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1343 = _1341 != 0;
    float _1345 = _453 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1347 = 1.0 / _1319;
    float _1349 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1311);
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1353 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1355 = _1353 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1357 = _1307 > 0.5;
    float _1359 = 1.0 / _1333;
    float _1361 = _1301 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1363 = _1301 > 0.5;
    float _1365 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1349);
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1371 = -_183;
    int _1373 = _1363 ? as_type<int>(_1371) : as_type<int>(_183);
    float _1375 = 1.0 / _1355;
    float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1379 = _1377 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1383 = _1381 != 0;
    float _1385 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1345);
    float _1387 = -_1351;
    float _1389 = fma(_1361, 2.0, _1387);
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1393 = _1391 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1395 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1339);
    float _1397 = 1.0 / _1379;
    float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1401 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1399;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1403;
    float _1407 = _1401 * _1325;
    float _1409 = 1.0 / _1369;
    float _1411 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1385);
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1419 = _1303 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1421 = _1395 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1423;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1429 = _1297 + _1427;
    float _1431 = 1.0 / _1393;
    float _1433 = _1405 * _1397;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1435;
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1441 = _1439 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1443 = fma(_1419, -2.0, _1417);
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1447 = _1445 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1449 = 1.0 / _1415;
    float _1451 = _1411 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1455 = _1421 + _1453;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1459 = _1305;
    if (!_1383)
    {
        _1457 = _1303;
    }
    float _1461 = _1457;
    float _1463 = _1429 * _1359;
    float _1465 = _1461;
    if (_1383)
    {
        _1465 = _1301;
    }
    float _1467 = _1465;
    float _1469 = _1365 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1473 = _1451 + _1471;
    float _1475 = 1.0 / _1447;
    float _1477 = _1441 * _1431;
    bool _1479 = !_1323;
    float _1481 = _1479 ? _183 : as_type<float>(_1373);
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1485 = _1483 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    bool _1487 = _1303 > 0.5;
    float _1489 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1491 = _1297 + _1489;
    float _1493 = _1485 * _1409;
    float _1495 = _1425 * _1449;
    float _1497 = _1491 * _1347;
    float _1499 = -_193;
    int _1501 = _1487 ? as_type<int>(_1499) : as_type<int>(_193);
    float _1503 = _643 * _643;
    bool _1505 = _1305 > 0.5;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1509 = _1437 * _1475;
    float _1511 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1507);
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1515 = _1455 * _1455;
    float _1517 = _1507;
    if (!_1383)
    {
        _1517 = _1305;
    }
    float _1519 = _1517;
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1521;
    float _1525 = fma(_1303, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1513);
    float _1527 = _1519;
    if (_1383)
    {
        _1527 = _1303;
    }
    float _1529 = _1527;
    float _1531 = fma(_1473, _1473, _1515);
    if (_1383)
    {
        _1459 = _1303;
    }
    float _1533 = _1459;
    float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1537 = _1469 + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1541 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1539;
    float _1543 = fma(_645, _645, _1503);
    float _1545 = fma(_1523, _1497, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1547 = fma(_1537, _1537, _1531);
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1549;
    float _1553 = fma(_1541, _1497, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1557 = _1555 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1563 = fma(_1551, _1497, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1565 = rsqrt(_1547);
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1569 = _1567 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1571 = fma(_647, _647, _1543);
    float _1573 = _1557 * _1375;
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1577 = _1299 + _1575;
    float _1579 = fma(_1569, _1463, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1581 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1583 = _1581 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1587 = _1299 + _1585;
    float _1589 = rsqrt(_1571);
    float _1591 = fma(_1407, _1577, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1593 = fma(_1561, _1463, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1595 = fma(_1493, _1587, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1599 = _1299 + _1597;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1603 = _1299 + _1601;
    float _1605 = fma(_1583, _1463, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1609 = _1299 + _1607;
    float _1611 = _1455 * _1565;
    float _1613 = _1473 * _1565;
    float _1615 = fma(_1573, _1599, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1617 = fma(_1509, _1603, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1619 = -_1611;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1455);
    float _1623 = -_1613;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1473);
    float _1627 = _1537 * _1565;
    float _1629 = fma(_1433, _1609, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1631 = _1621 * _1621;
    float _1633 = _1589 * _647;
    float _1635 = _1589 * _643;
    float _1637 = -_1627;
    float _1639 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1537);
    float _1641 = fma(_1625, _1625, _1631);
    float _1643 = _1589 * _645;
    float _1645 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1647 = _1633 * _1645;
    float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1651 = _1635 * _1649;
    float _1653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1655 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1657 = _1643 * _1655;
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1661 = -_1647;
    float _1663 = fma(_1643, _1659, _1661);
    float _1665 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1667 = -_1651;
    float _1669 = fma(_1633, _1665, _1667);
    float _1671 = fma(_1639, _1639, _1641);
    float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1675 = -_1657;
    float _1677 = fma(_1635, _1673, _1675);
    float _1679 = _1663 * _1663;
    float _1681 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1683 = _1299 + _1681;
    float _1685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1687 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1689 = _1299 + _1687;
    float _1691 = fma(_1669, _1669, _1679);
    float _1693 = fma(_1477, _1683, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1695 = fma(_1495, _1689, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1697 = fma(_1677, _1677, _1691);
    bool _1699 = !_1329;
    float _1701 = _1699 ? _193 : as_type<float>(_1501);
    float _1703 = sqrt(_1671);
    float _1705 = _1653 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1707 = -_121;
    float _1709 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1389);
    float _1711 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1713 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1443);
    float _1715 = _1701 + (-0.5);
    float _1717 = _947 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1719 = fma(_1533, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1711);
    float _1721 = rsqrt(_1697);
    float _1723 = _1481 + 0.5;
    float _1725 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1727 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1729 = isnan(_1299);
    bool _1731 = _1727 || _1729;
    bool _1733 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1735 = _1731 || _1733;
    float _1737 = float(_1735);
    float _1739 = _1467 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1741 = fma(_1705, _1723, _1709);
    float _1743 = -_183;
    int _1745 = _1505 ? as_type<int>(_1743) : as_type<int>(_183);
    float _1747 = -_1725;
    float _1749 = -_1713;
    float _1751 = fma(_1747, _1715, _1749);
    float _1753 = _1565 * _1703;
    float _1755 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    bool _1757 = !_1337;
    float _1759 = _1757 ? _183 : as_type<float>(_1745);
    float _1761 = _949 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1763 = _1717 * _1753;
    bool _1765 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1767 = isnan(_1299);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1773 = _1769 || _1771;
    float _1775 = float(_1773);
    float _1777 = _1529 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1779 = -_193;
    int _1781 = _1357 ? as_type<int>(_1779) : as_type<int>(_193);
    float _1783 = _1669 * _1721;
    float _1785 = _1763 * _1755;
    bool _1787 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1789 = isnan(_1299);
    bool _1791 = _1787 || _1789;
    bool _1793 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1795 = _1791 || _1793;
    float _1797 = float(_1795);
    float _1799 = -_1775;
    float _1801 = _1799 + 1.0;
    float _1803 = _1663 * _1721;
    float _1805 = _1677 * _1721;
    bool _1807 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1809 = isnan(_1299);
    bool _1811 = _1807 || _1809;
    bool _1813 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1815 = _1811 || _1813;
    float _1817 = float(_1815);
    float _1819 = _1797 * _1801;
    float _1821 = -_1797;
    float _1823 = _1821 + 1.0;
    bool _1825 = !_1343;
    float _1827 = _1825 ? _193 : as_type<float>(_1781);
    float _1829 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1831 = _1761 * _1753;
    bool _1833 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1835 = isnan(_1299);
    bool _1837 = _1833 || _1835;
    bool _1839 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1841 = _1837 || _1839;
    float _1843 = float(_1841);
    float _1845 = -_1817;
    float _1847 = _1845 + 1.0;
    bool _1849 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1851 = isnan(_1299);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1857 = _1853 || _1855;
    float _1859 = float(_1857);
    float _1861 = _1831 * _1829;
    float _1863 = _1817 * _1823;
    float _1865 = -_1843;
    float _1867 = _1865 + 1.0;
    float _1869 = _1843 * _1847;
    bool _1871 = _1297 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1873 = isnan(_1297);
    bool _1875 = _1871 || _1873;
    bool _1877 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1879 = _1875 || _1877;
    float _1881 = float(_1879);
    float _1883 = _1643 * _1803;
    bool _1885 = _1297 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1887 = isnan(_1297);
    bool _1889 = _1885 || _1887;
    bool _1891 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1893 = _1889 || _1891;
    float _1895 = float(_1893);
    float _1897 = _1861 * _1643;
    bool _1899 = _1297 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1901 = isnan(_1297);
    bool _1903 = _1899 || _1901;
    bool _1905 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1907 = _1903 || _1905;
    float _1909 = float(_1907);
    float _1911 = _1859 * _1867;
    float _1913 = -_1859;
    float _1915 = _1913 + 1.0;
    bool _1917 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1919 = isnan(_1299);
    bool _1921 = _1917 || _1919;
    bool _1923 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1925 = _1921 || _1923;
    float _1927 = float(_1925);
    float _1929 = -_1895;
    float _1931 = _1929 + 1.0;
    bool _1933 = _1299 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1935 = isnan(_1299);
    bool _1937 = _1933 || _1935;
    bool _1939 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1941 = _1937 || _1939;
    float _1943 = float(_1941);
    float _1945 = -_1909;
    float _1947 = _1945 + 1.0;
    float _1949 = _1737 * _1915;
    float _1951 = -_1737;
    float _1953 = _1951 + 1.0;
    float _1955 = _1635 * _1805;
    float _1957 = _1895 * _1947;
    float _1959 = -_1883;
    float _1961 = fma(_1635, _1783, _1959);
    float _1963 = _1943 * _1953;
    float _1965 = _1861 * _1633;
    float _1967 = -_1955;
    float _1969 = fma(_1633, _1803, _1967);
    float _1971 = _1753 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1973 = _1971 * 0.5;
    float _1975 = fma(_1785, _1783, _1897);
    float _1977 = fma(_1785, _1805, _1965);
    float _1979 = -_1943;
    float _1981 = _1979 + 1.0;
    float _1983 = fma(_1973, _1969, _1975);
    float _1985 = fma(_1973, _1961, _1977);
    float _1987 = _1927 * _1981;
    float _1989 = _1451 + _1983;
    float _1991 = _1469 + _1985;
    float _1993 = _1591 * _1987;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1997 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1999 = _1989 + _1997;
    float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2003 = _1991 + _2001;
    float _2005 = _1881 * _1931;
    float _2007 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1995);
    float _2009 = _1999 * _1999;
    float _2011 = _2003 * _2003;
    float _2013 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2015 = -_1927;
    float _2017 = _2015 + 1.0;
    float _2019 = _2009 + _2011;
    float _2021 = _1545 * _2005;
    float _2023 = _1553 * _2005;
    float _2025 = _1563 * _2005;
    float _2027 = sqrt(_2019);
    float _2029 = fma(_1777, -2.0, _2013);
    float _2031 = _1633 * _1783;
    float _2033 = _1861 * _1635;
    float _2035 = fma(_2017, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1993);
    float _2037 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2039 = -_2031;
    float _2041 = fma(_1643, _1805, _2039);
    float _2043 = fma(_1785, _1803, _2033);
    float _2045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2047 = fma(_1595, _1963, _2035);
    float _2049 = -_2037;
    float _2051 = fma(_1739, 2.0, _2049);
    float _2053 = -_1881;
    float _2055 = _2053 + 1.0;
    float _2057 = fma(_1973, _2041, _2043);
    float _2059 = fma(_1629, _1949, _2047);
    float _2061 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2021);
    float _2063 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2065 = _2027 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2067 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2023);
    float _2069 = _1421 + _2057;
    float _2071 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2025);
    float _2073 = fma(_1615, _1911, _2059);
    float _2075 = fma(_1593, _1957, _2061);
    float _2077 = fma(_1579, _1957, _2067);
    float _2079 = fma(_1605, _1957, _2071);
    float _2081 = fma(_1617, _1869, _2073);
    float _2083 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2085 = _1759 + 0.5;
    float _2087 = _1827 + (-0.5);
    float _2089 = -_121;
    float _2091 = fma(_2089, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2051);
    float _2093 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2029);
    float _2095 = _1635;
    float _2097 = _2009;
    float _2099 = _2011;
    float _2101 = _1989;
    float _2103 = _1991;
    float _2105 = _1775;
    float _2107 = _1751;
    float _2109 = _1571;
    if (!_2065)
    {
        _2095 = _2069;
    }
    float _2111 = _2095;
    float _2113 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2115 = !_2065;
    float _2117 = _2111;
    if (!_2115)
    {
        float _2119 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2123 = _2027 + _2121;
        float _2125 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2127 = rsqrt(_2019);
        float _2129 = _2123 * _2119;
        float _2131 = _2129 * 0.15915493667125701904296875;
        float _2133 = _2131 * 6.283185482025146484375;
        float _2135 = sin(_2133);
        float _2137 = _2131 * 6.283185482025146484375;
        float _2139 = cos(_2137);
        float _2141 = fma(_2135, _2125, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2143 = _2127 * _2141;
        float _2145 = fma(_1999, _2143, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2147 = _2139 + (-1.0);
        float _2149 = fma(_2003, _2143, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2153 = _2145 + _2151;
        float _2155 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2159 = _2149 + _2157;
        float _2161 = _2153 * _2153;
        float _2163 = fma(_2069, _2139, _2155);
        float _2165 = _2159 * _2159;
        _2117 = _2163;
        _2097 = _2161;
        _2099 = _2165;
        _2101 = _2145;
        _2103 = _2149;
    }
    float _2167 = _2117;
    float _2169 = _2097;
    float _2171 = _2099;
    float _2173 = _2101;
    float _2175 = _2103;
    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2179 = _2167 + _2177;
    float _2181 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1511);
    float _2183 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1525);
    float _2185 = fma(_1693, _1863, _2081);
    float _2187 = fma(_2179, _2179, _2169);
    float _2189 = -_2181;
    float _2191 = _2189 + 1.0;
    float _2193 = -_2183;
    float _2195 = _2193 + 1.0;
    float _2197 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2075);
    float _2199 = _2187 + _2171;
    float _2201 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2077);
    float _2203 = fma(_1909, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2079);
    float _2205 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2007);
    float _2207 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1719);
    float _2209 = -_2113;
    float _2211 = -_2093;
    float _2213 = fma(_2209, _2087, _2211);
    float _2215 = sqrt(_2199);
    float _2217 = -_2191;
    float _2219 = fma(_1481, _2217, _1741);
    float _2221 = fma(_1701, _2195, _1751);
    float _2223 = fma(_2083, _2085, _2091);
    float _2225 = fma(_1695, _1819, _2185);
    float _2227 = -_2205;
    float _2229 = _2227 + 1.0;
    float _2231 = -_2207;
    float _2233 = _2231 + 1.0;
    float _2235 = _2197 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2237 = _2201 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2239 = _2203 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2241 = -_2229;
    float _2243 = fma(_1759, _2241, _2223);
    float _2245 = fma(_1827, _2233, _2213);
    float _2247 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2249 = _2235 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2251 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2253 = _2239 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2255 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2225);
    out.m_60.x = _2219;
    out.m_60.y = _2221;
    out.m_60.z = _2243;
    out.m_60.w = _2245;
    bool _2257 = _2215 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2259 = isnan(_2215);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2265 = _2261 || _2263;
    out.m_62.x = _2249;
    out.m_62.y = _2251;
    out.m_62.z = _2253;
    out.m_62.w = _2247;
    out.m_64.x = _2255;
    float _2267 = _2185;
    float _2269 = _2255;
    if (!_2265)
    {
        _2105 = 1.0;
    }
    float _2271 = _2105;
    bool _2273 = !_2265;
    float _2275 = _2271;
    if (!_2273)
    {
        bool _2277 = _2215 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2279 = isnan(_2215);
        bool _2281 = _2277 || _2279;
        bool _2283 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2285 = _2281 || _2283;
        if (!_2285)
        {
            float _2287 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2289 = _2215 + _2287;
            float _2291 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2293 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2291;
            float _2295 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2297 = _2295 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2299 = 1.0 / _2293;
            float _2301 = _2289 * _2299;
            float _2303 = fma(_2301, _2297, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2275 = _2303;
            _2305 = true;
        }
        else
        {
            bool _2307 = _2215 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2309 = isnan(_2215);
            bool _2311 = _2307 || _2309;
            bool _2313 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2315 = _2311 || _2313;
            if (!_2315)
            {
                float _2317 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2319 = _2215 + _2317;
                float _2321 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2323 = _2321 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2325 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2327 = _2325 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2329 = 1.0 / _2323;
                float _2331 = _2319 * _2329;
                float _2333 = fma(_2331, _2327, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2275 = _2333;
                _2305 = true;
            }
            else
            {
                _2275 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2305 = false;
    float _2335 = _2275;
    float _2337 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2339 = _2167 + _2337;
    float _2341 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2343 = _2173 + _2341;
    float _2345 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2347 = _2175 + _2345;
    float _2349 = fma(_2339, _2335, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2351 = fma(_2343, _2335, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2353 = fma(_2347, _2335, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2355 = -_1421;
    float _2357 = _2355 + _2349;
    float _2359 = -_1451;
    float _2361 = _2359 + _2351;
    float _2363 = -_1469;
    float _2365 = _2363 + _2353;
    float _2367 = _2357 * _2357;
    float _2369 = fma(_2361, _2361, _2367);
    float _2371 = fma(_2365, _2365, _2369);
    float _2373 = sqrt(_2371);
    bool _2375 = _2373 > 0.0;
    float _2377 = _2335;
    float _2379 = _2373;
    float _2381 = _2349;
    float _2383 = _2365;
    if (!_2375)
    {
        _2377 = _2351;
    }
    float _2385 = _2377;
    float _2387 = _2385;
    if (!_2375)
    {
        _2379 = _2353;
    }
    float _2389 = _2379;
    bool _2391 = !_2375;
    float _2393 = _2389;
    float _2395 = _2389;
    if (!_2391)
    {
        bool _2397 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2399 = _2385;
        if (_2397)
        {
            float _2401 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2399 = _2401;
        }
        float _2403 = _2399;
        if (_2397)
        {
            _2267 = _1571;
        }
        float _2405 = _2267;
        float _2407 = _2405;
        float _2409 = _2403;
        if (_2397)
        {
            float _2411 = _2403 * _645;
            _2107 = _2411;
        }
        float _2413 = _2107;
        float _2415 = _2413;
        if (_2397)
        {
            float _2417 = _2403 * _643;
            _2269 = _2417;
        }
        float _2419 = _2269;
        float _2421 = _2419;
        if (_2397)
        {
            float _2423 = _2403 * _647;
            _2109 = _2423;
        }
        float _2425 = _2109;
        float _2427 = _2425;
        if (!_2397)
        {
            float _2429 = _121 + 1.0;
            if (!_161)
            {
                float _2431 = _2429 * _2429;
                float _2433 = _2431 * 0.5;
                _123 = _2433;
            }
            float _2435 = _123;
            float _2437 = _2435;
            if (!_161)
            {
                float _2439 = _2435 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2437 = _2439;
            }
            float _2441 = _2437;
            bool _2443 = !_161;
            float _2445 = _2441;
            if (!_2443)
            {
                float _2447 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2449 = log2(_2447);
                float _2451 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2453 = _2451 + 1.0;
                float _2455 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2457 = _2449 * _2429;
                float _2459 = exp2(_2457);
                float _2461 = _2455 * 0.693147182464599609375;
                float _2463 = 1.0 / _2461;
                float _2465 = 1.0 / _2453;
                float _2467 = _2459 + (-1.0);
                float _2469 = -_2467;
                float _2471 = fma(_2469, _2463, _2429);
                float _2473 = _2471 * _2465;
                float _2475 = _2473 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2445 = _2475;
            }
            float _2477 = _2445;
            float _2479 = _2477 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2481 = _2477 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2483 = _2477 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2485 = _2477;
            if (!_161)
            {
                _2485 = _2429;
            }
            float _2487 = _2485;
            float _2489 = _2479 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2491 = _2479 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2493 = _2479 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2495 = fma(_2481, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2489);
            float _2497 = fma(_2481, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2491);
            float _2499 = fma(_2483, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2495);
            bool _2501 = !_161;
            float _2503 = _2487;
            _2409 = _2497;
            if (!_2501)
            {
                float _2505 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2507 = log2(_2505);
                float _2509 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2511 = _2509 + 1.0;
                float _2513 = 1.0 / _2511;
                float _2515 = _2507 * _2429;
                float _2517 = exp2(_2515);
                float _2519 = -_2517;
                float _2521 = _2519 + 1.0;
                float _2523 = _2521 * _2513;
                _2503 = _2523;
            }
            float _2525 = _2503;
            float _2527 = fma(_2483, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2497);
            float _2529 = fma(_2481, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2493);
            float _2531 = fma(_2525, _149, _2499);
            float _2533 = fma(_2525, _147, _2527);
            float _2535 = fma(_2483, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2529);
            float _2537 = -_383;
            float _2539 = _2537 + _2531;
            float _2541 = -_389;
            float _2543 = _2541 + _2533;
            float _2545 = fma(_2525, _151, _2535);
            float _2547 = _2539 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2549 = _2539 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2551 = _2539 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2553 = -_395;
            float _2555 = _2553 + _2545;
            float _2557 = fma(_2543, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2547);
            float _2559 = fma(_2543, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2549);
            float _2561 = fma(_2543, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2551);
            float _2563 = fma(_2555, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2557);
            float _2565 = fma(_2555, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2559);
            float _2567 = fma(_2555, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2561);
            float _2569 = _2563 * _2563;
            float _2571 = fma(_2565, _2565, _2569);
            float _2573 = fma(_2567, _2567, _2571);
            _2407 = _2573;
            _653 = _2563;
            _655 = _2565;
            _657 = _2567;
            _2415 = _2565;
            _2421 = _2563;
            _2427 = _2567;
            _2393 = _2549;
        }
        float _2575 = _2407;
        float _2577 = _653;
        float _2579 = _655;
        float _2581 = _657;
        float _2583 = _2415;
        float _2585 = _2421;
        float _2587 = _2427;
        float _2589 = _2409;
        float _2591 = _2393;
        float _2593 = sqrt(_2575);
        float _2595 = rsqrt(_2371);
        bool _2597 = _2593 > 0.0;
        float _2599 = _2357 * _2595;
        float _2601 = _2361 * _2595;
        float _2603 = _2365 * _2595;
        float _2605 = _2589;
        float _2607 = _2591;
        if (!_2597)
        {
            _2605 = _2351;
        }
        float _2609 = _2605;
        _2387 = _2609;
        if (!_2597)
        {
            _2607 = _2353;
        }
        float _2611 = _2607;
        bool _2613 = !_2597;
        _2395 = _2611;
        if (!_2613)
        {
            float _2615 = rsqrt(_2575);
            float _2617 = _2615 * _2577;
            float _2619 = _2615 * _2579;
            float _2621 = _2599 * _2617;
            float _2623 = _2615 * _2581;
            float _2625 = fma(_2601, _2619, _2621);
            float _2627 = fma(_2603, _2623, _2625);
            float _2629 = _2627 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2631 = fma(_2583, _2629, _2351);
            float _2633 = fma(_2585, _2629, _2349);
            float _2635 = fma(_2587, _2629, _2353);
            _2387 = _2631;
            _2381 = _2633;
            _2395 = _2635;
        }
    }
    float _2637 = _2387;
    float _2639 = _2381;
    float _2641 = _2395;
    float _2643 = -_1613;
    float _2645 = fma(_2643, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2637);
    float _2647 = -_1611;
    float _2649 = fma(_2647, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2639);
    float _2651 = -_1627;
    float _2653 = fma(_2651, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2641);
    bool _2655 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2657 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2659 = _2655 || _2657;
    bool _2661 = isnan(0.5);
    bool _2663 = _2659 || _2661;
    float _2665 = _2649;
    float _2667 = _2645;
    float _2669 = _2653;
    if (!_2663)
    {
        float _2671 = -_1611;
        float _2673 = fma(_2671, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1421);
        float _2675 = -_1613;
        float _2677 = fma(_2675, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1451);
        float _2679 = -_1627;
        float _2681 = fma(_2679, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1469);
        float _2683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2685 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2687 = _2673 + _2685;
        float _2689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2691 = _2677 + _2689;
        float _2693 = -_1469;
        float _2695 = _2693 + _2641;
        float _2697 = -_1451;
        float _2699 = _2697 + _2637;
        float _2701 = _2687 * _2687;
        float _2703 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2705 = _2681 + _2703;
        float _2707 = -_1421;
        float _2709 = _2707 + _2639;
        float _2711 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2713 = fma(_2691, _2691, _2701);
        float _2715 = fma(_2705, _2705, _2713);
        float _2717 = 1.0 / _1753;
        float _2719 = sqrt(_2715);
        float _2721 = _2711 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2723 = precise::min(_2719, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2725 = _2723 * _2683;
        float _2727 = _2725 * _2717;
        float _2729 = _2721 * _2727;
        float _2731 = _2695 * _2727;
        float _2733 = fma(_2699, _2729, _2677);
        float _2735 = fma(_2709, _2729, _2673);
        float _2737 = fma(_2721, _2731, _2681);
        _2665 = _2735;
        _2667 = _2733;
        _2669 = _2737;
        _2383 = _2717;
    }
    float _2739 = _2665;
    float _2741 = _2667;
    float _2743 = _2669;
    float _2745 = _2383;
    float _2747 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2749 = _2739 + _2747;
    float _2751 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2753 = _2741 + _2751;
    float _2755 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2757 = _2743 + _2755;
    float _2759 = _2749 * _2749;
    float _2761 = fma(_2753, _2753, _2759);
    float _2763 = fma(_2757, _2757, _2761);
    float _2765 = rsqrt(_2763);
    float _2767 = sqrt(_2763);
    float _2769 = _2765 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2771 = _2753 * _2769;
    float _2773 = _2757 * _2769;
    float _2775 = _2771 * _2771;
    float _2777 = _2773 * _2773;
    float _2779 = _2775 + _2777;
    float _2781 = sqrt(_2779);
    bool _2783 = _2781 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2785 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2787 = _2781 + _2785;
    float _2789 = _2765;
    float _2791 = _2779;
    float _2793 = _2787;
    float _2795 = _2745;
    float _2797 = _2749;
    if (_2783)
    {
        float _2799 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2789 = _2799;
    }
    float _2801 = _2789;
    if (_2783)
    {
        float _2803 = rsqrt(_2779);
        _2791 = _2803;
    }
    float _2805 = _2791;
    float _2807 = _2805;
    if (_2783)
    {
        float _2809 = _2787 * _2801;
        _2793 = _2809;
    }
    float _2811 = _2793;
    if (_2783)
    {
        float _2813 = _2811 * 0.15915493667125701904296875;
        _2795 = _2813;
    }
    float _2815 = _2795;
    float _2817 = _2757;
    float _2819 = _2815;
    if (_2783)
    {
        float _2821 = _2815 * 6.283185482025146484375;
        float _2823 = sin(_2821);
        _2817 = _2823;
    }
    float _2825 = _2817;
    float _2827 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2829 = precise::max(0.0, _2827);
    float _2831 = _2801;
    float _2833 = _2829;
    if (_2783)
    {
        float _2835 = _2815 * 6.283185482025146484375;
        float _2837 = cos(_2835);
        _2831 = _2837;
    }
    float _2839 = _2831;
    float _2841 = -_2769;
    float _2843 = -_2829;
    float _2845 = fma(_2749, _2841, _2843);
    if (_2783)
    {
        float _2847 = _2845 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2797 = _2847;
    }
    float _2849 = _2797;
    float _2851 = _2849;
    float _2853 = _2825;
    if (_2783)
    {
        float _2855 = fma(_2825, _2849, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2851 = _2855;
    }
    float _2857 = _2851;
    float _2859 = _2857;
    if (!_2783)
    {
        _2853 = _2771;
    }
    float _2861 = _2853;
    float _2863 = _2861;
    float _2865 = _2839;
    if (_2783)
    {
        float _2867 = _2839 + (-1.0);
        _2833 = _2867;
    }
    float _2869 = _2833;
    float _2871 = _2869;
    if (_2783)
    {
        float _2873 = _2805 * _2857;
        _463 = _2873;
    }
    float _2875 = _463;
    if (!_2783)
    {
        _2859 = _2845;
    }
    float _2877 = _2859;
    float _2879 = _2877;
    if (_2783)
    {
        float _2881 = _2869 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2819 = _2881;
    }
    float _2883 = _2819;
    if (_2783)
    {
        float _2885 = _2771 * _2875;
        _2863 = _2885;
    }
    float _2887 = _2863;
    if (!_2783)
    {
        _2871 = _2773;
    }
    float _2889 = _2871;
    float _2891 = _2889;
    if (_2783)
    {
        float _2893 = _2773 * _2875;
        _2891 = _2893;
    }
    float _2895 = _2891;
    if (!_2783)
    {
        _2807 = _2775;
    }
    float _2897 = _2807;
    float _2899 = _2897;
    if (_2783)
    {
        float _2901 = fma(_2845, _2839, _2883);
        _2879 = _2901;
    }
    float _2903 = _2879;
    if (_2783)
    {
        float _2905 = _2887 * _2887;
        _2899 = _2905;
    }
    float _2907 = _2899;
    if (!_2783)
    {
        _2865 = _2777;
    }
    float _2909 = _2865;
    float _2911 = _2909;
    if (_2783)
    {
        float _2913 = _2895 * _2895;
        _2911 = _2913;
    }
    float _2915 = _2911;
    float _2917 = fma(_2903, _2903, _2907);
    float _2919 = _2917 + _2915;
    float _2921 = _2739 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2923 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2925 = fma(_2767, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2923);
    float _2927 = precise::clamp(_2925, 0.0, 1.0);
    float _2929 = _2739 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2931 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2933 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2921);
    float _2935 = rsqrt(_2919);
    float _2937 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2929);
    float _2939 = -_2927;
    float _2941 = _2939 + 1.0;
    float _2943 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2933);
    float _2945 = _2739 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2947 = _2739 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2949 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2937);
    float _2951 = _2943 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2953 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2945);
    float _2955 = fma(_2741, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2947);
    float _2957 = _2949 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2959 = _2951 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2961 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2953);
    float _2963 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2955);
    float _2965 = abs(_2941);
    float _2967 = log2(_2965);
    float _2969 = -_2959;
    float _2971 = fma(_2969, _2931, 1.0);
    float _2973 = _2935 * _2887;
    float _2975 = _2961 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2977 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2979 = _2935 * _2903;
    float _2981 = _2935 * _2895;
    float _2983 = _2963 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2985 = fma(_2975, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2977);
    float _2987 = _2973 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2989 = log2(_2971);
    float _2991 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2993 = fma(_2951, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2985);
    float _2995 = -_2987;
    float _2997 = fma(_2979, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2995);
    float _2999 = _2979 + 1.0;
    float _3001 = fma(_2983, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2993);
    float _3003 = -_2981;
    float _3005 = fma(_3003, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2997);
    float _3007 = _2967 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3009 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3011 = 1.0 / _3001;
    float _3013 = fma(_3005, -0.5, 0.5);
    float _3015 = fma(_3005, 0.5, 0.5);
    float _3017 = fma(_2975, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3009);
    float _3019 = fma(_2975, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2991);
    float _3021 = fma(_2951, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3017);
    float _3023 = exp2(_3007);
    float _3025 = fma(_2951, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3019);
    float _3027 = fma(_2983, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3021);
    float _3029 = fma(_2983, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3025);
    float _3031 = _2989 * 0.693147182464599609375;
    float _3033 = sqrt(_3013);
    float _3035 = fma(_3015, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3037 = _3027 * _3011;
    float _3039 = _3029 * _3011;
    float _3041 = fma(_3015, _3035, -0.212114393711090087890625);
    float _3043 = fma(_3037, 0.5, 0.5);
    float _3045 = fma(_3039, -0.5, 0.5);
    float _3047 = -_2979;
    float _3049 = fma(_3023, _2999, _3047);
    float _3051 = fma(_3015, _3041, 1.570728778839111328125);
    float _3053 = _3031 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3055 = fma(_3049, 0.5, 0.5);
    float _3057 = _3033 * 0.636619746685028076171875;
    float3 _8048 = float3(_3043, _3045, _3053);
    float _3059 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8048, float3(0.0), isnan(_8048)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8048, float3(0.0), isnan(_8048)), level(0.0)).x;
    float _3061 = -_3051;
    float _3063 = fma(_3057, _3061, 1.0);
    float3 _8064 = float3(_3043, _3045, _3053);
    float4 _3066 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8064, float3(0.0), isnan(_8064)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8064, float3(0.0), isnan(_8064)), level(0.0)).xyzw;
    float _3068 = _3066.x;
    float _3070 = _3066.y;
    float _3072 = _3066.z;
    float _3074 = _3066.w;
    float2 _8081 = float2(_3063, _3055);
    float3 _3078 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8081, float2(0.0), isnan(_8081)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8081, float2(0.0), isnan(_8081)), level(0.0)).xyz;
    float _3080 = _3078.x;
    float _3082 = _3078.y;
    float _3084 = _3078.z;
    float _3086 = _2967 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3088 = _2957 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3090 = fma(_2975, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3088);
    float _3092 = exp2(_3086);
    float _3094 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3096 = fma(_2951, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3090);
    float _3098 = fma(_2983, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3096);
    out.m_47.x = _3094;
    float _3100 = _3098 + _3001;
    out.gl_Position.x = _3027;
    out.gl_Position.y = _3029;
    out.gl_Position.z = _3098;
    out.gl_Position.w = _3001;
    float _3102 = _3100 * 0.5;
    float _3104 = -_3092;
    float _3106 = _3104 + 1.0;
    float _3108 = _3106 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _3102;
    out.m_66.w = _3001;
    float _3110 = _3108 * _3059;
    float _3112 = -_3108;
    float _3114 = _3112 + 1.0;
    float _3116 = _3074 * _3110;
    float _3118 = _3074 * _3114;
    float _3120 = _3084 * _3110;
    float _3122 = fma(_3080, _3116, _3068);
    float _3124 = fma(_3082, _3116, _3070);
    float _3126 = fma(_3074, _3120, _3072);
    out.m_68.x = _3122;
    out.m_68.y = _3124;
    out.m_68.z = _3126;
    out.m_68.w = _3118;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

