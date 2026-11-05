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
    constant _16* vp_c3 [[id(0)]];
    texture2d<float> vp_t_tcb_8 [[id(1)]];
    sampler vp_t_tcb_8Smplr [[id(2)]];
    sampler vp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_38 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
    float4 m_34 [[user(locn2)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_27 [[attribute(0)]];
    float4 m_29 [[attribute(1)]];
    float4 m_31 [[attribute(2)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    bool _191 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _52 = in.m_27.x;
    float _54 = in.m_29.x;
    float _56 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _58 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _60 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _62 = in.m_31.x;
    float _64 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[8].x, _56);
    float _66 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[7].x, _58);
    float _68 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[9].x, _60);
    float _70 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[8].z, _64);
    float _72 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[7].z, _66);
    float _74 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[9].z, _68);
    float _76 = _70 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _78 = _72 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _80 = _74 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _82 = _76 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _84 = abs(_52);
    float _86 = log2(_84);
    float _88 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[13].x, _82);
    float _90 = _76 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _92 = _76 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _94 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[13].z, _88);
    float _96 = _94 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _98 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[10].x, _90);
    float _100 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[11].x, _92);
    float _102 = _54 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _104 = 1.0 / _96;
    float _106 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[10].z, _98);
    float _108 = _86 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _110 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[11].z, _100);
    float _112 = _54 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _114 = _106 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _116 = -_102;
    float _118 = fma(_62, (*spvDescriptorSet0.vp_c3)._m0[15].z, _116);
    float _120 = _110 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _122 = exp2(_108);
    float _124 = fma(_62, (*spvDescriptorSet0.vp_c3)._m0[15].y, _112);
    float _126 = _114 * _104;
    float _128 = _120 * _104;
    float _130 = fma(_126, 0.5, 0.5);
    float _132 = fma(_128, -0.5, 0.5);
    float _134 = _122 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _136 = _118 * _134;
    float _138 = _124 * _134;
    float _140 = _130 + _136;
    float _142 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float2 _1372 = float2(_140, _142);
    float _144 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1372, float2(0.0), isnan(_1372)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1372, float2(0.0), isnan(_1372)), level(0.0)).x;
    out.m_34.x = 0.0;
    float _146 = (*spvDescriptorSet0.vp_c3)._m0[14].x + (*spvDescriptorSet0.vp_c3)._m0[14].y;
    out.m_36.x = 0.0;
    float _148 = 1.0 / _146;
    out.gl_Position.z = 1.0;
    out.m_38.x = 0.0;
    float _150 = -_148;
    float _152 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[14].x, 1.0);
    float _154 = -_144;
    float _156 = fma(_154, _152, 1.0);
    float _158 = 1.0 / _156;
    float _160 = _158 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _162 = -_80;
    bool _166 = _160 > _162;
    int _169 = as_type<int>(_136);
    int _171 = as_type<int>(_144);
    float _173 = _158;
    float _175 = _138;
    float _177 = _146;
    int _179 = as_type<int>(_80);
    float _181;
    float _183;
    float _185;
    float _187;
    float _189;
    if (!_166)
    {
        _181 = 0.0;
        _183 = 0.0;
        _185 = 0.0;
        _187 = 0.0;
        _189 = 0.0;
        _191 = true;
    }
    else
    {
        bool _193 = _136 > 0.0;
        float _195 = _136 * (*spvDescriptorSet0.vp_c3)._m0[16].w;
        bool _197 = _138 > 0.0;
        float _199 = _138 * (*spvDescriptorSet0.vp_c3)._m0[16].w;
        out.m_34.x = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _181 = _199;
        if (_193)
        {
            _169 = 0;
        }
        int _201 = _169;
        int _203 = _201;
        if (!_193)
        {
            float _205 = -_195;
            float _207 = (-0.0) + _205;
            _203 = as_type<int>(_207);
        }
        int _209 = _203;
        if (_197)
        {
            _171 = 0;
        }
        int _211 = _171;
        int _213 = _211;
        if (!_197)
        {
            float _215 = -_199;
            float _217 = (-0.0) + _215;
            _213 = as_type<int>(_217);
        }
        int _219 = _213;
        _189 = as_type<float>(_219);
        if (_193)
        {
            out.m_36.x = _195;
        }
        if (_193)
        {
            _173 = _195;
        }
        float _221 = _173;
        float _223 = _221;
        if (_197)
        {
            _175 = as_type<float>(_209);
        }
        float _225 = _175;
        float _227 = _225;
        if (!_193)
        {
            out.m_38.x = as_type<float>(_209);
        }
        if (_197)
        {
            _177 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        }
        float _229 = _177;
        float _231 = _229;
        if (!_193)
        {
            _223 = 0.0;
        }
        float _233 = _223;
        _187 = _233;
        if (!_197)
        {
            out.m_36.y = as_type<float>(_219);
        }
        if (!_197)
        {
            _227 = as_type<float>(_209);
        }
        float _235 = _227;
        _185 = _235;
        if (!_197)
        {
            _231 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        }
        float _237 = _231;
        _183 = _237;
        if (_197)
        {
            out.m_38.y = _199;
        }
        if (!_197)
        {
            _181 = 0.0;
        }
    }
    _191 = false;
    float _239 = _181;
    float _241 = _183;
    float _243 = _185;
    float _245 = _187;
    float _247 = _189;
    float _249 = _52 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    float _251 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 2.0, _52);
    float _253 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 3.0, _52);
    float _255 = abs(_249);
    float _257 = log2(_255);
    float _259 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 4.0, _52);
    float _261 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 5.0, _52);
    float _263 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 6.0, _52);
    float _265 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 7.0, _52);
    float _267 = _124 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _269 = abs(_251);
    float _271 = log2(_269);
    float _273 = -_267;
    float _275 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[15].z, _273);
    float _277 = abs(_253);
    float _279 = log2(_277);
    float _281 = _257 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _283 = _124 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _285 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[15].y, _283);
    float _287 = abs(_259);
    float _289 = log2(_287);
    float _291 = _271 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _293 = _285 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _295 = -_293;
    float _297 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[15].z, _295);
    float _299 = exp2(_281);
    float _301 = _279 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _303 = _285 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _305 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[15].y, _303);
    float _307 = exp2(_291);
    float _309 = abs(_261);
    float _311 = log2(_309);
    float _313 = _299 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _315 = _275 * _313;
    float _317 = _285 * _313;
    float _319 = exp2(_301);
    float _321 = _307 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _323 = fma(_317, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float _325 = _297 * _321;
    float _327 = _305 * _321;
    float _329 = abs(_263);
    float _331 = log2(_329);
    float _333 = _305 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _335 = _311 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _337 = fma(_327, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float _339 = _130 + _325;
    float _341 = -_333;
    float _343 = fma(_297, (*spvDescriptorSet0.vp_c3)._m0[15].z, _341);
    float _345 = abs(_265);
    float _347 = log2(_345);
    float _349 = _289 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _351 = _305 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _353 = _319 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _355 = fma(_297, (*spvDescriptorSet0.vp_c3)._m0[15].y, _351);
    float _357 = exp2(_349);
    float _359 = _331 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _361 = _355 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _363 = _355 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _365 = fma(_343, (*spvDescriptorSet0.vp_c3)._m0[15].y, _361);
    float _367 = -_363;
    float _369 = fma(_343, (*spvDescriptorSet0.vp_c3)._m0[15].z, _367);
    float _371 = exp2(_335);
    float _373 = _343 * _353;
    float _375 = _355 * _353;
    float _377 = _365 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _379 = _347 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _381 = _130 + _373;
    float _383 = fma(_375, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float _385 = exp2(_359);
    float _387 = _365 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _389 = _371 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _391 = fma(_369, (*spvDescriptorSet0.vp_c3)._m0[15].y, _387);
    float _393 = _357 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _395 = -_377;
    float _397 = fma(_369, (*spvDescriptorSet0.vp_c3)._m0[15].z, _395);
    float _399 = exp2(_379);
    float _401 = _391 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _403 = _391 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _405 = _369 * _393;
    float _407 = _365 * _393;
    float _409 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[15].y, _401);
    float _411 = _391 * _389;
    float _413 = _397 * _389;
    float _415 = -_403;
    float _417 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[15].z, _415);
    float _419 = _409 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _421 = _385 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _423 = _409 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _425 = _130 + _405;
    float _427 = fma(_417, (*spvDescriptorSet0.vp_c3)._m0[15].y, _419);
    float _429 = _130 + _315;
    float _431 = -_423;
    float _433 = fma(_417, (*spvDescriptorSet0.vp_c3)._m0[15].z, _431);
    float _435 = _399 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _437 = _417 * _421;
    float2 _1889 = float2(_429, _323);
    float _439 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1889, float2(0.0), isnan(_1889)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1889, float2(0.0), isnan(_1889)), level(0.0)).x;
    float2 _1897 = float2(_339, _337);
    float _441 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1897, float2(0.0), isnan(_1897)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1897, float2(0.0), isnan(_1897)), level(0.0)).x;
    float2 _1905 = float2(_381, _383);
    float _443 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1905, float2(0.0), isnan(_1905)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1905, float2(0.0), isnan(_1905)), level(0.0)).x;
    float _445 = _409 * _421;
    float _447 = _433 * _435;
    float _449 = _427 * _435;
    float _451 = _130 + _413;
    float _453 = fma(_407, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float _455 = _130 + _437;
    float _457 = fma(_411, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float _461 = _130 + _447;
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float2 _1951 = float2(_425, _453);
    float _465 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1951, float2(0.0), isnan(_1951)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1951, float2(0.0), isnan(_1951)), level(0.0)).x;
    float2 _1959 = float2(_451, _457);
    float _467 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1959, float2(0.0), isnan(_1959)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1959, float2(0.0), isnan(_1959)), level(0.0)).x;
    float2 _1967 = float2(_455, _459);
    float _469 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1967, float2(0.0), isnan(_1967)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1967, float2(0.0), isnan(_1967)), level(0.0)).x;
    float2 _1975 = float2(_461, _463);
    float _471 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1975, float2(0.0), isnan(_1975)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1975, float2(0.0), isnan(_1975)), level(0.0)).x;
    float _473 = -_439;
    float _475 = fma(_152, _473, 1.0);
    float _477 = 1.0 / _475;
    float _479 = _477 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _481 = -_80;
    bool _483 = _479 > _481;
    int _485 = as_type<int>(_439);
    int _487 = as_type<int>(_243);
    int _489 = as_type<int>(_477);
    int _491 = as_type<int>(_247);
    float _493 = _241;
    float _495 = _245;
    float _497 = _241;
    int _499 = as_type<int>(_243);
    float _501 = _247;
    float _503 = _245;
    int _505 = as_type<int>(_477);
    int _507 = as_type<int>(_461);
    int _509 = as_type<int>(_325);
    int _511 = as_type<int>(_373);
    int _513 = as_type<int>(_447);
    if (!_483)
    {
        _485 = as_type<int>(_239);
    }
    int _515 = _485;
    bool _517 = !_483;
    int _519 = _515;
    float _521 = as_type<float>(_515);
    if (!_517)
    {
        bool _523 = _315 > 0.0;
        float _525 = _241 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _527 = _317 > 0.0;
        out.m_34.x = _525;
        if (!_523)
        {
            float _529 = -_315;
            float _531 = fma(_529, (*spvDescriptorSet0.vp_c3)._m0[16].w, _243);
            _487 = as_type<int>(_531);
        }
        int _533 = _487;
        _499 = _533;
        if (_523)
        {
            float _535 = fma(_315, (*spvDescriptorSet0.vp_c3)._m0[16].w, _245);
            _489 = as_type<int>(_535);
        }
        int _537 = _489;
        float _539 = as_type<float>(_537);
        if (!_527)
        {
            float _541 = -_317;
            float _543 = fma(_541, (*spvDescriptorSet0.vp_c3)._m0[16].w, _247);
            _491 = as_type<int>(_543);
        }
        int _545 = _491;
        _501 = as_type<float>(_545);
        if (_527)
        {
            float _547 = fma(_317, (*spvDescriptorSet0.vp_c3)._m0[16].w, _239);
            _519 = as_type<int>(_547);
        }
        int _549 = _519;
        float _551 = as_type<float>(_549);
        if (_527)
        {
            _493 = _525;
        }
        float _553 = _493;
        float _555 = _553;
        if (!_523)
        {
            out.m_38.x = as_type<float>(_533);
        }
        if (!_527)
        {
            _555 = _525;
        }
        float _557 = _555;
        _497 = _557;
        if (!_527)
        {
            out.m_36.y = as_type<float>(_545);
        }
        if (_523)
        {
            out.m_36.x = as_type<float>(_537);
        }
        if (_527)
        {
            out.m_38.y = as_type<float>(_549);
        }
        if (!_523)
        {
            _539 = _245;
        }
        float _559 = _539;
        _505 = as_type<int>(_559);
        if (_527)
        {
            _495 = _559;
        }
        float _561 = _495;
        _503 = _561;
        if (!_527)
        {
            _551 = _239;
        }
        float _563 = _551;
        _521 = _563;
        if (!_527)
        {
            _503 = _559;
        }
    }
    float _565 = _521;
    float _567 = _497;
    int _569 = _499;
    float _571 = _501;
    float _573 = _503;
    int _575 = _505;
    float _577 = -_441;
    float _579 = fma(_152, _577, 1.0);
    float _581 = 1.0 / _579;
    float _583 = _581 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _585 = -_80;
    bool _587 = _583 > _585;
    int _589 = _575;
    int _591 = as_type<int>(_571);
    int _593 = as_type<int>(_583);
    float _595 = _567;
    int _597 = _569;
    float _599 = _573;
    float _601 = _567;
    int _603 = _569;
    float _605 = _571;
    float _607 = _573;
    int _609 = _575;
    if (!_587)
    {
        _507 = as_type<int>(_565);
    }
    int _611 = _507;
    bool _613 = !_587;
    int _615 = _611;
    float _617 = as_type<float>(_611);
    if (!_613)
    {
        bool _619 = _325 > 0.0;
        float _621 = _567 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _623 = _327 > 0.0;
        out.m_34.x = _621;
        if (_619)
        {
            _589 = _569;
        }
        int _625 = _589;
        int _627 = _625;
        if (!_619)
        {
            float _629 = -_325;
            float _631 = fma(_629, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_569));
            _627 = as_type<int>(_631);
        }
        int _633 = _627;
        _609 = _633;
        if (!_623)
        {
            float _635 = -_327;
            float _637 = fma(_635, (*spvDescriptorSet0.vp_c3)._m0[16].w, _571);
            _591 = as_type<int>(_637);
        }
        int _639 = _591;
        _605 = as_type<float>(_639);
        if (_619)
        {
            float _641 = fma(_325, (*spvDescriptorSet0.vp_c3)._m0[16].w, _573);
            _593 = as_type<int>(_641);
        }
        int _643 = _593;
        float _645 = as_type<float>(_643);
        if (_623)
        {
            float _647 = fma(_327, (*spvDescriptorSet0.vp_c3)._m0[16].w, _565);
            _615 = as_type<int>(_647);
        }
        int _649 = _615;
        float _651 = as_type<float>(_649);
        if (_623)
        {
            _595 = _621;
        }
        float _653 = _595;
        float _655 = _653;
        if (!_619)
        {
            out.m_38.x = as_type<float>(_633);
        }
        if (_623)
        {
            _597 = _633;
        }
        int _657 = _597;
        int _659 = _657;
        if (!_623)
        {
            _655 = _621;
        }
        float _661 = _655;
        _601 = _661;
        if (!_623)
        {
            out.m_36.y = as_type<float>(_639);
        }
        if (!_623)
        {
            _659 = _633;
        }
        int _663 = _659;
        _603 = _663;
        if (_619)
        {
            out.m_36.x = as_type<float>(_643);
        }
        if (_623)
        {
            out.m_38.y = as_type<float>(_649);
        }
        if (!_619)
        {
            _645 = _573;
        }
        float _665 = _645;
        if (_623)
        {
            _599 = _665;
        }
        float _667 = _599;
        _607 = _667;
        if (!_623)
        {
            _651 = _565;
        }
        float _669 = _651;
        _617 = _669;
        if (!_623)
        {
            _607 = _665;
        }
    }
    float _671 = _617;
    float _673 = _601;
    int _675 = _603;
    float _677 = _605;
    float _679 = _607;
    int _681 = _609;
    float _683 = -_443;
    float _685 = fma(_152, _683, 1.0);
    float _687 = 1.0 / _685;
    float _689 = _687 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _691 = -_80;
    bool _693 = _689 > _691;
    int _695 = _681;
    int _697 = as_type<int>(_677);
    int _699 = as_type<int>(_689);
    float _701 = _673;
    int _703 = _675;
    float _705 = _679;
    float _707 = _673;
    int _709 = _675;
    float _711 = _677;
    float _713 = _679;
    int _715 = _681;
    if (!_693)
    {
        _509 = as_type<int>(_671);
    }
    int _717 = _509;
    bool _719 = !_693;
    int _721 = _717;
    float _723 = as_type<float>(_717);
    if (!_719)
    {
        bool _725 = _373 > 0.0;
        float _727 = _673 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _729 = _375 > 0.0;
        out.m_34.x = _727;
        if (_725)
        {
            _695 = _675;
        }
        int _731 = _695;
        int _733 = _731;
        if (!_725)
        {
            float _735 = -_373;
            float _737 = fma(_735, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_675));
            _733 = as_type<int>(_737);
        }
        int _739 = _733;
        _715 = _739;
        if (!_729)
        {
            float _741 = -_375;
            float _743 = fma(_741, (*spvDescriptorSet0.vp_c3)._m0[16].w, _677);
            _697 = as_type<int>(_743);
        }
        int _745 = _697;
        _711 = as_type<float>(_745);
        if (_725)
        {
            float _747 = fma(_373, (*spvDescriptorSet0.vp_c3)._m0[16].w, _679);
            _699 = as_type<int>(_747);
        }
        int _749 = _699;
        float _751 = as_type<float>(_749);
        if (_729)
        {
            float _753 = fma(_375, (*spvDescriptorSet0.vp_c3)._m0[16].w, _671);
            _721 = as_type<int>(_753);
        }
        int _755 = _721;
        float _757 = as_type<float>(_755);
        if (_729)
        {
            _701 = _727;
        }
        float _759 = _701;
        float _761 = _759;
        if (!_725)
        {
            out.m_38.x = as_type<float>(_739);
        }
        if (_729)
        {
            _703 = _739;
        }
        int _763 = _703;
        int _765 = _763;
        if (!_729)
        {
            _761 = _727;
        }
        float _767 = _761;
        _707 = _767;
        if (!_729)
        {
            out.m_36.y = as_type<float>(_745);
        }
        if (!_729)
        {
            _765 = _739;
        }
        int _769 = _765;
        _709 = _769;
        if (_725)
        {
            out.m_36.x = as_type<float>(_749);
        }
        if (_729)
        {
            out.m_38.y = as_type<float>(_755);
        }
        if (!_725)
        {
            _751 = _679;
        }
        float _771 = _751;
        if (_729)
        {
            _705 = _771;
        }
        float _773 = _705;
        _713 = _773;
        if (!_729)
        {
            _757 = _671;
        }
        float _775 = _757;
        _723 = _775;
        if (!_729)
        {
            _713 = _771;
        }
    }
    float _777 = _723;
    float _779 = _707;
    int _781 = _709;
    float _783 = _711;
    float _785 = _713;
    int _787 = _715;
    float _789 = -_465;
    float _791 = fma(_152, _789, 1.0);
    float _793 = 1.0 / _791;
    float _795 = _793 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _797 = -_80;
    bool _799 = _795 > _797;
    int _801 = _787;
    int _803 = as_type<int>(_783);
    int _805 = as_type<int>(_795);
    float _807 = _779;
    int _809 = _781;
    float _811 = _785;
    float _813 = _779;
    int _815 = _781;
    float _817 = _783;
    float _819 = _785;
    int _821 = as_type<int>(_777);
    if (!_799)
    {
        _511 = as_type<int>(_777);
    }
    int _823 = _511;
    bool _825 = !_799;
    int _827 = _823;
    float _829 = as_type<float>(_823);
    if (!_825)
    {
        bool _831 = _405 > 0.0;
        float _833 = _779 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _835 = _407 > 0.0;
        out.m_34.x = _833;
        if (_831)
        {
            _801 = _781;
        }
        int _837 = _801;
        int _839 = _837;
        if (!_831)
        {
            float _841 = -_405;
            float _843 = fma(_841, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_781));
            _839 = as_type<int>(_843);
        }
        int _845 = _839;
        if (!_835)
        {
            float _847 = -_407;
            float _849 = fma(_847, (*spvDescriptorSet0.vp_c3)._m0[16].w, _783);
            _803 = as_type<int>(_849);
        }
        int _851 = _803;
        _817 = as_type<float>(_851);
        if (_831)
        {
            float _853 = fma(_405, (*spvDescriptorSet0.vp_c3)._m0[16].w, _785);
            _805 = as_type<int>(_853);
        }
        int _855 = _805;
        float _857 = as_type<float>(_855);
        if (_835)
        {
            float _859 = fma(_407, (*spvDescriptorSet0.vp_c3)._m0[16].w, _777);
            _827 = as_type<int>(_859);
        }
        int _861 = _827;
        float _863 = as_type<float>(_861);
        if (_835)
        {
            _807 = _833;
        }
        float _865 = _807;
        float _867 = _865;
        if (!_831)
        {
            out.m_38.x = as_type<float>(_845);
        }
        if (_835)
        {
            _809 = _845;
        }
        int _869 = _809;
        int _871 = _869;
        if (!_835)
        {
            _867 = _833;
        }
        float _873 = _867;
        _813 = _873;
        if (!_835)
        {
            out.m_36.y = as_type<float>(_851);
        }
        if (!_835)
        {
            _871 = _845;
        }
        int _875 = _871;
        _815 = _875;
        if (_831)
        {
            out.m_36.x = as_type<float>(_855);
        }
        if (_835)
        {
            out.m_38.y = as_type<float>(_861);
        }
        if (!_831)
        {
            _857 = _785;
        }
        float _877 = _857;
        if (_835)
        {
            _811 = _877;
        }
        float _879 = _811;
        _819 = _879;
        if (!_835)
        {
            _863 = _777;
        }
        float _881 = _863;
        _829 = _881;
        if (!_835)
        {
            _819 = _877;
        }
    }
    float _883 = _829;
    float _885 = _813;
    int _887 = _815;
    float _889 = _817;
    float _891 = _819;
    float _893 = -_467;
    float _895 = fma(_152, _893, 1.0);
    float _897 = -_469;
    float _899 = fma(_152, _897, 1.0);
    float _901 = -_471;
    float _903 = fma(_152, _901, 1.0);
    float _905 = 1.0 / _895;
    float _907 = 1.0 / _899;
    float _909 = 1.0 / _903;
    float _911 = _905 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _913 = -_80;
    bool _915 = _911 > _913;
    float _917 = _907 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _919 = -_80;
    bool _921 = _917 > _919;
    float _923 = _909 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _925 = -_80;
    bool _927 = _923 > _925;
    int _929 = as_type<int>(_923);
    int _931 = as_type<int>(_889);
    int _933 = as_type<int>(_917);
    float _935 = _885;
    int _937 = _887;
    float _939 = _891;
    int _941 = as_type<int>(_889);
    float _943 = _885;
    int _945 = _887;
    float _947 = _891;
    int _949 = as_type<int>(_923);
    int _951 = as_type<int>(_917);
    int _953 = as_type<int>(_909);
    if (!_915)
    {
        _179 = as_type<int>(_883);
    }
    int _955 = _179;
    bool _957 = !_915;
    int _959 = _955;
    float _961 = as_type<float>(_955);
    if (!_957)
    {
        bool _963 = _413 > 0.0;
        float _965 = _885 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _967 = _411 > 0.0;
        out.m_34.x = _965;
        if (_963)
        {
            _929 = _887;
        }
        int _969 = _929;
        int _971 = _969;
        if (!_963)
        {
            float _973 = -_413;
            float _975 = fma(_973, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_887));
            _971 = as_type<int>(_975);
        }
        int _977 = _971;
        _949 = _977;
        if (!_967)
        {
            float _979 = -_411;
            float _981 = fma(_979, (*spvDescriptorSet0.vp_c3)._m0[16].w, _889);
            _931 = as_type<int>(_981);
        }
        int _983 = _931;
        _941 = _983;
        if (_963)
        {
            float _985 = fma(_413, (*spvDescriptorSet0.vp_c3)._m0[16].w, _891);
            _933 = as_type<int>(_985);
        }
        int _987 = _933;
        float _989 = as_type<float>(_987);
        if (_967)
        {
            float _991 = fma(_411, (*spvDescriptorSet0.vp_c3)._m0[16].w, _883);
            _959 = as_type<int>(_991);
        }
        int _993 = _959;
        float _995 = as_type<float>(_993);
        if (_967)
        {
            _935 = _965;
        }
        float _997 = _935;
        float _999 = _997;
        if (!_963)
        {
            out.m_38.x = as_type<float>(_977);
        }
        if (_967)
        {
            _937 = _977;
        }
        int _1001 = _937;
        int _1003 = _1001;
        if (!_967)
        {
            _999 = _965;
        }
        float _1005 = _999;
        _943 = _1005;
        if (!_967)
        {
            out.m_36.y = as_type<float>(_983);
        }
        if (!_967)
        {
            _1003 = _977;
        }
        int _1007 = _1003;
        _945 = _1007;
        if (_963)
        {
            out.m_36.x = as_type<float>(_987);
        }
        if (_967)
        {
            out.m_38.y = as_type<float>(_993);
        }
        if (!_963)
        {
            _989 = _891;
        }
        float _1009 = _989;
        _951 = as_type<int>(_1009);
        if (_967)
        {
            _939 = _1009;
        }
        float _1011 = _939;
        _947 = _1011;
        if (!_967)
        {
            _995 = _883;
        }
        float _1013 = _995;
        _961 = _1013;
        if (!_967)
        {
            _947 = _1009;
        }
    }
    int _1015 = _941;
    float _1017 = _961;
    float _1019 = _943;
    int _1021 = _945;
    float _1023 = _947;
    int _1025 = _949;
    int _1027 = _951;
    int _1029 = _1025;
    int _1031 = _1027;
    float _1033 = _1019;
    float _1035 = as_type<float>(_1021);
    float _1037 = _1023;
    float _1039 = _1019;
    float _1041 = _1023;
    float _1043 = as_type<float>(_1021);
    int _1045 = _1027;
    int _1047 = _1015;
    if (!_921)
    {
        _953 = _1015;
    }
    int _1049 = _953;
    int _1051 = _1049;
    float _1053 = as_type<float>(_1049);
    if (!_921)
    {
        _821 = as_type<int>(_1017);
    }
    int _1055 = _821;
    bool _1057 = !_921;
    int _1059 = _1055;
    float _1061 = as_type<float>(_1055);
    if (!_1057)
    {
        bool _1063 = _437 > 0.0;
        float _1065 = _1019 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _1067 = _445 > 0.0;
        out.m_34.x = _1065;
        if (_1063)
        {
            _1029 = _1021;
        }
        int _1069 = _1029;
        int _1071 = _1069;
        if (!_1063)
        {
            float _1073 = -_437;
            float _1075 = fma(_1073, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_1021));
            _1071 = as_type<int>(_1075);
        }
        int _1077 = _1071;
        if (_1067)
        {
            _1051 = _1015;
        }
        int _1079 = _1051;
        int _1081 = _1079;
        if (!_1067)
        {
            float _1083 = -_445;
            float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_1015));
            _1081 = as_type<int>(_1085);
        }
        int _1087 = _1081;
        _1053 = as_type<float>(_1087);
        if (_1063)
        {
            float _1089 = fma(_437, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1023);
            _1031 = as_type<int>(_1089);
        }
        int _1091 = _1031;
        float _1093 = as_type<float>(_1091);
        if (_1067)
        {
            float _1095 = fma(_445, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1017);
            _1059 = as_type<int>(_1095);
        }
        int _1097 = _1059;
        float _1099 = as_type<float>(_1097);
        if (!_1063)
        {
            out.m_38.x = as_type<float>(_1077);
        }
        if (_1067)
        {
            _1033 = _1065;
        }
        float _1101 = _1033;
        float _1103 = _1101;
        if (_1067)
        {
            _1035 = as_type<float>(_1077);
        }
        float _1105 = _1035;
        float _1107 = _1105;
        if (!_1067)
        {
            out.m_36.y = as_type<float>(_1087);
        }
        if (!_1067)
        {
            _1103 = _1065;
        }
        float _1109 = _1103;
        _1039 = _1109;
        if (!_1067)
        {
            _1107 = as_type<float>(_1077);
        }
        float _1111 = _1107;
        _1043 = _1111;
        if (_1063)
        {
            out.m_36.x = as_type<float>(_1091);
        }
        if (_1067)
        {
            out.m_38.y = as_type<float>(_1097);
        }
        if (!_1063)
        {
            _1093 = _1023;
        }
        float _1113 = _1093;
        _1045 = as_type<int>(_1113);
        if (_1067)
        {
            _1037 = _1113;
        }
        float _1115 = _1037;
        _1041 = _1115;
        if (!_1067)
        {
            _1099 = _1017;
        }
        float _1117 = _1099;
        _1061 = _1117;
        if (!_1067)
        {
            _1041 = _1113;
        }
    }
    float _1119 = _1039;
    float _1121 = _1041;
    float _1123 = _1043;
    float _1125 = _1061;
    int _1127 = _1045;
    float _1129 = _1053;
    int _1131 = _1127;
    if (!_927)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _1133 = _447 > 0.0;
    float _1135 = _1119 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    bool _1137 = _449 > 0.0;
    out.m_34.x = _1135;
    if (_1133)
    {
        float _1139 = fma(_447, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1121);
        _1131 = as_type<int>(_1139);
    }
    int _1141 = _1131;
    if (!_1133)
    {
        float _1143 = -_447;
        float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1123);
        _513 = as_type<int>(_1145);
    }
    int _1147 = _513;
    if (_1137)
    {
        float _1149 = fma(_449, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1125);
        _1047 = as_type<int>(_1149);
    }
    int _1151 = _1047;
    if (_1133)
    {
        out.m_36.x = as_type<float>(_1141);
    }
    if (!_1133)
    {
        out.m_38.x = as_type<float>(_1147);
    }
    if (_1137)
    {
        out.m_38.y = as_type<float>(_1151);
    }
    if (_1137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1153 = -_449;
    float _1155 = fma(_1153, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1129);
    out.m_36.y = _1155;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    bool _191 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _52 = in.m_27.x;
    float _54 = in.m_29.x;
    float _56 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _58 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _60 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _62 = in.m_31.x;
    float _64 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[8].x, _56);
    float _66 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[7].x, _58);
    float _68 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[9].x, _60);
    float _70 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[8].z, _64);
    float _72 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[7].z, _66);
    float _74 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[9].z, _68);
    float _76 = _70 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _78 = _72 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _80 = _74 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _82 = _76 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _84 = abs(_52);
    float _86 = log2(_84);
    float _88 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[13].x, _82);
    float _90 = _76 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _92 = _76 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _94 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[13].z, _88);
    float _96 = _94 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _98 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[10].x, _90);
    float _100 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[11].x, _92);
    float _102 = _54 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _104 = 1.0 / _96;
    float _106 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[10].z, _98);
    float _108 = _86 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _110 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[11].z, _100);
    float _112 = _54 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _114 = _106 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _116 = -_102;
    float _118 = fma(_62, (*spvDescriptorSet0.vp_c3)._m0[15].z, _116);
    float _120 = _110 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _122 = exp2(_108);
    float _124 = fma(_62, (*spvDescriptorSet0.vp_c3)._m0[15].y, _112);
    float _126 = _114 * _104;
    float _128 = _120 * _104;
    float _130 = fma(_126, 0.5, 0.5);
    float _132 = fma(_128, -0.5, 0.5);
    float _134 = _122 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _136 = _118 * _134;
    float _138 = _124 * _134;
    float _140 = _130 + _136;
    float _142 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float2 _1372 = float2(_140, _142);
    float _144 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1372, float2(0.0), isnan(_1372)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1372, float2(0.0), isnan(_1372)), level(0.0)).x;
    out.m_34.x = 0.0;
    float _146 = (*spvDescriptorSet0.vp_c3)._m0[14].x + (*spvDescriptorSet0.vp_c3)._m0[14].y;
    out.m_36.x = 0.0;
    float _148 = 1.0 / _146;
    out.gl_Position.z = 1.0;
    out.m_38.x = 0.0;
    float _150 = -_148;
    float _152 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[14].x, 1.0);
    float _154 = -_144;
    float _156 = fma(_154, _152, 1.0);
    float _158 = 1.0 / _156;
    float _160 = _158 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _162 = -_80;
    bool _166 = _160 > _162;
    int _169 = as_type<int>(_136);
    int _171 = as_type<int>(_144);
    float _173 = _158;
    float _175 = _138;
    float _177 = _146;
    int _179 = as_type<int>(_80);
    float _181;
    float _183;
    float _185;
    float _187;
    float _189;
    if (!_166)
    {
        _181 = 0.0;
        _183 = 0.0;
        _185 = 0.0;
        _187 = 0.0;
        _189 = 0.0;
        _191 = true;
    }
    else
    {
        bool _193 = _136 > 0.0;
        float _195 = _136 * (*spvDescriptorSet0.vp_c3)._m0[16].w;
        bool _197 = _138 > 0.0;
        float _199 = _138 * (*spvDescriptorSet0.vp_c3)._m0[16].w;
        out.m_34.x = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _181 = _199;
        if (_193)
        {
            _169 = 0;
        }
        int _201 = _169;
        int _203 = _201;
        if (!_193)
        {
            float _205 = -_195;
            float _207 = (-0.0) + _205;
            _203 = as_type<int>(_207);
        }
        int _209 = _203;
        if (_197)
        {
            _171 = 0;
        }
        int _211 = _171;
        int _213 = _211;
        if (!_197)
        {
            float _215 = -_199;
            float _217 = (-0.0) + _215;
            _213 = as_type<int>(_217);
        }
        int _219 = _213;
        _189 = as_type<float>(_219);
        if (_193)
        {
            out.m_36.x = _195;
        }
        if (_193)
        {
            _173 = _195;
        }
        float _221 = _173;
        float _223 = _221;
        if (_197)
        {
            _175 = as_type<float>(_209);
        }
        float _225 = _175;
        float _227 = _225;
        if (!_193)
        {
            out.m_38.x = as_type<float>(_209);
        }
        if (_197)
        {
            _177 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        }
        float _229 = _177;
        float _231 = _229;
        if (!_193)
        {
            _223 = 0.0;
        }
        float _233 = _223;
        _187 = _233;
        if (!_197)
        {
            out.m_36.y = as_type<float>(_219);
        }
        if (!_197)
        {
            _227 = as_type<float>(_209);
        }
        float _235 = _227;
        _185 = _235;
        if (!_197)
        {
            _231 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        }
        float _237 = _231;
        _183 = _237;
        if (_197)
        {
            out.m_38.y = _199;
        }
        if (!_197)
        {
            _181 = 0.0;
        }
    }
    _191 = false;
    float _239 = _181;
    float _241 = _183;
    float _243 = _185;
    float _245 = _187;
    float _247 = _189;
    float _249 = _52 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    float _251 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 2.0, _52);
    float _253 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 3.0, _52);
    float _255 = abs(_249);
    float _257 = log2(_255);
    float _259 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 4.0, _52);
    float _261 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 5.0, _52);
    float _263 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 6.0, _52);
    float _265 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 7.0, _52);
    float _267 = _124 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _269 = abs(_251);
    float _271 = log2(_269);
    float _273 = -_267;
    float _275 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[15].z, _273);
    float _277 = abs(_253);
    float _279 = log2(_277);
    float _281 = _257 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _283 = _124 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _285 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[15].y, _283);
    float _287 = abs(_259);
    float _289 = log2(_287);
    float _291 = _271 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _293 = _285 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _295 = -_293;
    float _297 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[15].z, _295);
    float _299 = exp2(_281);
    float _301 = _279 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _303 = _285 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _305 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[15].y, _303);
    float _307 = exp2(_291);
    float _309 = abs(_261);
    float _311 = log2(_309);
    float _313 = _299 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _315 = _275 * _313;
    float _317 = _285 * _313;
    float _319 = exp2(_301);
    float _321 = _307 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _323 = fma(_317, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float _325 = _297 * _321;
    float _327 = _305 * _321;
    float _329 = abs(_263);
    float _331 = log2(_329);
    float _333 = _305 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _335 = _311 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _337 = fma(_327, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float _339 = _130 + _325;
    float _341 = -_333;
    float _343 = fma(_297, (*spvDescriptorSet0.vp_c3)._m0[15].z, _341);
    float _345 = abs(_265);
    float _347 = log2(_345);
    float _349 = _289 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _351 = _305 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _353 = _319 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _355 = fma(_297, (*spvDescriptorSet0.vp_c3)._m0[15].y, _351);
    float _357 = exp2(_349);
    float _359 = _331 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _361 = _355 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _363 = _355 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _365 = fma(_343, (*spvDescriptorSet0.vp_c3)._m0[15].y, _361);
    float _367 = -_363;
    float _369 = fma(_343, (*spvDescriptorSet0.vp_c3)._m0[15].z, _367);
    float _371 = exp2(_335);
    float _373 = _343 * _353;
    float _375 = _355 * _353;
    float _377 = _365 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _379 = _347 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _381 = _130 + _373;
    float _383 = fma(_375, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float _385 = exp2(_359);
    float _387 = _365 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _389 = _371 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _391 = fma(_369, (*spvDescriptorSet0.vp_c3)._m0[15].y, _387);
    float _393 = _357 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _395 = -_377;
    float _397 = fma(_369, (*spvDescriptorSet0.vp_c3)._m0[15].z, _395);
    float _399 = exp2(_379);
    float _401 = _391 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _403 = _391 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _405 = _369 * _393;
    float _407 = _365 * _393;
    float _409 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[15].y, _401);
    float _411 = _391 * _389;
    float _413 = _397 * _389;
    float _415 = -_403;
    float _417 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[15].z, _415);
    float _419 = _409 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _421 = _385 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _423 = _409 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _425 = _130 + _405;
    float _427 = fma(_417, (*spvDescriptorSet0.vp_c3)._m0[15].y, _419);
    float _429 = _130 + _315;
    float _431 = -_423;
    float _433 = fma(_417, (*spvDescriptorSet0.vp_c3)._m0[15].z, _431);
    float _435 = _399 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _437 = _417 * _421;
    float2 _1889 = float2(_429, _323);
    float _439 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1889, float2(0.0), isnan(_1889)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1889, float2(0.0), isnan(_1889)), level(0.0)).x;
    float2 _1897 = float2(_339, _337);
    float _441 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1897, float2(0.0), isnan(_1897)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1897, float2(0.0), isnan(_1897)), level(0.0)).x;
    float2 _1905 = float2(_381, _383);
    float _443 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1905, float2(0.0), isnan(_1905)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1905, float2(0.0), isnan(_1905)), level(0.0)).x;
    float _445 = _409 * _421;
    float _447 = _433 * _435;
    float _449 = _427 * _435;
    float _451 = _130 + _413;
    float _453 = fma(_407, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float _455 = _130 + _437;
    float _457 = fma(_411, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float _461 = _130 + _447;
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float2 _1951 = float2(_425, _453);
    float _465 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1951, float2(0.0), isnan(_1951)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1951, float2(0.0), isnan(_1951)), level(0.0)).x;
    float2 _1959 = float2(_451, _457);
    float _467 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1959, float2(0.0), isnan(_1959)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1959, float2(0.0), isnan(_1959)), level(0.0)).x;
    float2 _1967 = float2(_455, _459);
    float _469 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1967, float2(0.0), isnan(_1967)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1967, float2(0.0), isnan(_1967)), level(0.0)).x;
    float2 _1975 = float2(_461, _463);
    float _471 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1975, float2(0.0), isnan(_1975)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1975, float2(0.0), isnan(_1975)), level(0.0)).x;
    float _473 = -_439;
    float _475 = fma(_152, _473, 1.0);
    float _477 = 1.0 / _475;
    float _479 = _477 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _481 = -_80;
    bool _483 = _479 > _481;
    int _485 = as_type<int>(_439);
    int _487 = as_type<int>(_243);
    int _489 = as_type<int>(_477);
    int _491 = as_type<int>(_247);
    float _493 = _241;
    float _495 = _245;
    float _497 = _241;
    int _499 = as_type<int>(_243);
    float _501 = _247;
    float _503 = _245;
    int _505 = as_type<int>(_477);
    int _507 = as_type<int>(_461);
    int _509 = as_type<int>(_325);
    int _511 = as_type<int>(_373);
    int _513 = as_type<int>(_447);
    if (!_483)
    {
        _485 = as_type<int>(_239);
    }
    int _515 = _485;
    bool _517 = !_483;
    int _519 = _515;
    float _521 = as_type<float>(_515);
    if (!_517)
    {
        bool _523 = _315 > 0.0;
        float _525 = _241 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _527 = _317 > 0.0;
        out.m_34.x = _525;
        if (!_523)
        {
            float _529 = -_315;
            float _531 = fma(_529, (*spvDescriptorSet0.vp_c3)._m0[16].w, _243);
            _487 = as_type<int>(_531);
        }
        int _533 = _487;
        _499 = _533;
        if (_523)
        {
            float _535 = fma(_315, (*spvDescriptorSet0.vp_c3)._m0[16].w, _245);
            _489 = as_type<int>(_535);
        }
        int _537 = _489;
        float _539 = as_type<float>(_537);
        if (!_527)
        {
            float _541 = -_317;
            float _543 = fma(_541, (*spvDescriptorSet0.vp_c3)._m0[16].w, _247);
            _491 = as_type<int>(_543);
        }
        int _545 = _491;
        _501 = as_type<float>(_545);
        if (_527)
        {
            float _547 = fma(_317, (*spvDescriptorSet0.vp_c3)._m0[16].w, _239);
            _519 = as_type<int>(_547);
        }
        int _549 = _519;
        float _551 = as_type<float>(_549);
        if (_527)
        {
            _493 = _525;
        }
        float _553 = _493;
        float _555 = _553;
        if (!_523)
        {
            out.m_38.x = as_type<float>(_533);
        }
        if (!_527)
        {
            _555 = _525;
        }
        float _557 = _555;
        _497 = _557;
        if (!_527)
        {
            out.m_36.y = as_type<float>(_545);
        }
        if (_523)
        {
            out.m_36.x = as_type<float>(_537);
        }
        if (_527)
        {
            out.m_38.y = as_type<float>(_549);
        }
        if (!_523)
        {
            _539 = _245;
        }
        float _559 = _539;
        _505 = as_type<int>(_559);
        if (_527)
        {
            _495 = _559;
        }
        float _561 = _495;
        _503 = _561;
        if (!_527)
        {
            _551 = _239;
        }
        float _563 = _551;
        _521 = _563;
        if (!_527)
        {
            _503 = _559;
        }
    }
    float _565 = _521;
    float _567 = _497;
    int _569 = _499;
    float _571 = _501;
    float _573 = _503;
    int _575 = _505;
    float _577 = -_441;
    float _579 = fma(_152, _577, 1.0);
    float _581 = 1.0 / _579;
    float _583 = _581 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _585 = -_80;
    bool _587 = _583 > _585;
    int _589 = _575;
    int _591 = as_type<int>(_571);
    int _593 = as_type<int>(_583);
    float _595 = _567;
    int _597 = _569;
    float _599 = _573;
    float _601 = _567;
    int _603 = _569;
    float _605 = _571;
    float _607 = _573;
    int _609 = _575;
    if (!_587)
    {
        _507 = as_type<int>(_565);
    }
    int _611 = _507;
    bool _613 = !_587;
    int _615 = _611;
    float _617 = as_type<float>(_611);
    if (!_613)
    {
        bool _619 = _325 > 0.0;
        float _621 = _567 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _623 = _327 > 0.0;
        out.m_34.x = _621;
        if (_619)
        {
            _589 = _569;
        }
        int _625 = _589;
        int _627 = _625;
        if (!_619)
        {
            float _629 = -_325;
            float _631 = fma(_629, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_569));
            _627 = as_type<int>(_631);
        }
        int _633 = _627;
        _609 = _633;
        if (!_623)
        {
            float _635 = -_327;
            float _637 = fma(_635, (*spvDescriptorSet0.vp_c3)._m0[16].w, _571);
            _591 = as_type<int>(_637);
        }
        int _639 = _591;
        _605 = as_type<float>(_639);
        if (_619)
        {
            float _641 = fma(_325, (*spvDescriptorSet0.vp_c3)._m0[16].w, _573);
            _593 = as_type<int>(_641);
        }
        int _643 = _593;
        float _645 = as_type<float>(_643);
        if (_623)
        {
            float _647 = fma(_327, (*spvDescriptorSet0.vp_c3)._m0[16].w, _565);
            _615 = as_type<int>(_647);
        }
        int _649 = _615;
        float _651 = as_type<float>(_649);
        if (_623)
        {
            _595 = _621;
        }
        float _653 = _595;
        float _655 = _653;
        if (!_619)
        {
            out.m_38.x = as_type<float>(_633);
        }
        if (_623)
        {
            _597 = _633;
        }
        int _657 = _597;
        int _659 = _657;
        if (!_623)
        {
            _655 = _621;
        }
        float _661 = _655;
        _601 = _661;
        if (!_623)
        {
            out.m_36.y = as_type<float>(_639);
        }
        if (!_623)
        {
            _659 = _633;
        }
        int _663 = _659;
        _603 = _663;
        if (_619)
        {
            out.m_36.x = as_type<float>(_643);
        }
        if (_623)
        {
            out.m_38.y = as_type<float>(_649);
        }
        if (!_619)
        {
            _645 = _573;
        }
        float _665 = _645;
        if (_623)
        {
            _599 = _665;
        }
        float _667 = _599;
        _607 = _667;
        if (!_623)
        {
            _651 = _565;
        }
        float _669 = _651;
        _617 = _669;
        if (!_623)
        {
            _607 = _665;
        }
    }
    float _671 = _617;
    float _673 = _601;
    int _675 = _603;
    float _677 = _605;
    float _679 = _607;
    int _681 = _609;
    float _683 = -_443;
    float _685 = fma(_152, _683, 1.0);
    float _687 = 1.0 / _685;
    float _689 = _687 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _691 = -_80;
    bool _693 = _689 > _691;
    int _695 = _681;
    int _697 = as_type<int>(_677);
    int _699 = as_type<int>(_689);
    float _701 = _673;
    int _703 = _675;
    float _705 = _679;
    float _707 = _673;
    int _709 = _675;
    float _711 = _677;
    float _713 = _679;
    int _715 = _681;
    if (!_693)
    {
        _509 = as_type<int>(_671);
    }
    int _717 = _509;
    bool _719 = !_693;
    int _721 = _717;
    float _723 = as_type<float>(_717);
    if (!_719)
    {
        bool _725 = _373 > 0.0;
        float _727 = _673 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _729 = _375 > 0.0;
        out.m_34.x = _727;
        if (_725)
        {
            _695 = _675;
        }
        int _731 = _695;
        int _733 = _731;
        if (!_725)
        {
            float _735 = -_373;
            float _737 = fma(_735, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_675));
            _733 = as_type<int>(_737);
        }
        int _739 = _733;
        _715 = _739;
        if (!_729)
        {
            float _741 = -_375;
            float _743 = fma(_741, (*spvDescriptorSet0.vp_c3)._m0[16].w, _677);
            _697 = as_type<int>(_743);
        }
        int _745 = _697;
        _711 = as_type<float>(_745);
        if (_725)
        {
            float _747 = fma(_373, (*spvDescriptorSet0.vp_c3)._m0[16].w, _679);
            _699 = as_type<int>(_747);
        }
        int _749 = _699;
        float _751 = as_type<float>(_749);
        if (_729)
        {
            float _753 = fma(_375, (*spvDescriptorSet0.vp_c3)._m0[16].w, _671);
            _721 = as_type<int>(_753);
        }
        int _755 = _721;
        float _757 = as_type<float>(_755);
        if (_729)
        {
            _701 = _727;
        }
        float _759 = _701;
        float _761 = _759;
        if (!_725)
        {
            out.m_38.x = as_type<float>(_739);
        }
        if (_729)
        {
            _703 = _739;
        }
        int _763 = _703;
        int _765 = _763;
        if (!_729)
        {
            _761 = _727;
        }
        float _767 = _761;
        _707 = _767;
        if (!_729)
        {
            out.m_36.y = as_type<float>(_745);
        }
        if (!_729)
        {
            _765 = _739;
        }
        int _769 = _765;
        _709 = _769;
        if (_725)
        {
            out.m_36.x = as_type<float>(_749);
        }
        if (_729)
        {
            out.m_38.y = as_type<float>(_755);
        }
        if (!_725)
        {
            _751 = _679;
        }
        float _771 = _751;
        if (_729)
        {
            _705 = _771;
        }
        float _773 = _705;
        _713 = _773;
        if (!_729)
        {
            _757 = _671;
        }
        float _775 = _757;
        _723 = _775;
        if (!_729)
        {
            _713 = _771;
        }
    }
    float _777 = _723;
    float _779 = _707;
    int _781 = _709;
    float _783 = _711;
    float _785 = _713;
    int _787 = _715;
    float _789 = -_465;
    float _791 = fma(_152, _789, 1.0);
    float _793 = 1.0 / _791;
    float _795 = _793 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _797 = -_80;
    bool _799 = _795 > _797;
    int _801 = _787;
    int _803 = as_type<int>(_783);
    int _805 = as_type<int>(_795);
    float _807 = _779;
    int _809 = _781;
    float _811 = _785;
    float _813 = _779;
    int _815 = _781;
    float _817 = _783;
    float _819 = _785;
    int _821 = as_type<int>(_777);
    if (!_799)
    {
        _511 = as_type<int>(_777);
    }
    int _823 = _511;
    bool _825 = !_799;
    int _827 = _823;
    float _829 = as_type<float>(_823);
    if (!_825)
    {
        bool _831 = _405 > 0.0;
        float _833 = _779 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _835 = _407 > 0.0;
        out.m_34.x = _833;
        if (_831)
        {
            _801 = _781;
        }
        int _837 = _801;
        int _839 = _837;
        if (!_831)
        {
            float _841 = -_405;
            float _843 = fma(_841, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_781));
            _839 = as_type<int>(_843);
        }
        int _845 = _839;
        if (!_835)
        {
            float _847 = -_407;
            float _849 = fma(_847, (*spvDescriptorSet0.vp_c3)._m0[16].w, _783);
            _803 = as_type<int>(_849);
        }
        int _851 = _803;
        _817 = as_type<float>(_851);
        if (_831)
        {
            float _853 = fma(_405, (*spvDescriptorSet0.vp_c3)._m0[16].w, _785);
            _805 = as_type<int>(_853);
        }
        int _855 = _805;
        float _857 = as_type<float>(_855);
        if (_835)
        {
            float _859 = fma(_407, (*spvDescriptorSet0.vp_c3)._m0[16].w, _777);
            _827 = as_type<int>(_859);
        }
        int _861 = _827;
        float _863 = as_type<float>(_861);
        if (_835)
        {
            _807 = _833;
        }
        float _865 = _807;
        float _867 = _865;
        if (!_831)
        {
            out.m_38.x = as_type<float>(_845);
        }
        if (_835)
        {
            _809 = _845;
        }
        int _869 = _809;
        int _871 = _869;
        if (!_835)
        {
            _867 = _833;
        }
        float _873 = _867;
        _813 = _873;
        if (!_835)
        {
            out.m_36.y = as_type<float>(_851);
        }
        if (!_835)
        {
            _871 = _845;
        }
        int _875 = _871;
        _815 = _875;
        if (_831)
        {
            out.m_36.x = as_type<float>(_855);
        }
        if (_835)
        {
            out.m_38.y = as_type<float>(_861);
        }
        if (!_831)
        {
            _857 = _785;
        }
        float _877 = _857;
        if (_835)
        {
            _811 = _877;
        }
        float _879 = _811;
        _819 = _879;
        if (!_835)
        {
            _863 = _777;
        }
        float _881 = _863;
        _829 = _881;
        if (!_835)
        {
            _819 = _877;
        }
    }
    float _883 = _829;
    float _885 = _813;
    int _887 = _815;
    float _889 = _817;
    float _891 = _819;
    float _893 = -_467;
    float _895 = fma(_152, _893, 1.0);
    float _897 = -_469;
    float _899 = fma(_152, _897, 1.0);
    float _901 = -_471;
    float _903 = fma(_152, _901, 1.0);
    float _905 = 1.0 / _895;
    float _907 = 1.0 / _899;
    float _909 = 1.0 / _903;
    float _911 = _905 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _913 = -_80;
    bool _915 = _911 > _913;
    float _917 = _907 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _919 = -_80;
    bool _921 = _917 > _919;
    float _923 = _909 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _925 = -_80;
    bool _927 = _923 > _925;
    int _929 = as_type<int>(_923);
    int _931 = as_type<int>(_889);
    int _933 = as_type<int>(_917);
    float _935 = _885;
    int _937 = _887;
    float _939 = _891;
    int _941 = as_type<int>(_889);
    float _943 = _885;
    int _945 = _887;
    float _947 = _891;
    int _949 = as_type<int>(_923);
    int _951 = as_type<int>(_917);
    int _953 = as_type<int>(_909);
    if (!_915)
    {
        _179 = as_type<int>(_883);
    }
    int _955 = _179;
    bool _957 = !_915;
    int _959 = _955;
    float _961 = as_type<float>(_955);
    if (!_957)
    {
        bool _963 = _413 > 0.0;
        float _965 = _885 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _967 = _411 > 0.0;
        out.m_34.x = _965;
        if (_963)
        {
            _929 = _887;
        }
        int _969 = _929;
        int _971 = _969;
        if (!_963)
        {
            float _973 = -_413;
            float _975 = fma(_973, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_887));
            _971 = as_type<int>(_975);
        }
        int _977 = _971;
        _949 = _977;
        if (!_967)
        {
            float _979 = -_411;
            float _981 = fma(_979, (*spvDescriptorSet0.vp_c3)._m0[16].w, _889);
            _931 = as_type<int>(_981);
        }
        int _983 = _931;
        _941 = _983;
        if (_963)
        {
            float _985 = fma(_413, (*spvDescriptorSet0.vp_c3)._m0[16].w, _891);
            _933 = as_type<int>(_985);
        }
        int _987 = _933;
        float _989 = as_type<float>(_987);
        if (_967)
        {
            float _991 = fma(_411, (*spvDescriptorSet0.vp_c3)._m0[16].w, _883);
            _959 = as_type<int>(_991);
        }
        int _993 = _959;
        float _995 = as_type<float>(_993);
        if (_967)
        {
            _935 = _965;
        }
        float _997 = _935;
        float _999 = _997;
        if (!_963)
        {
            out.m_38.x = as_type<float>(_977);
        }
        if (_967)
        {
            _937 = _977;
        }
        int _1001 = _937;
        int _1003 = _1001;
        if (!_967)
        {
            _999 = _965;
        }
        float _1005 = _999;
        _943 = _1005;
        if (!_967)
        {
            out.m_36.y = as_type<float>(_983);
        }
        if (!_967)
        {
            _1003 = _977;
        }
        int _1007 = _1003;
        _945 = _1007;
        if (_963)
        {
            out.m_36.x = as_type<float>(_987);
        }
        if (_967)
        {
            out.m_38.y = as_type<float>(_993);
        }
        if (!_963)
        {
            _989 = _891;
        }
        float _1009 = _989;
        _951 = as_type<int>(_1009);
        if (_967)
        {
            _939 = _1009;
        }
        float _1011 = _939;
        _947 = _1011;
        if (!_967)
        {
            _995 = _883;
        }
        float _1013 = _995;
        _961 = _1013;
        if (!_967)
        {
            _947 = _1009;
        }
    }
    int _1015 = _941;
    float _1017 = _961;
    float _1019 = _943;
    int _1021 = _945;
    float _1023 = _947;
    int _1025 = _949;
    int _1027 = _951;
    int _1029 = _1025;
    int _1031 = _1027;
    float _1033 = _1019;
    float _1035 = as_type<float>(_1021);
    float _1037 = _1023;
    float _1039 = _1019;
    float _1041 = _1023;
    float _1043 = as_type<float>(_1021);
    int _1045 = _1027;
    int _1047 = _1015;
    if (!_921)
    {
        _953 = _1015;
    }
    int _1049 = _953;
    int _1051 = _1049;
    float _1053 = as_type<float>(_1049);
    if (!_921)
    {
        _821 = as_type<int>(_1017);
    }
    int _1055 = _821;
    bool _1057 = !_921;
    int _1059 = _1055;
    float _1061 = as_type<float>(_1055);
    if (!_1057)
    {
        bool _1063 = _437 > 0.0;
        float _1065 = _1019 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _1067 = _445 > 0.0;
        out.m_34.x = _1065;
        if (_1063)
        {
            _1029 = _1021;
        }
        int _1069 = _1029;
        int _1071 = _1069;
        if (!_1063)
        {
            float _1073 = -_437;
            float _1075 = fma(_1073, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_1021));
            _1071 = as_type<int>(_1075);
        }
        int _1077 = _1071;
        if (_1067)
        {
            _1051 = _1015;
        }
        int _1079 = _1051;
        int _1081 = _1079;
        if (!_1067)
        {
            float _1083 = -_445;
            float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_1015));
            _1081 = as_type<int>(_1085);
        }
        int _1087 = _1081;
        _1053 = as_type<float>(_1087);
        if (_1063)
        {
            float _1089 = fma(_437, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1023);
            _1031 = as_type<int>(_1089);
        }
        int _1091 = _1031;
        float _1093 = as_type<float>(_1091);
        if (_1067)
        {
            float _1095 = fma(_445, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1017);
            _1059 = as_type<int>(_1095);
        }
        int _1097 = _1059;
        float _1099 = as_type<float>(_1097);
        if (!_1063)
        {
            out.m_38.x = as_type<float>(_1077);
        }
        if (_1067)
        {
            _1033 = _1065;
        }
        float _1101 = _1033;
        float _1103 = _1101;
        if (_1067)
        {
            _1035 = as_type<float>(_1077);
        }
        float _1105 = _1035;
        float _1107 = _1105;
        if (!_1067)
        {
            out.m_36.y = as_type<float>(_1087);
        }
        if (!_1067)
        {
            _1103 = _1065;
        }
        float _1109 = _1103;
        _1039 = _1109;
        if (!_1067)
        {
            _1107 = as_type<float>(_1077);
        }
        float _1111 = _1107;
        _1043 = _1111;
        if (_1063)
        {
            out.m_36.x = as_type<float>(_1091);
        }
        if (_1067)
        {
            out.m_38.y = as_type<float>(_1097);
        }
        if (!_1063)
        {
            _1093 = _1023;
        }
        float _1113 = _1093;
        _1045 = as_type<int>(_1113);
        if (_1067)
        {
            _1037 = _1113;
        }
        float _1115 = _1037;
        _1041 = _1115;
        if (!_1067)
        {
            _1099 = _1017;
        }
        float _1117 = _1099;
        _1061 = _1117;
        if (!_1067)
        {
            _1041 = _1113;
        }
    }
    float _1119 = _1039;
    float _1121 = _1041;
    float _1123 = _1043;
    float _1125 = _1061;
    int _1127 = _1045;
    float _1129 = _1053;
    int _1131 = _1127;
    if (!_927)
    {
        return out;
    }
    bool _1133 = _447 > 0.0;
    float _1135 = _1119 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    bool _1137 = _449 > 0.0;
    out.m_34.x = _1135;
    if (_1133)
    {
        float _1139 = fma(_447, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1121);
        _1131 = as_type<int>(_1139);
    }
    int _1141 = _1131;
    if (!_1133)
    {
        float _1143 = -_447;
        float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1123);
        _513 = as_type<int>(_1145);
    }
    int _1147 = _513;
    if (_1137)
    {
        float _1149 = fma(_449, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1125);
        _1047 = as_type<int>(_1149);
    }
    int _1151 = _1047;
    if (_1133)
    {
        out.m_36.x = as_type<float>(_1141);
    }
    if (!_1133)
    {
        out.m_38.x = as_type<float>(_1147);
    }
    if (_1137)
    {
        out.m_38.y = as_type<float>(_1151);
    }
    if (_1137)
    {
        return out;
    }
    float _1153 = -_449;
    float _1155 = fma(_1153, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1129);
    out.m_36.y = _1155;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    bool _191 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _52 = in.m_27.x;
    float _54 = in.m_29.x;
    float _56 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _58 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _60 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _62 = in.m_31.x;
    float _64 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[8].x, _56);
    float _66 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[7].x, _58);
    float _68 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[9].x, _60);
    float _70 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[8].z, _64);
    float _72 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[7].z, _66);
    float _74 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[9].z, _68);
    float _76 = _70 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _78 = _72 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _80 = _74 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _82 = _76 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _84 = abs(_52);
    float _86 = log2(_84);
    float _88 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[13].x, _82);
    float _90 = _76 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _92 = _76 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _94 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[13].z, _88);
    float _96 = _94 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _98 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[10].x, _90);
    float _100 = fma(_78, (*spvDescriptorSet0.vp_c3)._m0[11].x, _92);
    float _102 = _54 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _104 = 1.0 / _96;
    float _106 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[10].z, _98);
    float _108 = _86 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _110 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[11].z, _100);
    float _112 = _54 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _114 = _106 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _116 = -_102;
    float _118 = fma(_62, (*spvDescriptorSet0.vp_c3)._m0[15].z, _116);
    float _120 = _110 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _122 = exp2(_108);
    float _124 = fma(_62, (*spvDescriptorSet0.vp_c3)._m0[15].y, _112);
    float _126 = _114 * _104;
    float _128 = _120 * _104;
    float _130 = fma(_126, 0.5, 0.5);
    float _132 = fma(_128, -0.5, 0.5);
    float _134 = _122 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _136 = _118 * _134;
    float _138 = _124 * _134;
    float _140 = _130 + _136;
    float _142 = fma(_138, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float2 _1372 = float2(_140, _142);
    float _144 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1372, float2(0.0), isnan(_1372)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1372, float2(0.0), isnan(_1372)), level(0.0)).x;
    out.m_34.x = 0.0;
    float _146 = (*spvDescriptorSet0.vp_c3)._m0[14].x + (*spvDescriptorSet0.vp_c3)._m0[14].y;
    out.m_36.x = 0.0;
    float _148 = 1.0 / _146;
    out.gl_Position.z = 1.0;
    out.m_38.x = 0.0;
    float _150 = -_148;
    float _152 = fma(_150, (*spvDescriptorSet0.vp_c3)._m0[14].x, 1.0);
    float _154 = -_144;
    float _156 = fma(_154, _152, 1.0);
    float _158 = 1.0 / _156;
    float _160 = _158 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _162 = -_80;
    bool _166 = _160 > _162;
    int _169 = as_type<int>(_136);
    int _171 = as_type<int>(_144);
    float _173 = _158;
    float _175 = _138;
    float _177 = _146;
    int _179 = as_type<int>(_80);
    float _181;
    float _183;
    float _185;
    float _187;
    float _189;
    if (!_166)
    {
        _181 = 0.0;
        _183 = 0.0;
        _185 = 0.0;
        _187 = 0.0;
        _189 = 0.0;
        _191 = true;
    }
    else
    {
        bool _193 = _136 > 0.0;
        float _195 = _136 * (*spvDescriptorSet0.vp_c3)._m0[16].w;
        bool _197 = _138 > 0.0;
        float _199 = _138 * (*spvDescriptorSet0.vp_c3)._m0[16].w;
        out.m_34.x = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _181 = _199;
        if (_193)
        {
            _169 = 0;
        }
        int _201 = _169;
        int _203 = _201;
        if (!_193)
        {
            float _205 = -_195;
            float _207 = (-0.0) + _205;
            _203 = as_type<int>(_207);
        }
        int _209 = _203;
        if (_197)
        {
            _171 = 0;
        }
        int _211 = _171;
        int _213 = _211;
        if (!_197)
        {
            float _215 = -_199;
            float _217 = (-0.0) + _215;
            _213 = as_type<int>(_217);
        }
        int _219 = _213;
        _189 = as_type<float>(_219);
        if (_193)
        {
            out.m_36.x = _195;
        }
        if (_193)
        {
            _173 = _195;
        }
        float _221 = _173;
        float _223 = _221;
        if (_197)
        {
            _175 = as_type<float>(_209);
        }
        float _225 = _175;
        float _227 = _225;
        if (!_193)
        {
            out.m_38.x = as_type<float>(_209);
        }
        if (_197)
        {
            _177 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        }
        float _229 = _177;
        float _231 = _229;
        if (!_193)
        {
            _223 = 0.0;
        }
        float _233 = _223;
        _187 = _233;
        if (!_197)
        {
            out.m_36.y = as_type<float>(_219);
        }
        if (!_197)
        {
            _227 = as_type<float>(_209);
        }
        float _235 = _227;
        _185 = _235;
        if (!_197)
        {
            _231 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        }
        float _237 = _231;
        _183 = _237;
        if (_197)
        {
            out.m_38.y = _199;
        }
        if (!_197)
        {
            _181 = 0.0;
        }
    }
    _191 = false;
    float _239 = _181;
    float _241 = _183;
    float _243 = _185;
    float _245 = _187;
    float _247 = _189;
    float _249 = _52 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    float _251 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 2.0, _52);
    float _253 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 3.0, _52);
    float _255 = abs(_249);
    float _257 = log2(_255);
    float _259 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 4.0, _52);
    float _261 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 5.0, _52);
    float _263 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 6.0, _52);
    float _265 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 7.0, _52);
    float _267 = _124 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _269 = abs(_251);
    float _271 = log2(_269);
    float _273 = -_267;
    float _275 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[15].z, _273);
    float _277 = abs(_253);
    float _279 = log2(_277);
    float _281 = _257 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _283 = _124 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _285 = fma(_118, (*spvDescriptorSet0.vp_c3)._m0[15].y, _283);
    float _287 = abs(_259);
    float _289 = log2(_287);
    float _291 = _271 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _293 = _285 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _295 = -_293;
    float _297 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[15].z, _295);
    float _299 = exp2(_281);
    float _301 = _279 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _303 = _285 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _305 = fma(_275, (*spvDescriptorSet0.vp_c3)._m0[15].y, _303);
    float _307 = exp2(_291);
    float _309 = abs(_261);
    float _311 = log2(_309);
    float _313 = _299 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _315 = _275 * _313;
    float _317 = _285 * _313;
    float _319 = exp2(_301);
    float _321 = _307 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _323 = fma(_317, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float _325 = _297 * _321;
    float _327 = _305 * _321;
    float _329 = abs(_263);
    float _331 = log2(_329);
    float _333 = _305 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _335 = _311 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _337 = fma(_327, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float _339 = _130 + _325;
    float _341 = -_333;
    float _343 = fma(_297, (*spvDescriptorSet0.vp_c3)._m0[15].z, _341);
    float _345 = abs(_265);
    float _347 = log2(_345);
    float _349 = _289 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _351 = _305 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _353 = _319 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _355 = fma(_297, (*spvDescriptorSet0.vp_c3)._m0[15].y, _351);
    float _357 = exp2(_349);
    float _359 = _331 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _361 = _355 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _363 = _355 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _365 = fma(_343, (*spvDescriptorSet0.vp_c3)._m0[15].y, _361);
    float _367 = -_363;
    float _369 = fma(_343, (*spvDescriptorSet0.vp_c3)._m0[15].z, _367);
    float _371 = exp2(_335);
    float _373 = _343 * _353;
    float _375 = _355 * _353;
    float _377 = _365 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _379 = _347 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _381 = _130 + _373;
    float _383 = fma(_375, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float _385 = exp2(_359);
    float _387 = _365 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _389 = _371 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _391 = fma(_369, (*spvDescriptorSet0.vp_c3)._m0[15].y, _387);
    float _393 = _357 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _395 = -_377;
    float _397 = fma(_369, (*spvDescriptorSet0.vp_c3)._m0[15].z, _395);
    float _399 = exp2(_379);
    float _401 = _391 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _403 = _391 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _405 = _369 * _393;
    float _407 = _365 * _393;
    float _409 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[15].y, _401);
    float _411 = _391 * _389;
    float _413 = _397 * _389;
    float _415 = -_403;
    float _417 = fma(_397, (*spvDescriptorSet0.vp_c3)._m0[15].z, _415);
    float _419 = _409 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _421 = _385 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _423 = _409 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _425 = _130 + _405;
    float _427 = fma(_417, (*spvDescriptorSet0.vp_c3)._m0[15].y, _419);
    float _429 = _130 + _315;
    float _431 = -_423;
    float _433 = fma(_417, (*spvDescriptorSet0.vp_c3)._m0[15].z, _431);
    float _435 = _399 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _437 = _417 * _421;
    float2 _1889 = float2(_429, _323);
    float _439 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1889, float2(0.0), isnan(_1889)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1889, float2(0.0), isnan(_1889)), level(0.0)).x;
    float2 _1897 = float2(_339, _337);
    float _441 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1897, float2(0.0), isnan(_1897)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1897, float2(0.0), isnan(_1897)), level(0.0)).x;
    float2 _1905 = float2(_381, _383);
    float _443 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1905, float2(0.0), isnan(_1905)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1905, float2(0.0), isnan(_1905)), level(0.0)).x;
    float _445 = _409 * _421;
    float _447 = _433 * _435;
    float _449 = _427 * _435;
    float _451 = _130 + _413;
    float _453 = fma(_407, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float _455 = _130 + _437;
    float _457 = fma(_411, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float _461 = _130 + _447;
    float _463 = fma(_449, (*spvDescriptorSet0.vp_c3)._m0[14].z, _132);
    float2 _1951 = float2(_425, _453);
    float _465 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1951, float2(0.0), isnan(_1951)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1951, float2(0.0), isnan(_1951)), level(0.0)).x;
    float2 _1959 = float2(_451, _457);
    float _467 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1959, float2(0.0), isnan(_1959)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1959, float2(0.0), isnan(_1959)), level(0.0)).x;
    float2 _1967 = float2(_455, _459);
    float _469 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1967, float2(0.0), isnan(_1967)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1967, float2(0.0), isnan(_1967)), level(0.0)).x;
    float2 _1975 = float2(_461, _463);
    float _471 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1975, float2(0.0), isnan(_1975)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1975, float2(0.0), isnan(_1975)), level(0.0)).x;
    float _473 = -_439;
    float _475 = fma(_152, _473, 1.0);
    float _477 = 1.0 / _475;
    float _479 = _477 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _481 = -_80;
    bool _483 = _479 > _481;
    int _485 = as_type<int>(_439);
    int _487 = as_type<int>(_243);
    int _489 = as_type<int>(_477);
    int _491 = as_type<int>(_247);
    float _493 = _241;
    float _495 = _245;
    float _497 = _241;
    int _499 = as_type<int>(_243);
    float _501 = _247;
    float _503 = _245;
    int _505 = as_type<int>(_477);
    int _507 = as_type<int>(_461);
    int _509 = as_type<int>(_325);
    int _511 = as_type<int>(_373);
    int _513 = as_type<int>(_447);
    if (!_483)
    {
        _485 = as_type<int>(_239);
    }
    int _515 = _485;
    bool _517 = !_483;
    int _519 = _515;
    float _521 = as_type<float>(_515);
    if (!_517)
    {
        bool _523 = _315 > 0.0;
        float _525 = _241 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _527 = _317 > 0.0;
        out.m_34.x = _525;
        if (!_523)
        {
            float _529 = -_315;
            float _531 = fma(_529, (*spvDescriptorSet0.vp_c3)._m0[16].w, _243);
            _487 = as_type<int>(_531);
        }
        int _533 = _487;
        _499 = _533;
        if (_523)
        {
            float _535 = fma(_315, (*spvDescriptorSet0.vp_c3)._m0[16].w, _245);
            _489 = as_type<int>(_535);
        }
        int _537 = _489;
        float _539 = as_type<float>(_537);
        if (!_527)
        {
            float _541 = -_317;
            float _543 = fma(_541, (*spvDescriptorSet0.vp_c3)._m0[16].w, _247);
            _491 = as_type<int>(_543);
        }
        int _545 = _491;
        _501 = as_type<float>(_545);
        if (_527)
        {
            float _547 = fma(_317, (*spvDescriptorSet0.vp_c3)._m0[16].w, _239);
            _519 = as_type<int>(_547);
        }
        int _549 = _519;
        float _551 = as_type<float>(_549);
        if (_527)
        {
            _493 = _525;
        }
        float _553 = _493;
        float _555 = _553;
        if (!_523)
        {
            out.m_38.x = as_type<float>(_533);
        }
        if (!_527)
        {
            _555 = _525;
        }
        float _557 = _555;
        _497 = _557;
        if (!_527)
        {
            out.m_36.y = as_type<float>(_545);
        }
        if (_523)
        {
            out.m_36.x = as_type<float>(_537);
        }
        if (_527)
        {
            out.m_38.y = as_type<float>(_549);
        }
        if (!_523)
        {
            _539 = _245;
        }
        float _559 = _539;
        _505 = as_type<int>(_559);
        if (_527)
        {
            _495 = _559;
        }
        float _561 = _495;
        _503 = _561;
        if (!_527)
        {
            _551 = _239;
        }
        float _563 = _551;
        _521 = _563;
        if (!_527)
        {
            _503 = _559;
        }
    }
    float _565 = _521;
    float _567 = _497;
    int _569 = _499;
    float _571 = _501;
    float _573 = _503;
    int _575 = _505;
    float _577 = -_441;
    float _579 = fma(_152, _577, 1.0);
    float _581 = 1.0 / _579;
    float _583 = _581 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _585 = -_80;
    bool _587 = _583 > _585;
    int _589 = _575;
    int _591 = as_type<int>(_571);
    int _593 = as_type<int>(_583);
    float _595 = _567;
    int _597 = _569;
    float _599 = _573;
    float _601 = _567;
    int _603 = _569;
    float _605 = _571;
    float _607 = _573;
    int _609 = _575;
    if (!_587)
    {
        _507 = as_type<int>(_565);
    }
    int _611 = _507;
    bool _613 = !_587;
    int _615 = _611;
    float _617 = as_type<float>(_611);
    if (!_613)
    {
        bool _619 = _325 > 0.0;
        float _621 = _567 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _623 = _327 > 0.0;
        out.m_34.x = _621;
        if (_619)
        {
            _589 = _569;
        }
        int _625 = _589;
        int _627 = _625;
        if (!_619)
        {
            float _629 = -_325;
            float _631 = fma(_629, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_569));
            _627 = as_type<int>(_631);
        }
        int _633 = _627;
        _609 = _633;
        if (!_623)
        {
            float _635 = -_327;
            float _637 = fma(_635, (*spvDescriptorSet0.vp_c3)._m0[16].w, _571);
            _591 = as_type<int>(_637);
        }
        int _639 = _591;
        _605 = as_type<float>(_639);
        if (_619)
        {
            float _641 = fma(_325, (*spvDescriptorSet0.vp_c3)._m0[16].w, _573);
            _593 = as_type<int>(_641);
        }
        int _643 = _593;
        float _645 = as_type<float>(_643);
        if (_623)
        {
            float _647 = fma(_327, (*spvDescriptorSet0.vp_c3)._m0[16].w, _565);
            _615 = as_type<int>(_647);
        }
        int _649 = _615;
        float _651 = as_type<float>(_649);
        if (_623)
        {
            _595 = _621;
        }
        float _653 = _595;
        float _655 = _653;
        if (!_619)
        {
            out.m_38.x = as_type<float>(_633);
        }
        if (_623)
        {
            _597 = _633;
        }
        int _657 = _597;
        int _659 = _657;
        if (!_623)
        {
            _655 = _621;
        }
        float _661 = _655;
        _601 = _661;
        if (!_623)
        {
            out.m_36.y = as_type<float>(_639);
        }
        if (!_623)
        {
            _659 = _633;
        }
        int _663 = _659;
        _603 = _663;
        if (_619)
        {
            out.m_36.x = as_type<float>(_643);
        }
        if (_623)
        {
            out.m_38.y = as_type<float>(_649);
        }
        if (!_619)
        {
            _645 = _573;
        }
        float _665 = _645;
        if (_623)
        {
            _599 = _665;
        }
        float _667 = _599;
        _607 = _667;
        if (!_623)
        {
            _651 = _565;
        }
        float _669 = _651;
        _617 = _669;
        if (!_623)
        {
            _607 = _665;
        }
    }
    float _671 = _617;
    float _673 = _601;
    int _675 = _603;
    float _677 = _605;
    float _679 = _607;
    int _681 = _609;
    float _683 = -_443;
    float _685 = fma(_152, _683, 1.0);
    float _687 = 1.0 / _685;
    float _689 = _687 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _691 = -_80;
    bool _693 = _689 > _691;
    int _695 = _681;
    int _697 = as_type<int>(_677);
    int _699 = as_type<int>(_689);
    float _701 = _673;
    int _703 = _675;
    float _705 = _679;
    float _707 = _673;
    int _709 = _675;
    float _711 = _677;
    float _713 = _679;
    int _715 = _681;
    if (!_693)
    {
        _509 = as_type<int>(_671);
    }
    int _717 = _509;
    bool _719 = !_693;
    int _721 = _717;
    float _723 = as_type<float>(_717);
    if (!_719)
    {
        bool _725 = _373 > 0.0;
        float _727 = _673 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _729 = _375 > 0.0;
        out.m_34.x = _727;
        if (_725)
        {
            _695 = _675;
        }
        int _731 = _695;
        int _733 = _731;
        if (!_725)
        {
            float _735 = -_373;
            float _737 = fma(_735, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_675));
            _733 = as_type<int>(_737);
        }
        int _739 = _733;
        _715 = _739;
        if (!_729)
        {
            float _741 = -_375;
            float _743 = fma(_741, (*spvDescriptorSet0.vp_c3)._m0[16].w, _677);
            _697 = as_type<int>(_743);
        }
        int _745 = _697;
        _711 = as_type<float>(_745);
        if (_725)
        {
            float _747 = fma(_373, (*spvDescriptorSet0.vp_c3)._m0[16].w, _679);
            _699 = as_type<int>(_747);
        }
        int _749 = _699;
        float _751 = as_type<float>(_749);
        if (_729)
        {
            float _753 = fma(_375, (*spvDescriptorSet0.vp_c3)._m0[16].w, _671);
            _721 = as_type<int>(_753);
        }
        int _755 = _721;
        float _757 = as_type<float>(_755);
        if (_729)
        {
            _701 = _727;
        }
        float _759 = _701;
        float _761 = _759;
        if (!_725)
        {
            out.m_38.x = as_type<float>(_739);
        }
        if (_729)
        {
            _703 = _739;
        }
        int _763 = _703;
        int _765 = _763;
        if (!_729)
        {
            _761 = _727;
        }
        float _767 = _761;
        _707 = _767;
        if (!_729)
        {
            out.m_36.y = as_type<float>(_745);
        }
        if (!_729)
        {
            _765 = _739;
        }
        int _769 = _765;
        _709 = _769;
        if (_725)
        {
            out.m_36.x = as_type<float>(_749);
        }
        if (_729)
        {
            out.m_38.y = as_type<float>(_755);
        }
        if (!_725)
        {
            _751 = _679;
        }
        float _771 = _751;
        if (_729)
        {
            _705 = _771;
        }
        float _773 = _705;
        _713 = _773;
        if (!_729)
        {
            _757 = _671;
        }
        float _775 = _757;
        _723 = _775;
        if (!_729)
        {
            _713 = _771;
        }
    }
    float _777 = _723;
    float _779 = _707;
    int _781 = _709;
    float _783 = _711;
    float _785 = _713;
    int _787 = _715;
    float _789 = -_465;
    float _791 = fma(_152, _789, 1.0);
    float _793 = 1.0 / _791;
    float _795 = _793 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _797 = -_80;
    bool _799 = _795 > _797;
    int _801 = _787;
    int _803 = as_type<int>(_783);
    int _805 = as_type<int>(_795);
    float _807 = _779;
    int _809 = _781;
    float _811 = _785;
    float _813 = _779;
    int _815 = _781;
    float _817 = _783;
    float _819 = _785;
    int _821 = as_type<int>(_777);
    if (!_799)
    {
        _511 = as_type<int>(_777);
    }
    int _823 = _511;
    bool _825 = !_799;
    int _827 = _823;
    float _829 = as_type<float>(_823);
    if (!_825)
    {
        bool _831 = _405 > 0.0;
        float _833 = _779 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _835 = _407 > 0.0;
        out.m_34.x = _833;
        if (_831)
        {
            _801 = _781;
        }
        int _837 = _801;
        int _839 = _837;
        if (!_831)
        {
            float _841 = -_405;
            float _843 = fma(_841, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_781));
            _839 = as_type<int>(_843);
        }
        int _845 = _839;
        if (!_835)
        {
            float _847 = -_407;
            float _849 = fma(_847, (*spvDescriptorSet0.vp_c3)._m0[16].w, _783);
            _803 = as_type<int>(_849);
        }
        int _851 = _803;
        _817 = as_type<float>(_851);
        if (_831)
        {
            float _853 = fma(_405, (*spvDescriptorSet0.vp_c3)._m0[16].w, _785);
            _805 = as_type<int>(_853);
        }
        int _855 = _805;
        float _857 = as_type<float>(_855);
        if (_835)
        {
            float _859 = fma(_407, (*spvDescriptorSet0.vp_c3)._m0[16].w, _777);
            _827 = as_type<int>(_859);
        }
        int _861 = _827;
        float _863 = as_type<float>(_861);
        if (_835)
        {
            _807 = _833;
        }
        float _865 = _807;
        float _867 = _865;
        if (!_831)
        {
            out.m_38.x = as_type<float>(_845);
        }
        if (_835)
        {
            _809 = _845;
        }
        int _869 = _809;
        int _871 = _869;
        if (!_835)
        {
            _867 = _833;
        }
        float _873 = _867;
        _813 = _873;
        if (!_835)
        {
            out.m_36.y = as_type<float>(_851);
        }
        if (!_835)
        {
            _871 = _845;
        }
        int _875 = _871;
        _815 = _875;
        if (_831)
        {
            out.m_36.x = as_type<float>(_855);
        }
        if (_835)
        {
            out.m_38.y = as_type<float>(_861);
        }
        if (!_831)
        {
            _857 = _785;
        }
        float _877 = _857;
        if (_835)
        {
            _811 = _877;
        }
        float _879 = _811;
        _819 = _879;
        if (!_835)
        {
            _863 = _777;
        }
        float _881 = _863;
        _829 = _881;
        if (!_835)
        {
            _819 = _877;
        }
    }
    float _883 = _829;
    float _885 = _813;
    int _887 = _815;
    float _889 = _817;
    float _891 = _819;
    float _893 = -_467;
    float _895 = fma(_152, _893, 1.0);
    float _897 = -_469;
    float _899 = fma(_152, _897, 1.0);
    float _901 = -_471;
    float _903 = fma(_152, _901, 1.0);
    float _905 = 1.0 / _895;
    float _907 = 1.0 / _899;
    float _909 = 1.0 / _903;
    float _911 = _905 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _913 = -_80;
    bool _915 = _911 > _913;
    float _917 = _907 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _919 = -_80;
    bool _921 = _917 > _919;
    float _923 = _909 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _925 = -_80;
    bool _927 = _923 > _925;
    int _929 = as_type<int>(_923);
    int _931 = as_type<int>(_889);
    int _933 = as_type<int>(_917);
    float _935 = _885;
    int _937 = _887;
    float _939 = _891;
    int _941 = as_type<int>(_889);
    float _943 = _885;
    int _945 = _887;
    float _947 = _891;
    int _949 = as_type<int>(_923);
    int _951 = as_type<int>(_917);
    int _953 = as_type<int>(_909);
    if (!_915)
    {
        _179 = as_type<int>(_883);
    }
    int _955 = _179;
    bool _957 = !_915;
    int _959 = _955;
    float _961 = as_type<float>(_955);
    if (!_957)
    {
        bool _963 = _413 > 0.0;
        float _965 = _885 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _967 = _411 > 0.0;
        out.m_34.x = _965;
        if (_963)
        {
            _929 = _887;
        }
        int _969 = _929;
        int _971 = _969;
        if (!_963)
        {
            float _973 = -_413;
            float _975 = fma(_973, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_887));
            _971 = as_type<int>(_975);
        }
        int _977 = _971;
        _949 = _977;
        if (!_967)
        {
            float _979 = -_411;
            float _981 = fma(_979, (*spvDescriptorSet0.vp_c3)._m0[16].w, _889);
            _931 = as_type<int>(_981);
        }
        int _983 = _931;
        _941 = _983;
        if (_963)
        {
            float _985 = fma(_413, (*spvDescriptorSet0.vp_c3)._m0[16].w, _891);
            _933 = as_type<int>(_985);
        }
        int _987 = _933;
        float _989 = as_type<float>(_987);
        if (_967)
        {
            float _991 = fma(_411, (*spvDescriptorSet0.vp_c3)._m0[16].w, _883);
            _959 = as_type<int>(_991);
        }
        int _993 = _959;
        float _995 = as_type<float>(_993);
        if (_967)
        {
            _935 = _965;
        }
        float _997 = _935;
        float _999 = _997;
        if (!_963)
        {
            out.m_38.x = as_type<float>(_977);
        }
        if (_967)
        {
            _937 = _977;
        }
        int _1001 = _937;
        int _1003 = _1001;
        if (!_967)
        {
            _999 = _965;
        }
        float _1005 = _999;
        _943 = _1005;
        if (!_967)
        {
            out.m_36.y = as_type<float>(_983);
        }
        if (!_967)
        {
            _1003 = _977;
        }
        int _1007 = _1003;
        _945 = _1007;
        if (_963)
        {
            out.m_36.x = as_type<float>(_987);
        }
        if (_967)
        {
            out.m_38.y = as_type<float>(_993);
        }
        if (!_963)
        {
            _989 = _891;
        }
        float _1009 = _989;
        _951 = as_type<int>(_1009);
        if (_967)
        {
            _939 = _1009;
        }
        float _1011 = _939;
        _947 = _1011;
        if (!_967)
        {
            _995 = _883;
        }
        float _1013 = _995;
        _961 = _1013;
        if (!_967)
        {
            _947 = _1009;
        }
    }
    int _1015 = _941;
    float _1017 = _961;
    float _1019 = _943;
    int _1021 = _945;
    float _1023 = _947;
    int _1025 = _949;
    int _1027 = _951;
    int _1029 = _1025;
    int _1031 = _1027;
    float _1033 = _1019;
    float _1035 = as_type<float>(_1021);
    float _1037 = _1023;
    float _1039 = _1019;
    float _1041 = _1023;
    float _1043 = as_type<float>(_1021);
    int _1045 = _1027;
    int _1047 = _1015;
    if (!_921)
    {
        _953 = _1015;
    }
    int _1049 = _953;
    int _1051 = _1049;
    float _1053 = as_type<float>(_1049);
    if (!_921)
    {
        _821 = as_type<int>(_1017);
    }
    int _1055 = _821;
    bool _1057 = !_921;
    int _1059 = _1055;
    float _1061 = as_type<float>(_1055);
    if (!_1057)
    {
        bool _1063 = _437 > 0.0;
        float _1065 = _1019 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _1067 = _445 > 0.0;
        out.m_34.x = _1065;
        if (_1063)
        {
            _1029 = _1021;
        }
        int _1069 = _1029;
        int _1071 = _1069;
        if (!_1063)
        {
            float _1073 = -_437;
            float _1075 = fma(_1073, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_1021));
            _1071 = as_type<int>(_1075);
        }
        int _1077 = _1071;
        if (_1067)
        {
            _1051 = _1015;
        }
        int _1079 = _1051;
        int _1081 = _1079;
        if (!_1067)
        {
            float _1083 = -_445;
            float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_1015));
            _1081 = as_type<int>(_1085);
        }
        int _1087 = _1081;
        _1053 = as_type<float>(_1087);
        if (_1063)
        {
            float _1089 = fma(_437, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1023);
            _1031 = as_type<int>(_1089);
        }
        int _1091 = _1031;
        float _1093 = as_type<float>(_1091);
        if (_1067)
        {
            float _1095 = fma(_445, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1017);
            _1059 = as_type<int>(_1095);
        }
        int _1097 = _1059;
        float _1099 = as_type<float>(_1097);
        if (!_1063)
        {
            out.m_38.x = as_type<float>(_1077);
        }
        if (_1067)
        {
            _1033 = _1065;
        }
        float _1101 = _1033;
        float _1103 = _1101;
        if (_1067)
        {
            _1035 = as_type<float>(_1077);
        }
        float _1105 = _1035;
        float _1107 = _1105;
        if (!_1067)
        {
            out.m_36.y = as_type<float>(_1087);
        }
        if (!_1067)
        {
            _1103 = _1065;
        }
        float _1109 = _1103;
        _1039 = _1109;
        if (!_1067)
        {
            _1107 = as_type<float>(_1077);
        }
        float _1111 = _1107;
        _1043 = _1111;
        if (_1063)
        {
            out.m_36.x = as_type<float>(_1091);
        }
        if (_1067)
        {
            out.m_38.y = as_type<float>(_1097);
        }
        if (!_1063)
        {
            _1093 = _1023;
        }
        float _1113 = _1093;
        _1045 = as_type<int>(_1113);
        if (_1067)
        {
            _1037 = _1113;
        }
        float _1115 = _1037;
        _1041 = _1115;
        if (!_1067)
        {
            _1099 = _1017;
        }
        float _1117 = _1099;
        _1061 = _1117;
        if (!_1067)
        {
            _1041 = _1113;
        }
    }
    float _1119 = _1039;
    float _1121 = _1041;
    float _1123 = _1043;
    float _1125 = _1061;
    int _1127 = _1045;
    float _1129 = _1053;
    int _1131 = _1127;
    if (!_927)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _1133 = _447 > 0.0;
    float _1135 = _1119 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    bool _1137 = _449 > 0.0;
    out.m_34.x = _1135;
    if (_1133)
    {
        float _1139 = fma(_447, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1121);
        _1131 = as_type<int>(_1139);
    }
    int _1141 = _1131;
    if (!_1133)
    {
        float _1143 = -_447;
        float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1123);
        _513 = as_type<int>(_1145);
    }
    int _1147 = _513;
    if (_1137)
    {
        float _1149 = fma(_449, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1125);
        _1047 = as_type<int>(_1149);
    }
    int _1151 = _1047;
    if (_1133)
    {
        out.m_36.x = as_type<float>(_1141);
    }
    if (!_1133)
    {
        out.m_38.x = as_type<float>(_1147);
    }
    if (_1137)
    {
        out.m_38.y = as_type<float>(_1151);
    }
    if (_1137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1153 = -_449;
    float _1155 = fma(_1153, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1129);
    out.m_36.y = _1155;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

