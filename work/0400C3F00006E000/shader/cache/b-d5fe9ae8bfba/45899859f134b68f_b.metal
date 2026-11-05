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
    float4 m_36 [[user(locn0)]];
    float4 m_40 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_34 [[user(locn3)]];
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
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    bool _193 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_27.x;
    float _56 = in.m_29.x;
    float _58 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _60 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _62 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _64 = in.m_31.x;
    float _66 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[8].x, _58);
    float _68 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[7].x, _60);
    float _70 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[9].x, _62);
    float _72 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[8].z, _66);
    float _74 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[7].z, _68);
    float _76 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[9].z, _70);
    float _78 = _72 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _80 = _74 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _82 = _76 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _84 = _78 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _86 = abs(_54);
    float _88 = log2(_86);
    float _90 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[13].x, _84);
    float _92 = _78 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _94 = _78 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _96 = _56 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _98 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[13].z, _90);
    float _100 = -_96;
    float _102 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[15].z, _100);
    float _104 = _98 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _106 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[10].x, _92);
    float _108 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[11].x, _94);
    float _110 = _56 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _112 = 1.0 / _104;
    float _114 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[10].z, _106);
    float _116 = _88 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _118 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[11].z, _108);
    float _120 = _114 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _122 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[15].y, _110);
    float _124 = _118 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _126 = exp2(_116);
    float _128 = _120 * _112;
    float _130 = _124 * _112;
    float _132 = fma(_128, 0.5, 0.5);
    float _134 = fma(_130, -0.5, 0.5);
    float _136 = _126 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _138 = _102 * _136;
    float _140 = _122 * _136;
    float _142 = _132 + _138;
    float _144 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float2 _1596 = float2(_142, _144);
    float _146 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1596, float2(0.0), isnan(_1596)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1596, float2(0.0), isnan(_1596)), level(0.0)).x;
    out.m_34.x = 0.0;
    float _148 = (*spvDescriptorSet0.vp_c3)._m0[14].x + (*spvDescriptorSet0.vp_c3)._m0[14].y;
    out.m_36.x = 0.0;
    float _150 = 1.0 / _148;
    out.gl_Position.z = 1.0;
    out.m_38.x = 0.0;
    out.m_40.x = 0.0;
    float _152 = -_150;
    float _154 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[14].x, 1.0);
    float _156 = -_146;
    float _158 = fma(_156, _154, 1.0);
    float _160 = 1.0 / _158;
    float _162 = _160 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _164 = -_82;
    bool _168 = _162 > _164;
    int _171 = 1065353216;
    int _173 = as_type<int>(_146);
    float _175 = _160;
    int _177 = as_type<int>(_82);
    int _179 = as_type<int>(_82);
    float _181;
    float _183;
    int _185;
    float _187;
    float _189;
    float _191;
    if (!_168)
    {
        _181 = 0.0;
        _183 = 0.0;
        _185 = 0;
        _187 = 0.0;
        _189 = 0.0;
        _191 = 0.0;
        _193 = true;
    }
    else
    {
        bool _195 = _138 > 0.0;
        float _197 = _138 * (*spvDescriptorSet0.vp_c3)._m0[16].w;
        bool _199 = _140 > 0.0;
        float _201 = _140 * (*spvDescriptorSet0.vp_c3)._m0[16].w;
        bool _203 = _54 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _205 = isnan(_54);
        bool _207 = _203 || _205;
        bool _209 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _211 = _207 || _209;
        out.m_34.x = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _181 = _201;
        if (_195)
        {
            _171 = 0;
        }
        int _213 = _171;
        int _215 = _213;
        if (!_195)
        {
            float _217 = -_197;
            float _219 = (-0.0) + _217;
            _215 = as_type<int>(_219);
        }
        int _221 = _215;
        if (_199)
        {
            _173 = 0;
        }
        int _223 = _173;
        int _225 = _223;
        if (!_199)
        {
            float _227 = -_201;
            float _229 = (-0.0) + _227;
            _225 = as_type<int>(_229);
        }
        int _231 = _225;
        int _233 = 0;
        _191 = as_type<float>(_231);
        if (!_211)
        {
            _233 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[16].z);
        }
        int _235 = _233;
        if (_195)
        {
            out.m_38.x = _197;
        }
        if (_195)
        {
            _175 = _197;
        }
        float _237 = _175;
        int _239 = 0;
        float _241 = _237;
        if (_211)
        {
            _239 = 0;
        }
        int _243 = _239;
        int _245 = _243;
        if (!_211)
        {
            out.m_36.x = as_type<float>(_235);
        }
        float _247 = 0.0;
        if (_199)
        {
            _247 = as_type<float>(_221);
        }
        float _249 = _247;
        float _251 = _249;
        if (!_195)
        {
            out.m_40.x = as_type<float>(_221);
        }
        if (!_195)
        {
            _241 = 0.0;
        }
        float _253 = _241;
        _189 = _253;
        if (!_211)
        {
            _245 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[16].z);
        }
        int _255 = _245;
        _185 = _255;
        if (!_199)
        {
            out.m_38.y = as_type<float>(_231);
        }
        if (!_199)
        {
            _251 = as_type<float>(_221);
        }
        float _257 = _251;
        _187 = _257;
        _183 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        if (_199)
        {
            out.m_40.y = _201;
        }
        if (!_199)
        {
            _181 = 0.0;
        }
    }
    _193 = false;
    float _259 = _181;
    float _261 = _183;
    int _263 = _185;
    float _265 = _187;
    float _267 = _189;
    float _269 = _191;
    float _271 = _54 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    float _273 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 2.0, _54);
    float _275 = abs(_271);
    float _277 = log2(_275);
    float _279 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 3.0, _54);
    float _281 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 4.0, _54);
    float _283 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 5.0, _54);
    float _285 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 6.0, _54);
    float _287 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 7.0, _54);
    float _289 = abs(_273);
    float _291 = log2(_289);
    float _293 = abs(_279);
    float _295 = log2(_293);
    float _297 = _277 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _299 = _122 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _301 = -_299;
    float _303 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[15].z, _301);
    float _305 = abs(_283);
    float _307 = log2(_305);
    float _309 = _291 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _311 = _122 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _313 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[15].y, _311);
    float _315 = abs(_281);
    float _317 = log2(_315);
    float _319 = _295 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _321 = _313 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _323 = _313 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _325 = fma(_303, (*spvDescriptorSet0.vp_c3)._m0[15].y, _321);
    float _327 = -_323;
    float _329 = fma(_303, (*spvDescriptorSet0.vp_c3)._m0[15].z, _327);
    float _331 = abs(_285);
    float _333 = log2(_331);
    float _335 = _307 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _337 = _325 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _339 = exp2(_297);
    float _341 = _317 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _343 = _325 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _345 = exp2(_309);
    float _347 = _333 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _349 = fma(_329, (*spvDescriptorSet0.vp_c3)._m0[15].y, _337);
    float _351 = -_343;
    float _353 = fma(_329, (*spvDescriptorSet0.vp_c3)._m0[15].z, _351);
    float _355 = exp2(_319);
    float _357 = _339 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _359 = _303 * _357;
    float _361 = _313 * _357;
    float _363 = _349 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _365 = abs(_287);
    float _367 = log2(_365);
    float _369 = _345 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _371 = fma(_361, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float _373 = fma(_353, (*spvDescriptorSet0.vp_c3)._m0[15].y, _363);
    float _375 = _329 * _369;
    float _377 = _325 * _369;
    float _379 = _349 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _381 = exp2(_341);
    float _383 = _355 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _385 = _373 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _387 = -_379;
    float _389 = fma(_353, (*spvDescriptorSet0.vp_c3)._m0[15].z, _387);
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float _393 = _353 * _383;
    float _395 = _349 * _383;
    float _397 = fma(_389, (*spvDescriptorSet0.vp_c3)._m0[15].y, _385);
    float _399 = _367 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _401 = _373 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _403 = exp2(_335);
    float _405 = _397 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _407 = _397 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _409 = -_401;
    float _411 = fma(_389, (*spvDescriptorSet0.vp_c3)._m0[15].z, _409);
    float _413 = _132 + _393;
    float _415 = _381 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _417 = fma(_411, (*spvDescriptorSet0.vp_c3)._m0[15].y, _405);
    float _419 = exp2(_399);
    float _421 = -_407;
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c3)._m0[15].z, _421);
    float _425 = _389 * _415;
    float _427 = _417 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _429 = _373 * _415;
    float _431 = _417 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _433 = _132 + _425;
    float _435 = -_427;
    float _437 = fma(_423, (*spvDescriptorSet0.vp_c3)._m0[15].z, _435);
    float _439 = exp2(_347);
    float _441 = _403 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _443 = fma(_423, (*spvDescriptorSet0.vp_c3)._m0[15].y, _431);
    float _445 = _411 * _441;
    float _447 = _397 * _441;
    float _449 = fma(_395, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float _451 = _419 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _453 = _132 + _445;
    float _455 = fma(_429, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float _457 = fma(_447, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float _459 = _437 * _451;
    float _461 = _132 + _359;
    float _463 = _443 * _451;
    float _465 = _132 + _375;
    float _467 = _439 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float2 _2161 = float2(_461, _371);
    float _469 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2161, float2(0.0), isnan(_2161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2161, float2(0.0), isnan(_2161)), level(0.0)).x;
    float _471 = _132 + _459;
    float _473 = _423 * _467;
    float _475 = _417 * _467;
    float2 _2178 = float2(_465, _391);
    float _477 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2178, float2(0.0), isnan(_2178)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2178, float2(0.0), isnan(_2178)), level(0.0)).x;
    float2 _2186 = float2(_413, _449);
    float _479 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2186, float2(0.0), isnan(_2186)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2186, float2(0.0), isnan(_2186)), level(0.0)).x;
    float2 _2194 = float2(_433, _455);
    float _481 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2194, float2(0.0), isnan(_2194)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2194, float2(0.0), isnan(_2194)), level(0.0)).x;
    float2 _2202 = float2(_453, _457);
    float _483 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2202, float2(0.0), isnan(_2202)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2202, float2(0.0), isnan(_2202)), level(0.0)).x;
    float _485 = _132 + _473;
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float _489 = fma(_463, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float2 _2223 = float2(_485, _487);
    float _491 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2223, float2(0.0), isnan(_2223)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2223, float2(0.0), isnan(_2223)), level(0.0)).x;
    float2 _2231 = float2(_471, _489);
    float _493 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2231, float2(0.0), isnan(_2231)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2231, float2(0.0), isnan(_2231)), level(0.0)).x;
    float _495 = -_469;
    float _497 = fma(_154, _495, 1.0);
    float _499 = 1.0 / _497;
    float _501 = _499 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _503 = -_82;
    bool _505 = _501 > _503;
    int _507 = as_type<int>(_501);
    int _509 = as_type<int>(_499);
    int _511 = as_type<int>(_265);
    int _513 = as_type<int>(_359);
    int _515 = as_type<int>(_269);
    float _517 = _261;
    int _519 = _263;
    float _521 = _267;
    float _523 = _261;
    int _525 = as_type<int>(_265);
    int _527 = _263;
    float _529 = _269;
    float _531 = _267;
    int _533 = as_type<int>(_259);
    int _535 = as_type<int>(_273);
    int _537 = as_type<int>(_375);
    int _539 = as_type<int>(_273);
    int _541 = as_type<int>(_279);
    int _543 = as_type<int>(_393);
    int _545 = as_type<int>(_279);
    int _547 = as_type<int>(_425);
    int _549 = as_type<int>(_445);
    int _551 = as_type<int>(_473);
    int _553 = as_type<int>(_459);
    if (!_505)
    {
        _507 = as_type<int>(_259);
    }
    int _555 = _507;
    bool _557 = !_505;
    int _559 = _555;
    float _561 = as_type<float>(_555);
    if (!_557)
    {
        bool _563 = _271 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _565 = isnan(_271);
        bool _567 = _563 || _565;
        bool _569 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _571 = _567 || _569;
        float _573 = _261 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _575 = _359 > 0.0;
        bool _577 = _361 > 0.0;
        out.m_34.x = _573;
        if (_571)
        {
            _509 = _263;
        }
        int _579 = _509;
        int _581 = _579;
        if (!_571)
        {
            float _583 = as_type<float>(_263) + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _581 = as_type<int>(_583);
        }
        int _585 = _581;
        if (!_575)
        {
            float _587 = -_359;
            float _589 = fma(_587, (*spvDescriptorSet0.vp_c3)._m0[16].w, _265);
            _511 = as_type<int>(_589);
        }
        int _591 = _511;
        _525 = _591;
        if (_575)
        {
            float _593 = fma(_359, (*spvDescriptorSet0.vp_c3)._m0[16].w, _267);
            _513 = as_type<int>(_593);
        }
        int _595 = _513;
        float _597 = as_type<float>(_595);
        if (!_577)
        {
            float _599 = -_361;
            float _601 = fma(_599, (*spvDescriptorSet0.vp_c3)._m0[16].w, _269);
            _515 = as_type<int>(_601);
        }
        int _603 = _515;
        _529 = as_type<float>(_603);
        if (_577)
        {
            float _605 = fma(_361, (*spvDescriptorSet0.vp_c3)._m0[16].w, _259);
            _559 = as_type<int>(_605);
        }
        int _607 = _559;
        float _609 = as_type<float>(_607);
        if (!_571)
        {
            out.m_36.x = as_type<float>(_585);
        }
        if (_577)
        {
            _517 = _573;
        }
        float _611 = _517;
        float _613 = _611;
        if (_577)
        {
            _519 = _585;
        }
        int _615 = _519;
        int _617 = _615;
        if (!_575)
        {
            out.m_40.x = as_type<float>(_591);
        }
        if (!_577)
        {
            _613 = _573;
        }
        float _619 = _613;
        _523 = _619;
        if (!_577)
        {
            _617 = _585;
        }
        int _621 = _617;
        _527 = _621;
        if (!_577)
        {
            out.m_38.y = as_type<float>(_603);
        }
        if (_575)
        {
            out.m_38.x = as_type<float>(_595);
        }
        if (_577)
        {
            out.m_40.y = as_type<float>(_607);
        }
        if (!_575)
        {
            _597 = _267;
        }
        float _623 = _597;
        if (_577)
        {
            _521 = _623;
        }
        float _625 = _521;
        _531 = _625;
        if (!_577)
        {
            _609 = _259;
        }
        float _627 = _609;
        _561 = _627;
        if (!_577)
        {
            _531 = _623;
        }
    }
    float _629 = _561;
    float _631 = _523;
    int _633 = _525;
    int _635 = _527;
    float _637 = _529;
    float _639 = _531;
    float _641 = -_477;
    float _643 = fma(_154, _641, 1.0);
    float _645 = 1.0 / _643;
    float _647 = _645 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _649 = -_82;
    bool _651 = _647 > _649;
    int _653 = as_type<int>(_647);
    int _655 = as_type<int>(_637);
    float _657 = _631;
    int _659 = _633;
    int _661 = _635;
    float _663 = _639;
    float _665 = _631;
    int _667 = _633;
    int _669 = _635;
    float _671 = _637;
    float _673 = _639;
    if (!_651)
    {
        _533 = as_type<int>(_629);
    }
    int _675 = _533;
    bool _677 = !_651;
    int _679 = _675;
    float _681 = as_type<float>(_675);
    if (!_677)
    {
        bool _683 = _375 > 0.0;
        float _685 = _631 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _687 = _273 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _689 = isnan(_273);
        bool _691 = _687 || _689;
        bool _693 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _695 = _691 || _693;
        bool _697 = _377 > 0.0;
        out.m_34.x = _685;
        if (_683)
        {
            _535 = _633;
        }
        int _699 = _535;
        int _701 = _699;
        if (!_683)
        {
            float _703 = -_375;
            float _705 = fma(_703, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_633));
            _701 = as_type<int>(_705);
        }
        int _707 = _701;
        _539 = _707;
        if (_695)
        {
            _653 = _635;
        }
        int _709 = _653;
        int _711 = _709;
        if (!_695)
        {
            float _713 = as_type<float>(_635) + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _711 = as_type<int>(_713);
        }
        int _715 = _711;
        if (!_697)
        {
            float _717 = -_377;
            float _719 = fma(_717, (*spvDescriptorSet0.vp_c3)._m0[16].w, _637);
            _655 = as_type<int>(_719);
        }
        int _721 = _655;
        _671 = as_type<float>(_721);
        if (_683)
        {
            float _723 = fma(_375, (*spvDescriptorSet0.vp_c3)._m0[16].w, _639);
            _537 = as_type<int>(_723);
        }
        int _725 = _537;
        float _727 = as_type<float>(_725);
        if (!_683)
        {
            out.m_40.x = as_type<float>(_707);
        }
        if (_697)
        {
            float _729 = fma(_377, (*spvDescriptorSet0.vp_c3)._m0[16].w, _629);
            _679 = as_type<int>(_729);
        }
        int _731 = _679;
        float _733 = as_type<float>(_731);
        if (_697)
        {
            _657 = _685;
        }
        float _735 = _657;
        float _737 = _735;
        if (!_697)
        {
            out.m_38.y = as_type<float>(_721);
        }
        if (_697)
        {
            _659 = _707;
        }
        int _739 = _659;
        int _741 = _739;
        if (_697)
        {
            _661 = _715;
        }
        int _743 = _661;
        int _745 = _743;
        if (!_695)
        {
            out.m_36.x = as_type<float>(_715);
        }
        if (!_697)
        {
            _737 = _685;
        }
        float _747 = _737;
        _665 = _747;
        if (!_697)
        {
            _741 = _707;
        }
        int _749 = _741;
        _667 = _749;
        if (_683)
        {
            out.m_38.x = as_type<float>(_725);
        }
        if (!_697)
        {
            _745 = _715;
        }
        int _751 = _745;
        _669 = _751;
        if (_697)
        {
            out.m_40.y = as_type<float>(_731);
        }
        if (!_683)
        {
            _727 = _639;
        }
        float _753 = _727;
        if (_697)
        {
            _663 = _753;
        }
        float _755 = _663;
        _673 = _755;
        if (!_697)
        {
            _733 = _629;
        }
        float _757 = _733;
        _681 = _757;
        if (!_697)
        {
            _673 = _753;
        }
    }
    float _759 = _681;
    float _761 = _665;
    int _763 = _667;
    int _765 = _669;
    float _767 = _671;
    float _769 = _673;
    int _771 = _539;
    float _773 = -_479;
    float _775 = fma(_154, _773, 1.0);
    float _777 = 1.0 / _775;
    float _779 = _777 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _781 = -_82;
    bool _783 = _779 > _781;
    int _785 = _771;
    int _787 = as_type<int>(_779);
    int _789 = as_type<int>(_767);
    float _791 = _761;
    int _793 = _763;
    int _795 = _765;
    float _797 = _769;
    float _799 = _761;
    int _801 = _763;
    int _803 = _765;
    float _805 = _767;
    float _807 = _769;
    int _809 = as_type<int>(_759);
    if (!_783)
    {
        _785 = as_type<int>(_759);
    }
    int _811 = _785;
    bool _813 = !_783;
    int _815 = _811;
    float _817 = as_type<float>(_811);
    if (!_813)
    {
        bool _819 = _393 > 0.0;
        float _821 = _761 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _823 = _279 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _825 = isnan(_279);
        bool _827 = _823 || _825;
        bool _829 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _831 = _827 || _829;
        bool _833 = _395 > 0.0;
        out.m_34.x = _821;
        if (_819)
        {
            _541 = _763;
        }
        int _835 = _541;
        int _837 = _835;
        if (!_819)
        {
            float _839 = -_393;
            float _841 = fma(_839, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_763));
            _837 = as_type<int>(_841);
        }
        int _843 = _837;
        _545 = _843;
        if (_831)
        {
            _787 = _765;
        }
        int _845 = _787;
        int _847 = _845;
        if (!_831)
        {
            float _849 = as_type<float>(_765) + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _847 = as_type<int>(_849);
        }
        int _851 = _847;
        if (!_833)
        {
            float _853 = -_395;
            float _855 = fma(_853, (*spvDescriptorSet0.vp_c3)._m0[16].w, _767);
            _789 = as_type<int>(_855);
        }
        int _857 = _789;
        _805 = as_type<float>(_857);
        if (_819)
        {
            float _859 = fma(_393, (*spvDescriptorSet0.vp_c3)._m0[16].w, _769);
            _543 = as_type<int>(_859);
        }
        int _861 = _543;
        float _863 = as_type<float>(_861);
        if (!_819)
        {
            out.m_40.x = as_type<float>(_843);
        }
        if (_833)
        {
            float _865 = fma(_395, (*spvDescriptorSet0.vp_c3)._m0[16].w, _759);
            _815 = as_type<int>(_865);
        }
        int _867 = _815;
        float _869 = as_type<float>(_867);
        if (_833)
        {
            _791 = _821;
        }
        float _871 = _791;
        float _873 = _871;
        if (!_833)
        {
            out.m_38.y = as_type<float>(_857);
        }
        if (_833)
        {
            _793 = _843;
        }
        int _875 = _793;
        int _877 = _875;
        if (_833)
        {
            _795 = _851;
        }
        int _879 = _795;
        int _881 = _879;
        if (!_831)
        {
            out.m_36.x = as_type<float>(_851);
        }
        if (!_833)
        {
            _873 = _821;
        }
        float _883 = _873;
        _799 = _883;
        if (!_833)
        {
            _877 = _843;
        }
        int _885 = _877;
        _801 = _885;
        if (_819)
        {
            out.m_38.x = as_type<float>(_861);
        }
        if (!_833)
        {
            _881 = _851;
        }
        int _887 = _881;
        _803 = _887;
        if (_833)
        {
            out.m_40.y = as_type<float>(_867);
        }
        if (!_819)
        {
            _863 = _769;
        }
        float _889 = _863;
        if (_833)
        {
            _797 = _889;
        }
        float _891 = _797;
        _807 = _891;
        if (!_833)
        {
            _869 = _759;
        }
        float _893 = _869;
        _817 = _893;
        if (!_833)
        {
            _807 = _889;
        }
    }
    float _895 = _817;
    float _897 = _799;
    int _899 = _801;
    int _901 = _803;
    float _903 = _805;
    float _905 = _807;
    int _907 = _545;
    float _909 = -_481;
    float _911 = fma(_154, _909, 1.0);
    float _913 = 1.0 / _911;
    float _915 = _913 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _917 = -_82;
    bool _919 = _915 > _917;
    int _921 = _907;
    int _923 = as_type<int>(_915);
    int _925 = as_type<int>(_903);
    float _927 = _897;
    int _929 = _899;
    int _931 = _901;
    float _933 = _905;
    float _935 = _897;
    int _937 = _899;
    int _939 = _901;
    float _941 = _903;
    float _943 = _905;
    int _945 = as_type<int>(_895);
    if (!_919)
    {
        _809 = as_type<int>(_895);
    }
    int _947 = _809;
    bool _949 = !_919;
    int _951 = _947;
    float _953 = as_type<float>(_947);
    if (!_949)
    {
        bool _955 = _425 > 0.0;
        bool _957 = _281 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _959 = isnan(_281);
        bool _961 = _957 || _959;
        bool _963 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _965 = _961 || _963;
        float _967 = _897 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _969 = _429 > 0.0;
        out.m_34.x = _967;
        if (_955)
        {
            _921 = _899;
        }
        int _971 = _921;
        int _973 = _971;
        if (!_955)
        {
            float _975 = -_425;
            float _977 = fma(_975, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_899));
            _973 = as_type<int>(_977);
        }
        int _979 = _973;
        if (_965)
        {
            _923 = _901;
        }
        int _981 = _923;
        int _983 = _981;
        if (!_965)
        {
            float _985 = as_type<float>(_901) + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _983 = as_type<int>(_985);
        }
        int _987 = _983;
        if (!_969)
        {
            float _989 = -_429;
            float _991 = fma(_989, (*spvDescriptorSet0.vp_c3)._m0[16].w, _903);
            _925 = as_type<int>(_991);
        }
        int _993 = _925;
        _941 = as_type<float>(_993);
        if (_955)
        {
            float _995 = fma(_425, (*spvDescriptorSet0.vp_c3)._m0[16].w, _905);
            _547 = as_type<int>(_995);
        }
        int _997 = _547;
        float _999 = as_type<float>(_997);
        if (!_955)
        {
            out.m_40.x = as_type<float>(_979);
        }
        if (_969)
        {
            float _1001 = fma(_429, (*spvDescriptorSet0.vp_c3)._m0[16].w, _895);
            _951 = as_type<int>(_1001);
        }
        int _1003 = _951;
        float _1005 = as_type<float>(_1003);
        if (_969)
        {
            _927 = _967;
        }
        float _1007 = _927;
        float _1009 = _1007;
        if (!_969)
        {
            out.m_38.y = as_type<float>(_993);
        }
        if (_969)
        {
            _929 = _979;
        }
        int _1011 = _929;
        int _1013 = _1011;
        if (_969)
        {
            _931 = _987;
        }
        int _1015 = _931;
        int _1017 = _1015;
        if (!_965)
        {
            out.m_36.x = as_type<float>(_987);
        }
        if (!_969)
        {
            _1009 = _967;
        }
        float _1019 = _1009;
        _935 = _1019;
        if (!_969)
        {
            _1013 = _979;
        }
        int _1021 = _1013;
        _937 = _1021;
        if (_955)
        {
            out.m_38.x = as_type<float>(_997);
        }
        if (!_969)
        {
            _1017 = _987;
        }
        int _1023 = _1017;
        _939 = _1023;
        if (_969)
        {
            out.m_40.y = as_type<float>(_1003);
        }
        if (!_955)
        {
            _999 = _905;
        }
        float _1025 = _999;
        if (_969)
        {
            _933 = _1025;
        }
        float _1027 = _933;
        _943 = _1027;
        if (!_969)
        {
            _1005 = _895;
        }
        float _1029 = _1005;
        _953 = _1029;
        if (!_969)
        {
            _943 = _1025;
        }
    }
    float _1031 = _953;
    float _1033 = _935;
    int _1035 = _937;
    int _1037 = _939;
    float _1039 = _941;
    float _1041 = _943;
    float _1043 = -_483;
    float _1045 = fma(_154, _1043, 1.0);
    float _1047 = -_491;
    float _1049 = fma(_154, _1047, 1.0);
    float _1051 = -_493;
    float _1053 = fma(_154, _1051, 1.0);
    float _1055 = 1.0 / _1045;
    float _1057 = 1.0 / _1049;
    float _1059 = 1.0 / _1053;
    float _1061 = _1055 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _1063 = -_82;
    bool _1065 = _1061 > _1063;
    float _1067 = _1057 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _1069 = -_82;
    bool _1071 = _1067 > _1069;
    float _1073 = _1059 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    int _1075 = as_type<int>(_1067);
    int _1077 = as_type<int>(_1073);
    int _1079 = as_type<int>(_1039);
    float _1081 = _1033;
    int _1083 = _1035;
    int _1085 = _1037;
    float _1087 = _1041;
    int _1089 = as_type<int>(_1039);
    float _1091 = _1033;
    int _1093 = _1035;
    int _1095 = _1037;
    float _1097 = _1041;
    int _1099 = as_type<int>(_1073);
    int _1101 = as_type<int>(_1031);
    if (!_1065)
    {
        _1075 = as_type<int>(_1031);
    }
    int _1103 = _1075;
    float _1105 = -_82;
    bool _1107 = _1073 > _1105;
    bool _1109 = !_1065;
    int _1111 = _1103;
    float _1113 = as_type<float>(_1103);
    if (!_1109)
    {
        bool _1115 = _445 > 0.0;
        float _1117 = _1033 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _1119 = _283 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _1121 = isnan(_283);
        bool _1123 = _1119 || _1121;
        bool _1125 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _1127 = _1123 || _1125;
        bool _1129 = _447 > 0.0;
        out.m_34.x = _1117;
        _945 = as_type<int>(_1117);
        if (_1115)
        {
            _1077 = _1035;
        }
        int _1131 = _1077;
        int _1133 = _1131;
        if (!_1115)
        {
            float _1135 = -_445;
            float _1137 = fma(_1135, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_1035));
            _1133 = as_type<int>(_1137);
        }
        int _1139 = _1133;
        _1099 = _1139;
        if (_1127)
        {
            _177 = _1037;
        }
        int _1141 = _177;
        int _1143 = _1141;
        if (!_1127)
        {
            float _1145 = as_type<float>(_1037) + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _1143 = as_type<int>(_1145);
        }
        int _1147 = _1143;
        _179 = _1147;
        if (!_1129)
        {
            float _1149 = -_447;
            float _1151 = fma(_1149, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1039);
            _1079 = as_type<int>(_1151);
        }
        int _1153 = _1079;
        _1089 = _1153;
        if (_1115)
        {
            float _1155 = fma(_445, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1041);
            _549 = as_type<int>(_1155);
        }
        int _1157 = _549;
        float _1159 = as_type<float>(_1157);
        if (!_1115)
        {
            out.m_40.x = as_type<float>(_1139);
        }
        if (_1129)
        {
            float _1161 = fma(_447, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1031);
            _1111 = as_type<int>(_1161);
        }
        int _1163 = _1111;
        float _1165 = as_type<float>(_1163);
        if (_1129)
        {
            _1081 = _1117;
        }
        float _1167 = _1081;
        float _1169 = _1167;
        if (!_1129)
        {
            out.m_38.y = as_type<float>(_1153);
        }
        if (_1129)
        {
            _1083 = _1139;
        }
        int _1171 = _1083;
        int _1173 = _1171;
        if (_1129)
        {
            _1085 = _1147;
        }
        int _1175 = _1085;
        int _1177 = _1175;
        if (!_1127)
        {
            out.m_36.x = as_type<float>(_1147);
        }
        if (!_1129)
        {
            _1169 = _1117;
        }
        float _1179 = _1169;
        _1091 = _1179;
        if (!_1129)
        {
            _1173 = _1139;
        }
        int _1181 = _1173;
        _1093 = _1181;
        if (_1115)
        {
            out.m_38.x = as_type<float>(_1157);
        }
        if (!_1129)
        {
            _1177 = _1147;
        }
        int _1183 = _1177;
        _1095 = _1183;
        if (_1129)
        {
            out.m_40.y = as_type<float>(_1163);
        }
        if (!_1115)
        {
            _1159 = _1041;
        }
        float _1185 = _1159;
        if (_1129)
        {
            _1087 = _1185;
        }
        float _1187 = _1087;
        _1097 = _1187;
        if (!_1129)
        {
            _1165 = _1031;
        }
        float _1189 = _1165;
        _1113 = _1189;
        if (!_1129)
        {
            _1097 = _1185;
        }
    }
    int _1191 = _1089;
    float _1193 = _1113;
    float _1195 = _1091;
    int _1197 = _1093;
    int _1199 = _1095;
    int _1201 = _945;
    float _1203 = _1097;
    int _1205 = _179;
    int _1207 = _1099;
    int _1209 = _1207;
    int _1211 = _1201;
    int _1213 = _1205;
    float _1215 = _1195;
    float _1217 = as_type<float>(_1197);
    float _1219 = as_type<float>(_1199);
    float _1221 = _1203;
    float _1223 = _1195;
    float _1225 = _1203;
    float _1227 = as_type<float>(_1197);
    float _1229 = as_type<float>(_1199);
    int _1231 = _1191;
    int _1233 = as_type<int>(_1193);
    if (!_1071)
    {
        _1101 = _1191;
    }
    int _1235 = _1101;
    int _1237 = _1235;
    float _1239 = as_type<float>(_1235);
    if (!_1071)
    {
        _1209 = as_type<int>(_1193);
    }
    int _1241 = _1209;
    bool _1243 = !_1071;
    int _1245 = _1241;
    float _1247 = as_type<float>(_1241);
    if (!_1243)
    {
        bool _1249 = _473 > 0.0;
        float _1251 = _1195 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _1253 = _475 > 0.0;
        bool _1255 = _285 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _1257 = isnan(_285);
        bool _1259 = _1255 || _1257;
        bool _1261 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _1263 = _1259 || _1261;
        out.m_34.x = _1251;
        if (_1249)
        {
            _1211 = _1197;
        }
        int _1265 = _1211;
        int _1267 = _1265;
        if (!_1249)
        {
            float _1269 = -_473;
            float _1271 = fma(_1269, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_1197));
            _1267 = as_type<int>(_1271);
        }
        int _1273 = _1267;
        if (_1253)
        {
            _1237 = _1191;
        }
        int _1275 = _1237;
        int _1277 = _1275;
        if (!_1253)
        {
            float _1279 = -_475;
            float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_1191));
            _1277 = as_type<int>(_1281);
        }
        int _1283 = _1277;
        _1239 = as_type<float>(_1283);
        if (_1263)
        {
            _1213 = _1199;
        }
        int _1285 = _1213;
        int _1287 = _1285;
        if (!_1263)
        {
            float _1289 = as_type<float>(_1199) + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _1287 = as_type<int>(_1289);
        }
        int _1291 = _1287;
        if (!_1249)
        {
            out.m_40.x = as_type<float>(_1273);
        }
        if (_1249)
        {
            float _1293 = fma(_473, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1203);
            _551 = as_type<int>(_1293);
        }
        int _1295 = _551;
        float _1297 = as_type<float>(_1295);
        if (_1253)
        {
            float _1299 = fma(_475, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1193);
            _1245 = as_type<int>(_1299);
        }
        int _1301 = _1245;
        float _1303 = as_type<float>(_1301);
        if (_1253)
        {
            _1215 = _1251;
        }
        float _1305 = _1215;
        float _1307 = _1305;
        if (!_1253)
        {
            out.m_38.y = as_type<float>(_1283);
        }
        if (_1253)
        {
            _1217 = as_type<float>(_1273);
        }
        float _1309 = _1217;
        float _1311 = _1309;
        if (_1253)
        {
            _1219 = as_type<float>(_1291);
        }
        float _1313 = _1219;
        float _1315 = _1313;
        if (!_1263)
        {
            out.m_36.x = as_type<float>(_1291);
        }
        if (!_1253)
        {
            _1307 = _1251;
        }
        float _1317 = _1307;
        _1223 = _1317;
        if (!_1253)
        {
            _1311 = as_type<float>(_1273);
        }
        float _1319 = _1311;
        _1227 = _1319;
        if (_1249)
        {
            out.m_38.x = as_type<float>(_1295);
        }
        if (!_1253)
        {
            _1315 = as_type<float>(_1291);
        }
        float _1321 = _1315;
        _1229 = _1321;
        if (_1253)
        {
            out.m_40.y = as_type<float>(_1301);
        }
        if (!_1249)
        {
            _1297 = _1203;
        }
        float _1323 = _1297;
        if (_1253)
        {
            _1221 = _1323;
        }
        float _1325 = _1221;
        _1225 = _1325;
        if (!_1253)
        {
            _1303 = _1193;
        }
        float _1327 = _1303;
        _1247 = _1327;
        if (!_1253)
        {
            _1225 = _1323;
        }
    }
    float _1329 = _1223;
    float _1331 = _1225;
    float _1333 = _1227;
    float _1335 = _1229;
    float _1337 = _1247;
    float _1339 = _1239;
    int _1341 = as_type<int>(_1337);
    if (!_1107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _1343 = _459 > 0.0;
    float _1345 = _1329 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    bool _1347 = _287 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
    bool _1349 = isnan(_287);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
    bool _1355 = _1351 || _1353;
    bool _1357 = _463 > 0.0;
    out.m_34.x = _1345;
    if (_1343)
    {
        float _1359 = fma(_459, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1331);
        _1231 = as_type<int>(_1359);
    }
    int _1361 = _1231;
    if (!_1343)
    {
        float _1363 = -_459;
        float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1333);
        _553 = as_type<int>(_1365);
    }
    int _1367 = _553;
    if (!_1355)
    {
        float _1369 = _1335 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
        _1233 = as_type<int>(_1369);
    }
    int _1371 = _1233;
    if (_1357)
    {
        float _1373 = fma(_463, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1337);
        _1341 = as_type<int>(_1373);
    }
    int _1375 = _1341;
    if (_1343)
    {
        out.m_38.x = as_type<float>(_1361);
    }
    if (!_1355)
    {
        out.m_36.x = as_type<float>(_1371);
    }
    if (!_1343)
    {
        out.m_40.x = as_type<float>(_1367);
    }
    if (_1357)
    {
        out.m_40.y = as_type<float>(_1375);
    }
    if (_1357)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1377 = -_463;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1339);
    out.m_38.y = _1379;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    bool _193 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_27.x;
    float _56 = in.m_29.x;
    float _58 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _60 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _62 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _64 = in.m_31.x;
    float _66 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[8].x, _58);
    float _68 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[7].x, _60);
    float _70 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[9].x, _62);
    float _72 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[8].z, _66);
    float _74 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[7].z, _68);
    float _76 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[9].z, _70);
    float _78 = _72 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _80 = _74 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _82 = _76 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _84 = _78 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _86 = abs(_54);
    float _88 = log2(_86);
    float _90 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[13].x, _84);
    float _92 = _78 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _94 = _78 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _96 = _56 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _98 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[13].z, _90);
    float _100 = -_96;
    float _102 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[15].z, _100);
    float _104 = _98 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _106 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[10].x, _92);
    float _108 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[11].x, _94);
    float _110 = _56 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _112 = 1.0 / _104;
    float _114 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[10].z, _106);
    float _116 = _88 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _118 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[11].z, _108);
    float _120 = _114 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _122 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[15].y, _110);
    float _124 = _118 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _126 = exp2(_116);
    float _128 = _120 * _112;
    float _130 = _124 * _112;
    float _132 = fma(_128, 0.5, 0.5);
    float _134 = fma(_130, -0.5, 0.5);
    float _136 = _126 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _138 = _102 * _136;
    float _140 = _122 * _136;
    float _142 = _132 + _138;
    float _144 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float2 _1596 = float2(_142, _144);
    float _146 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1596, float2(0.0), isnan(_1596)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1596, float2(0.0), isnan(_1596)), level(0.0)).x;
    out.m_34.x = 0.0;
    float _148 = (*spvDescriptorSet0.vp_c3)._m0[14].x + (*spvDescriptorSet0.vp_c3)._m0[14].y;
    out.m_36.x = 0.0;
    float _150 = 1.0 / _148;
    out.gl_Position.z = 1.0;
    out.m_38.x = 0.0;
    out.m_40.x = 0.0;
    float _152 = -_150;
    float _154 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[14].x, 1.0);
    float _156 = -_146;
    float _158 = fma(_156, _154, 1.0);
    float _160 = 1.0 / _158;
    float _162 = _160 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _164 = -_82;
    bool _168 = _162 > _164;
    int _171 = 1065353216;
    int _173 = as_type<int>(_146);
    float _175 = _160;
    int _177 = as_type<int>(_82);
    int _179 = as_type<int>(_82);
    float _181;
    float _183;
    int _185;
    float _187;
    float _189;
    float _191;
    if (!_168)
    {
        _181 = 0.0;
        _183 = 0.0;
        _185 = 0;
        _187 = 0.0;
        _189 = 0.0;
        _191 = 0.0;
        _193 = true;
    }
    else
    {
        bool _195 = _138 > 0.0;
        float _197 = _138 * (*spvDescriptorSet0.vp_c3)._m0[16].w;
        bool _199 = _140 > 0.0;
        float _201 = _140 * (*spvDescriptorSet0.vp_c3)._m0[16].w;
        bool _203 = _54 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _205 = isnan(_54);
        bool _207 = _203 || _205;
        bool _209 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _211 = _207 || _209;
        out.m_34.x = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _181 = _201;
        if (_195)
        {
            _171 = 0;
        }
        int _213 = _171;
        int _215 = _213;
        if (!_195)
        {
            float _217 = -_197;
            float _219 = (-0.0) + _217;
            _215 = as_type<int>(_219);
        }
        int _221 = _215;
        if (_199)
        {
            _173 = 0;
        }
        int _223 = _173;
        int _225 = _223;
        if (!_199)
        {
            float _227 = -_201;
            float _229 = (-0.0) + _227;
            _225 = as_type<int>(_229);
        }
        int _231 = _225;
        int _233 = 0;
        _191 = as_type<float>(_231);
        if (!_211)
        {
            _233 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[16].z);
        }
        int _235 = _233;
        if (_195)
        {
            out.m_38.x = _197;
        }
        if (_195)
        {
            _175 = _197;
        }
        float _237 = _175;
        int _239 = 0;
        float _241 = _237;
        if (_211)
        {
            _239 = 0;
        }
        int _243 = _239;
        int _245 = _243;
        if (!_211)
        {
            out.m_36.x = as_type<float>(_235);
        }
        float _247 = 0.0;
        if (_199)
        {
            _247 = as_type<float>(_221);
        }
        float _249 = _247;
        float _251 = _249;
        if (!_195)
        {
            out.m_40.x = as_type<float>(_221);
        }
        if (!_195)
        {
            _241 = 0.0;
        }
        float _253 = _241;
        _189 = _253;
        if (!_211)
        {
            _245 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[16].z);
        }
        int _255 = _245;
        _185 = _255;
        if (!_199)
        {
            out.m_38.y = as_type<float>(_231);
        }
        if (!_199)
        {
            _251 = as_type<float>(_221);
        }
        float _257 = _251;
        _187 = _257;
        _183 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        if (_199)
        {
            out.m_40.y = _201;
        }
        if (!_199)
        {
            _181 = 0.0;
        }
    }
    _193 = false;
    float _259 = _181;
    float _261 = _183;
    int _263 = _185;
    float _265 = _187;
    float _267 = _189;
    float _269 = _191;
    float _271 = _54 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    float _273 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 2.0, _54);
    float _275 = abs(_271);
    float _277 = log2(_275);
    float _279 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 3.0, _54);
    float _281 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 4.0, _54);
    float _283 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 5.0, _54);
    float _285 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 6.0, _54);
    float _287 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 7.0, _54);
    float _289 = abs(_273);
    float _291 = log2(_289);
    float _293 = abs(_279);
    float _295 = log2(_293);
    float _297 = _277 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _299 = _122 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _301 = -_299;
    float _303 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[15].z, _301);
    float _305 = abs(_283);
    float _307 = log2(_305);
    float _309 = _291 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _311 = _122 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _313 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[15].y, _311);
    float _315 = abs(_281);
    float _317 = log2(_315);
    float _319 = _295 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _321 = _313 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _323 = _313 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _325 = fma(_303, (*spvDescriptorSet0.vp_c3)._m0[15].y, _321);
    float _327 = -_323;
    float _329 = fma(_303, (*spvDescriptorSet0.vp_c3)._m0[15].z, _327);
    float _331 = abs(_285);
    float _333 = log2(_331);
    float _335 = _307 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _337 = _325 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _339 = exp2(_297);
    float _341 = _317 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _343 = _325 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _345 = exp2(_309);
    float _347 = _333 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _349 = fma(_329, (*spvDescriptorSet0.vp_c3)._m0[15].y, _337);
    float _351 = -_343;
    float _353 = fma(_329, (*spvDescriptorSet0.vp_c3)._m0[15].z, _351);
    float _355 = exp2(_319);
    float _357 = _339 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _359 = _303 * _357;
    float _361 = _313 * _357;
    float _363 = _349 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _365 = abs(_287);
    float _367 = log2(_365);
    float _369 = _345 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _371 = fma(_361, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float _373 = fma(_353, (*spvDescriptorSet0.vp_c3)._m0[15].y, _363);
    float _375 = _329 * _369;
    float _377 = _325 * _369;
    float _379 = _349 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _381 = exp2(_341);
    float _383 = _355 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _385 = _373 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _387 = -_379;
    float _389 = fma(_353, (*spvDescriptorSet0.vp_c3)._m0[15].z, _387);
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float _393 = _353 * _383;
    float _395 = _349 * _383;
    float _397 = fma(_389, (*spvDescriptorSet0.vp_c3)._m0[15].y, _385);
    float _399 = _367 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _401 = _373 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _403 = exp2(_335);
    float _405 = _397 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _407 = _397 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _409 = -_401;
    float _411 = fma(_389, (*spvDescriptorSet0.vp_c3)._m0[15].z, _409);
    float _413 = _132 + _393;
    float _415 = _381 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _417 = fma(_411, (*spvDescriptorSet0.vp_c3)._m0[15].y, _405);
    float _419 = exp2(_399);
    float _421 = -_407;
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c3)._m0[15].z, _421);
    float _425 = _389 * _415;
    float _427 = _417 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _429 = _373 * _415;
    float _431 = _417 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _433 = _132 + _425;
    float _435 = -_427;
    float _437 = fma(_423, (*spvDescriptorSet0.vp_c3)._m0[15].z, _435);
    float _439 = exp2(_347);
    float _441 = _403 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _443 = fma(_423, (*spvDescriptorSet0.vp_c3)._m0[15].y, _431);
    float _445 = _411 * _441;
    float _447 = _397 * _441;
    float _449 = fma(_395, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float _451 = _419 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _453 = _132 + _445;
    float _455 = fma(_429, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float _457 = fma(_447, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float _459 = _437 * _451;
    float _461 = _132 + _359;
    float _463 = _443 * _451;
    float _465 = _132 + _375;
    float _467 = _439 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float2 _2161 = float2(_461, _371);
    float _469 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2161, float2(0.0), isnan(_2161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2161, float2(0.0), isnan(_2161)), level(0.0)).x;
    float _471 = _132 + _459;
    float _473 = _423 * _467;
    float _475 = _417 * _467;
    float2 _2178 = float2(_465, _391);
    float _477 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2178, float2(0.0), isnan(_2178)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2178, float2(0.0), isnan(_2178)), level(0.0)).x;
    float2 _2186 = float2(_413, _449);
    float _479 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2186, float2(0.0), isnan(_2186)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2186, float2(0.0), isnan(_2186)), level(0.0)).x;
    float2 _2194 = float2(_433, _455);
    float _481 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2194, float2(0.0), isnan(_2194)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2194, float2(0.0), isnan(_2194)), level(0.0)).x;
    float2 _2202 = float2(_453, _457);
    float _483 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2202, float2(0.0), isnan(_2202)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2202, float2(0.0), isnan(_2202)), level(0.0)).x;
    float _485 = _132 + _473;
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float _489 = fma(_463, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float2 _2223 = float2(_485, _487);
    float _491 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2223, float2(0.0), isnan(_2223)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2223, float2(0.0), isnan(_2223)), level(0.0)).x;
    float2 _2231 = float2(_471, _489);
    float _493 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2231, float2(0.0), isnan(_2231)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2231, float2(0.0), isnan(_2231)), level(0.0)).x;
    float _495 = -_469;
    float _497 = fma(_154, _495, 1.0);
    float _499 = 1.0 / _497;
    float _501 = _499 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _503 = -_82;
    bool _505 = _501 > _503;
    int _507 = as_type<int>(_501);
    int _509 = as_type<int>(_499);
    int _511 = as_type<int>(_265);
    int _513 = as_type<int>(_359);
    int _515 = as_type<int>(_269);
    float _517 = _261;
    int _519 = _263;
    float _521 = _267;
    float _523 = _261;
    int _525 = as_type<int>(_265);
    int _527 = _263;
    float _529 = _269;
    float _531 = _267;
    int _533 = as_type<int>(_259);
    int _535 = as_type<int>(_273);
    int _537 = as_type<int>(_375);
    int _539 = as_type<int>(_273);
    int _541 = as_type<int>(_279);
    int _543 = as_type<int>(_393);
    int _545 = as_type<int>(_279);
    int _547 = as_type<int>(_425);
    int _549 = as_type<int>(_445);
    int _551 = as_type<int>(_473);
    int _553 = as_type<int>(_459);
    if (!_505)
    {
        _507 = as_type<int>(_259);
    }
    int _555 = _507;
    bool _557 = !_505;
    int _559 = _555;
    float _561 = as_type<float>(_555);
    if (!_557)
    {
        bool _563 = _271 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _565 = isnan(_271);
        bool _567 = _563 || _565;
        bool _569 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _571 = _567 || _569;
        float _573 = _261 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _575 = _359 > 0.0;
        bool _577 = _361 > 0.0;
        out.m_34.x = _573;
        if (_571)
        {
            _509 = _263;
        }
        int _579 = _509;
        int _581 = _579;
        if (!_571)
        {
            float _583 = as_type<float>(_263) + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _581 = as_type<int>(_583);
        }
        int _585 = _581;
        if (!_575)
        {
            float _587 = -_359;
            float _589 = fma(_587, (*spvDescriptorSet0.vp_c3)._m0[16].w, _265);
            _511 = as_type<int>(_589);
        }
        int _591 = _511;
        _525 = _591;
        if (_575)
        {
            float _593 = fma(_359, (*spvDescriptorSet0.vp_c3)._m0[16].w, _267);
            _513 = as_type<int>(_593);
        }
        int _595 = _513;
        float _597 = as_type<float>(_595);
        if (!_577)
        {
            float _599 = -_361;
            float _601 = fma(_599, (*spvDescriptorSet0.vp_c3)._m0[16].w, _269);
            _515 = as_type<int>(_601);
        }
        int _603 = _515;
        _529 = as_type<float>(_603);
        if (_577)
        {
            float _605 = fma(_361, (*spvDescriptorSet0.vp_c3)._m0[16].w, _259);
            _559 = as_type<int>(_605);
        }
        int _607 = _559;
        float _609 = as_type<float>(_607);
        if (!_571)
        {
            out.m_36.x = as_type<float>(_585);
        }
        if (_577)
        {
            _517 = _573;
        }
        float _611 = _517;
        float _613 = _611;
        if (_577)
        {
            _519 = _585;
        }
        int _615 = _519;
        int _617 = _615;
        if (!_575)
        {
            out.m_40.x = as_type<float>(_591);
        }
        if (!_577)
        {
            _613 = _573;
        }
        float _619 = _613;
        _523 = _619;
        if (!_577)
        {
            _617 = _585;
        }
        int _621 = _617;
        _527 = _621;
        if (!_577)
        {
            out.m_38.y = as_type<float>(_603);
        }
        if (_575)
        {
            out.m_38.x = as_type<float>(_595);
        }
        if (_577)
        {
            out.m_40.y = as_type<float>(_607);
        }
        if (!_575)
        {
            _597 = _267;
        }
        float _623 = _597;
        if (_577)
        {
            _521 = _623;
        }
        float _625 = _521;
        _531 = _625;
        if (!_577)
        {
            _609 = _259;
        }
        float _627 = _609;
        _561 = _627;
        if (!_577)
        {
            _531 = _623;
        }
    }
    float _629 = _561;
    float _631 = _523;
    int _633 = _525;
    int _635 = _527;
    float _637 = _529;
    float _639 = _531;
    float _641 = -_477;
    float _643 = fma(_154, _641, 1.0);
    float _645 = 1.0 / _643;
    float _647 = _645 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _649 = -_82;
    bool _651 = _647 > _649;
    int _653 = as_type<int>(_647);
    int _655 = as_type<int>(_637);
    float _657 = _631;
    int _659 = _633;
    int _661 = _635;
    float _663 = _639;
    float _665 = _631;
    int _667 = _633;
    int _669 = _635;
    float _671 = _637;
    float _673 = _639;
    if (!_651)
    {
        _533 = as_type<int>(_629);
    }
    int _675 = _533;
    bool _677 = !_651;
    int _679 = _675;
    float _681 = as_type<float>(_675);
    if (!_677)
    {
        bool _683 = _375 > 0.0;
        float _685 = _631 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _687 = _273 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _689 = isnan(_273);
        bool _691 = _687 || _689;
        bool _693 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _695 = _691 || _693;
        bool _697 = _377 > 0.0;
        out.m_34.x = _685;
        if (_683)
        {
            _535 = _633;
        }
        int _699 = _535;
        int _701 = _699;
        if (!_683)
        {
            float _703 = -_375;
            float _705 = fma(_703, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_633));
            _701 = as_type<int>(_705);
        }
        int _707 = _701;
        _539 = _707;
        if (_695)
        {
            _653 = _635;
        }
        int _709 = _653;
        int _711 = _709;
        if (!_695)
        {
            float _713 = as_type<float>(_635) + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _711 = as_type<int>(_713);
        }
        int _715 = _711;
        if (!_697)
        {
            float _717 = -_377;
            float _719 = fma(_717, (*spvDescriptorSet0.vp_c3)._m0[16].w, _637);
            _655 = as_type<int>(_719);
        }
        int _721 = _655;
        _671 = as_type<float>(_721);
        if (_683)
        {
            float _723 = fma(_375, (*spvDescriptorSet0.vp_c3)._m0[16].w, _639);
            _537 = as_type<int>(_723);
        }
        int _725 = _537;
        float _727 = as_type<float>(_725);
        if (!_683)
        {
            out.m_40.x = as_type<float>(_707);
        }
        if (_697)
        {
            float _729 = fma(_377, (*spvDescriptorSet0.vp_c3)._m0[16].w, _629);
            _679 = as_type<int>(_729);
        }
        int _731 = _679;
        float _733 = as_type<float>(_731);
        if (_697)
        {
            _657 = _685;
        }
        float _735 = _657;
        float _737 = _735;
        if (!_697)
        {
            out.m_38.y = as_type<float>(_721);
        }
        if (_697)
        {
            _659 = _707;
        }
        int _739 = _659;
        int _741 = _739;
        if (_697)
        {
            _661 = _715;
        }
        int _743 = _661;
        int _745 = _743;
        if (!_695)
        {
            out.m_36.x = as_type<float>(_715);
        }
        if (!_697)
        {
            _737 = _685;
        }
        float _747 = _737;
        _665 = _747;
        if (!_697)
        {
            _741 = _707;
        }
        int _749 = _741;
        _667 = _749;
        if (_683)
        {
            out.m_38.x = as_type<float>(_725);
        }
        if (!_697)
        {
            _745 = _715;
        }
        int _751 = _745;
        _669 = _751;
        if (_697)
        {
            out.m_40.y = as_type<float>(_731);
        }
        if (!_683)
        {
            _727 = _639;
        }
        float _753 = _727;
        if (_697)
        {
            _663 = _753;
        }
        float _755 = _663;
        _673 = _755;
        if (!_697)
        {
            _733 = _629;
        }
        float _757 = _733;
        _681 = _757;
        if (!_697)
        {
            _673 = _753;
        }
    }
    float _759 = _681;
    float _761 = _665;
    int _763 = _667;
    int _765 = _669;
    float _767 = _671;
    float _769 = _673;
    int _771 = _539;
    float _773 = -_479;
    float _775 = fma(_154, _773, 1.0);
    float _777 = 1.0 / _775;
    float _779 = _777 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _781 = -_82;
    bool _783 = _779 > _781;
    int _785 = _771;
    int _787 = as_type<int>(_779);
    int _789 = as_type<int>(_767);
    float _791 = _761;
    int _793 = _763;
    int _795 = _765;
    float _797 = _769;
    float _799 = _761;
    int _801 = _763;
    int _803 = _765;
    float _805 = _767;
    float _807 = _769;
    int _809 = as_type<int>(_759);
    if (!_783)
    {
        _785 = as_type<int>(_759);
    }
    int _811 = _785;
    bool _813 = !_783;
    int _815 = _811;
    float _817 = as_type<float>(_811);
    if (!_813)
    {
        bool _819 = _393 > 0.0;
        float _821 = _761 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _823 = _279 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _825 = isnan(_279);
        bool _827 = _823 || _825;
        bool _829 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _831 = _827 || _829;
        bool _833 = _395 > 0.0;
        out.m_34.x = _821;
        if (_819)
        {
            _541 = _763;
        }
        int _835 = _541;
        int _837 = _835;
        if (!_819)
        {
            float _839 = -_393;
            float _841 = fma(_839, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_763));
            _837 = as_type<int>(_841);
        }
        int _843 = _837;
        _545 = _843;
        if (_831)
        {
            _787 = _765;
        }
        int _845 = _787;
        int _847 = _845;
        if (!_831)
        {
            float _849 = as_type<float>(_765) + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _847 = as_type<int>(_849);
        }
        int _851 = _847;
        if (!_833)
        {
            float _853 = -_395;
            float _855 = fma(_853, (*spvDescriptorSet0.vp_c3)._m0[16].w, _767);
            _789 = as_type<int>(_855);
        }
        int _857 = _789;
        _805 = as_type<float>(_857);
        if (_819)
        {
            float _859 = fma(_393, (*spvDescriptorSet0.vp_c3)._m0[16].w, _769);
            _543 = as_type<int>(_859);
        }
        int _861 = _543;
        float _863 = as_type<float>(_861);
        if (!_819)
        {
            out.m_40.x = as_type<float>(_843);
        }
        if (_833)
        {
            float _865 = fma(_395, (*spvDescriptorSet0.vp_c3)._m0[16].w, _759);
            _815 = as_type<int>(_865);
        }
        int _867 = _815;
        float _869 = as_type<float>(_867);
        if (_833)
        {
            _791 = _821;
        }
        float _871 = _791;
        float _873 = _871;
        if (!_833)
        {
            out.m_38.y = as_type<float>(_857);
        }
        if (_833)
        {
            _793 = _843;
        }
        int _875 = _793;
        int _877 = _875;
        if (_833)
        {
            _795 = _851;
        }
        int _879 = _795;
        int _881 = _879;
        if (!_831)
        {
            out.m_36.x = as_type<float>(_851);
        }
        if (!_833)
        {
            _873 = _821;
        }
        float _883 = _873;
        _799 = _883;
        if (!_833)
        {
            _877 = _843;
        }
        int _885 = _877;
        _801 = _885;
        if (_819)
        {
            out.m_38.x = as_type<float>(_861);
        }
        if (!_833)
        {
            _881 = _851;
        }
        int _887 = _881;
        _803 = _887;
        if (_833)
        {
            out.m_40.y = as_type<float>(_867);
        }
        if (!_819)
        {
            _863 = _769;
        }
        float _889 = _863;
        if (_833)
        {
            _797 = _889;
        }
        float _891 = _797;
        _807 = _891;
        if (!_833)
        {
            _869 = _759;
        }
        float _893 = _869;
        _817 = _893;
        if (!_833)
        {
            _807 = _889;
        }
    }
    float _895 = _817;
    float _897 = _799;
    int _899 = _801;
    int _901 = _803;
    float _903 = _805;
    float _905 = _807;
    int _907 = _545;
    float _909 = -_481;
    float _911 = fma(_154, _909, 1.0);
    float _913 = 1.0 / _911;
    float _915 = _913 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _917 = -_82;
    bool _919 = _915 > _917;
    int _921 = _907;
    int _923 = as_type<int>(_915);
    int _925 = as_type<int>(_903);
    float _927 = _897;
    int _929 = _899;
    int _931 = _901;
    float _933 = _905;
    float _935 = _897;
    int _937 = _899;
    int _939 = _901;
    float _941 = _903;
    float _943 = _905;
    int _945 = as_type<int>(_895);
    if (!_919)
    {
        _809 = as_type<int>(_895);
    }
    int _947 = _809;
    bool _949 = !_919;
    int _951 = _947;
    float _953 = as_type<float>(_947);
    if (!_949)
    {
        bool _955 = _425 > 0.0;
        bool _957 = _281 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _959 = isnan(_281);
        bool _961 = _957 || _959;
        bool _963 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _965 = _961 || _963;
        float _967 = _897 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _969 = _429 > 0.0;
        out.m_34.x = _967;
        if (_955)
        {
            _921 = _899;
        }
        int _971 = _921;
        int _973 = _971;
        if (!_955)
        {
            float _975 = -_425;
            float _977 = fma(_975, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_899));
            _973 = as_type<int>(_977);
        }
        int _979 = _973;
        if (_965)
        {
            _923 = _901;
        }
        int _981 = _923;
        int _983 = _981;
        if (!_965)
        {
            float _985 = as_type<float>(_901) + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _983 = as_type<int>(_985);
        }
        int _987 = _983;
        if (!_969)
        {
            float _989 = -_429;
            float _991 = fma(_989, (*spvDescriptorSet0.vp_c3)._m0[16].w, _903);
            _925 = as_type<int>(_991);
        }
        int _993 = _925;
        _941 = as_type<float>(_993);
        if (_955)
        {
            float _995 = fma(_425, (*spvDescriptorSet0.vp_c3)._m0[16].w, _905);
            _547 = as_type<int>(_995);
        }
        int _997 = _547;
        float _999 = as_type<float>(_997);
        if (!_955)
        {
            out.m_40.x = as_type<float>(_979);
        }
        if (_969)
        {
            float _1001 = fma(_429, (*spvDescriptorSet0.vp_c3)._m0[16].w, _895);
            _951 = as_type<int>(_1001);
        }
        int _1003 = _951;
        float _1005 = as_type<float>(_1003);
        if (_969)
        {
            _927 = _967;
        }
        float _1007 = _927;
        float _1009 = _1007;
        if (!_969)
        {
            out.m_38.y = as_type<float>(_993);
        }
        if (_969)
        {
            _929 = _979;
        }
        int _1011 = _929;
        int _1013 = _1011;
        if (_969)
        {
            _931 = _987;
        }
        int _1015 = _931;
        int _1017 = _1015;
        if (!_965)
        {
            out.m_36.x = as_type<float>(_987);
        }
        if (!_969)
        {
            _1009 = _967;
        }
        float _1019 = _1009;
        _935 = _1019;
        if (!_969)
        {
            _1013 = _979;
        }
        int _1021 = _1013;
        _937 = _1021;
        if (_955)
        {
            out.m_38.x = as_type<float>(_997);
        }
        if (!_969)
        {
            _1017 = _987;
        }
        int _1023 = _1017;
        _939 = _1023;
        if (_969)
        {
            out.m_40.y = as_type<float>(_1003);
        }
        if (!_955)
        {
            _999 = _905;
        }
        float _1025 = _999;
        if (_969)
        {
            _933 = _1025;
        }
        float _1027 = _933;
        _943 = _1027;
        if (!_969)
        {
            _1005 = _895;
        }
        float _1029 = _1005;
        _953 = _1029;
        if (!_969)
        {
            _943 = _1025;
        }
    }
    float _1031 = _953;
    float _1033 = _935;
    int _1035 = _937;
    int _1037 = _939;
    float _1039 = _941;
    float _1041 = _943;
    float _1043 = -_483;
    float _1045 = fma(_154, _1043, 1.0);
    float _1047 = -_491;
    float _1049 = fma(_154, _1047, 1.0);
    float _1051 = -_493;
    float _1053 = fma(_154, _1051, 1.0);
    float _1055 = 1.0 / _1045;
    float _1057 = 1.0 / _1049;
    float _1059 = 1.0 / _1053;
    float _1061 = _1055 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _1063 = -_82;
    bool _1065 = _1061 > _1063;
    float _1067 = _1057 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _1069 = -_82;
    bool _1071 = _1067 > _1069;
    float _1073 = _1059 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    int _1075 = as_type<int>(_1067);
    int _1077 = as_type<int>(_1073);
    int _1079 = as_type<int>(_1039);
    float _1081 = _1033;
    int _1083 = _1035;
    int _1085 = _1037;
    float _1087 = _1041;
    int _1089 = as_type<int>(_1039);
    float _1091 = _1033;
    int _1093 = _1035;
    int _1095 = _1037;
    float _1097 = _1041;
    int _1099 = as_type<int>(_1073);
    int _1101 = as_type<int>(_1031);
    if (!_1065)
    {
        _1075 = as_type<int>(_1031);
    }
    int _1103 = _1075;
    float _1105 = -_82;
    bool _1107 = _1073 > _1105;
    bool _1109 = !_1065;
    int _1111 = _1103;
    float _1113 = as_type<float>(_1103);
    if (!_1109)
    {
        bool _1115 = _445 > 0.0;
        float _1117 = _1033 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _1119 = _283 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _1121 = isnan(_283);
        bool _1123 = _1119 || _1121;
        bool _1125 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _1127 = _1123 || _1125;
        bool _1129 = _447 > 0.0;
        out.m_34.x = _1117;
        _945 = as_type<int>(_1117);
        if (_1115)
        {
            _1077 = _1035;
        }
        int _1131 = _1077;
        int _1133 = _1131;
        if (!_1115)
        {
            float _1135 = -_445;
            float _1137 = fma(_1135, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_1035));
            _1133 = as_type<int>(_1137);
        }
        int _1139 = _1133;
        _1099 = _1139;
        if (_1127)
        {
            _177 = _1037;
        }
        int _1141 = _177;
        int _1143 = _1141;
        if (!_1127)
        {
            float _1145 = as_type<float>(_1037) + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _1143 = as_type<int>(_1145);
        }
        int _1147 = _1143;
        _179 = _1147;
        if (!_1129)
        {
            float _1149 = -_447;
            float _1151 = fma(_1149, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1039);
            _1079 = as_type<int>(_1151);
        }
        int _1153 = _1079;
        _1089 = _1153;
        if (_1115)
        {
            float _1155 = fma(_445, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1041);
            _549 = as_type<int>(_1155);
        }
        int _1157 = _549;
        float _1159 = as_type<float>(_1157);
        if (!_1115)
        {
            out.m_40.x = as_type<float>(_1139);
        }
        if (_1129)
        {
            float _1161 = fma(_447, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1031);
            _1111 = as_type<int>(_1161);
        }
        int _1163 = _1111;
        float _1165 = as_type<float>(_1163);
        if (_1129)
        {
            _1081 = _1117;
        }
        float _1167 = _1081;
        float _1169 = _1167;
        if (!_1129)
        {
            out.m_38.y = as_type<float>(_1153);
        }
        if (_1129)
        {
            _1083 = _1139;
        }
        int _1171 = _1083;
        int _1173 = _1171;
        if (_1129)
        {
            _1085 = _1147;
        }
        int _1175 = _1085;
        int _1177 = _1175;
        if (!_1127)
        {
            out.m_36.x = as_type<float>(_1147);
        }
        if (!_1129)
        {
            _1169 = _1117;
        }
        float _1179 = _1169;
        _1091 = _1179;
        if (!_1129)
        {
            _1173 = _1139;
        }
        int _1181 = _1173;
        _1093 = _1181;
        if (_1115)
        {
            out.m_38.x = as_type<float>(_1157);
        }
        if (!_1129)
        {
            _1177 = _1147;
        }
        int _1183 = _1177;
        _1095 = _1183;
        if (_1129)
        {
            out.m_40.y = as_type<float>(_1163);
        }
        if (!_1115)
        {
            _1159 = _1041;
        }
        float _1185 = _1159;
        if (_1129)
        {
            _1087 = _1185;
        }
        float _1187 = _1087;
        _1097 = _1187;
        if (!_1129)
        {
            _1165 = _1031;
        }
        float _1189 = _1165;
        _1113 = _1189;
        if (!_1129)
        {
            _1097 = _1185;
        }
    }
    int _1191 = _1089;
    float _1193 = _1113;
    float _1195 = _1091;
    int _1197 = _1093;
    int _1199 = _1095;
    int _1201 = _945;
    float _1203 = _1097;
    int _1205 = _179;
    int _1207 = _1099;
    int _1209 = _1207;
    int _1211 = _1201;
    int _1213 = _1205;
    float _1215 = _1195;
    float _1217 = as_type<float>(_1197);
    float _1219 = as_type<float>(_1199);
    float _1221 = _1203;
    float _1223 = _1195;
    float _1225 = _1203;
    float _1227 = as_type<float>(_1197);
    float _1229 = as_type<float>(_1199);
    int _1231 = _1191;
    int _1233 = as_type<int>(_1193);
    if (!_1071)
    {
        _1101 = _1191;
    }
    int _1235 = _1101;
    int _1237 = _1235;
    float _1239 = as_type<float>(_1235);
    if (!_1071)
    {
        _1209 = as_type<int>(_1193);
    }
    int _1241 = _1209;
    bool _1243 = !_1071;
    int _1245 = _1241;
    float _1247 = as_type<float>(_1241);
    if (!_1243)
    {
        bool _1249 = _473 > 0.0;
        float _1251 = _1195 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _1253 = _475 > 0.0;
        bool _1255 = _285 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _1257 = isnan(_285);
        bool _1259 = _1255 || _1257;
        bool _1261 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _1263 = _1259 || _1261;
        out.m_34.x = _1251;
        if (_1249)
        {
            _1211 = _1197;
        }
        int _1265 = _1211;
        int _1267 = _1265;
        if (!_1249)
        {
            float _1269 = -_473;
            float _1271 = fma(_1269, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_1197));
            _1267 = as_type<int>(_1271);
        }
        int _1273 = _1267;
        if (_1253)
        {
            _1237 = _1191;
        }
        int _1275 = _1237;
        int _1277 = _1275;
        if (!_1253)
        {
            float _1279 = -_475;
            float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_1191));
            _1277 = as_type<int>(_1281);
        }
        int _1283 = _1277;
        _1239 = as_type<float>(_1283);
        if (_1263)
        {
            _1213 = _1199;
        }
        int _1285 = _1213;
        int _1287 = _1285;
        if (!_1263)
        {
            float _1289 = as_type<float>(_1199) + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _1287 = as_type<int>(_1289);
        }
        int _1291 = _1287;
        if (!_1249)
        {
            out.m_40.x = as_type<float>(_1273);
        }
        if (_1249)
        {
            float _1293 = fma(_473, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1203);
            _551 = as_type<int>(_1293);
        }
        int _1295 = _551;
        float _1297 = as_type<float>(_1295);
        if (_1253)
        {
            float _1299 = fma(_475, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1193);
            _1245 = as_type<int>(_1299);
        }
        int _1301 = _1245;
        float _1303 = as_type<float>(_1301);
        if (_1253)
        {
            _1215 = _1251;
        }
        float _1305 = _1215;
        float _1307 = _1305;
        if (!_1253)
        {
            out.m_38.y = as_type<float>(_1283);
        }
        if (_1253)
        {
            _1217 = as_type<float>(_1273);
        }
        float _1309 = _1217;
        float _1311 = _1309;
        if (_1253)
        {
            _1219 = as_type<float>(_1291);
        }
        float _1313 = _1219;
        float _1315 = _1313;
        if (!_1263)
        {
            out.m_36.x = as_type<float>(_1291);
        }
        if (!_1253)
        {
            _1307 = _1251;
        }
        float _1317 = _1307;
        _1223 = _1317;
        if (!_1253)
        {
            _1311 = as_type<float>(_1273);
        }
        float _1319 = _1311;
        _1227 = _1319;
        if (_1249)
        {
            out.m_38.x = as_type<float>(_1295);
        }
        if (!_1253)
        {
            _1315 = as_type<float>(_1291);
        }
        float _1321 = _1315;
        _1229 = _1321;
        if (_1253)
        {
            out.m_40.y = as_type<float>(_1301);
        }
        if (!_1249)
        {
            _1297 = _1203;
        }
        float _1323 = _1297;
        if (_1253)
        {
            _1221 = _1323;
        }
        float _1325 = _1221;
        _1225 = _1325;
        if (!_1253)
        {
            _1303 = _1193;
        }
        float _1327 = _1303;
        _1247 = _1327;
        if (!_1253)
        {
            _1225 = _1323;
        }
    }
    float _1329 = _1223;
    float _1331 = _1225;
    float _1333 = _1227;
    float _1335 = _1229;
    float _1337 = _1247;
    float _1339 = _1239;
    int _1341 = as_type<int>(_1337);
    if (!_1107)
    {
        return out;
    }
    bool _1343 = _459 > 0.0;
    float _1345 = _1329 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    bool _1347 = _287 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
    bool _1349 = isnan(_287);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
    bool _1355 = _1351 || _1353;
    bool _1357 = _463 > 0.0;
    out.m_34.x = _1345;
    if (_1343)
    {
        float _1359 = fma(_459, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1331);
        _1231 = as_type<int>(_1359);
    }
    int _1361 = _1231;
    if (!_1343)
    {
        float _1363 = -_459;
        float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1333);
        _553 = as_type<int>(_1365);
    }
    int _1367 = _553;
    if (!_1355)
    {
        float _1369 = _1335 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
        _1233 = as_type<int>(_1369);
    }
    int _1371 = _1233;
    if (_1357)
    {
        float _1373 = fma(_463, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1337);
        _1341 = as_type<int>(_1373);
    }
    int _1375 = _1341;
    if (_1343)
    {
        out.m_38.x = as_type<float>(_1361);
    }
    if (!_1355)
    {
        out.m_36.x = as_type<float>(_1371);
    }
    if (!_1343)
    {
        out.m_40.x = as_type<float>(_1367);
    }
    if (_1357)
    {
        out.m_40.y = as_type<float>(_1375);
    }
    if (_1357)
    {
        return out;
    }
    float _1377 = -_463;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1339);
    out.m_38.y = _1379;
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
    out.m_36 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_34 = float4(0.0, 0.0, 0.0, 1.0);
    bool _193 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _54 = in.m_27.x;
    float _56 = in.m_29.x;
    float _58 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[8].y;
    float _60 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[7].y;
    float _62 = (*spvDescriptorSet0.vp_c3)._m0[5].w * (*spvDescriptorSet0.vp_c3)._m0[9].y;
    float _64 = in.m_31.x;
    float _66 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[8].x, _58);
    float _68 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[7].x, _60);
    float _70 = fma((*spvDescriptorSet0.vp_c3)._m0[4].w, (*spvDescriptorSet0.vp_c3)._m0[9].x, _62);
    float _72 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[8].z, _66);
    float _74 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[7].z, _68);
    float _76 = fma((*spvDescriptorSet0.vp_c3)._m0[6].w, (*spvDescriptorSet0.vp_c3)._m0[9].z, _70);
    float _78 = _72 + (*spvDescriptorSet0.vp_c3)._m0[8].w;
    float _80 = _74 + (*spvDescriptorSet0.vp_c3)._m0[7].w;
    float _82 = _76 + (*spvDescriptorSet0.vp_c3)._m0[9].w;
    float _84 = _78 * (*spvDescriptorSet0.vp_c3)._m0[13].y;
    float _86 = abs(_54);
    float _88 = log2(_86);
    float _90 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[13].x, _84);
    float _92 = _78 * (*spvDescriptorSet0.vp_c3)._m0[10].y;
    float _94 = _78 * (*spvDescriptorSet0.vp_c3)._m0[11].y;
    float _96 = _56 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _98 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[13].z, _90);
    float _100 = -_96;
    float _102 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[15].z, _100);
    float _104 = _98 + (*spvDescriptorSet0.vp_c3)._m0[13].w;
    float _106 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[10].x, _92);
    float _108 = fma(_80, (*spvDescriptorSet0.vp_c3)._m0[11].x, _94);
    float _110 = _56 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _112 = 1.0 / _104;
    float _114 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[10].z, _106);
    float _116 = _88 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _118 = fma(_82, (*spvDescriptorSet0.vp_c3)._m0[11].z, _108);
    float _120 = _114 + (*spvDescriptorSet0.vp_c3)._m0[10].w;
    float _122 = fma(_64, (*spvDescriptorSet0.vp_c3)._m0[15].y, _110);
    float _124 = _118 + (*spvDescriptorSet0.vp_c3)._m0[11].w;
    float _126 = exp2(_116);
    float _128 = _120 * _112;
    float _130 = _124 * _112;
    float _132 = fma(_128, 0.5, 0.5);
    float _134 = fma(_130, -0.5, 0.5);
    float _136 = _126 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _138 = _102 * _136;
    float _140 = _122 * _136;
    float _142 = _132 + _138;
    float _144 = fma(_140, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float2 _1596 = float2(_142, _144);
    float _146 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_1596, float2(0.0), isnan(_1596)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_1596, float2(0.0), isnan(_1596)), level(0.0)).x;
    out.m_34.x = 0.0;
    float _148 = (*spvDescriptorSet0.vp_c3)._m0[14].x + (*spvDescriptorSet0.vp_c3)._m0[14].y;
    out.m_36.x = 0.0;
    float _150 = 1.0 / _148;
    out.gl_Position.z = 1.0;
    out.m_38.x = 0.0;
    out.m_40.x = 0.0;
    float _152 = -_150;
    float _154 = fma(_152, (*spvDescriptorSet0.vp_c3)._m0[14].x, 1.0);
    float _156 = -_146;
    float _158 = fma(_156, _154, 1.0);
    float _160 = 1.0 / _158;
    float _162 = _160 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _164 = -_82;
    bool _168 = _162 > _164;
    int _171 = 1065353216;
    int _173 = as_type<int>(_146);
    float _175 = _160;
    int _177 = as_type<int>(_82);
    int _179 = as_type<int>(_82);
    float _181;
    float _183;
    int _185;
    float _187;
    float _189;
    float _191;
    if (!_168)
    {
        _181 = 0.0;
        _183 = 0.0;
        _185 = 0;
        _187 = 0.0;
        _189 = 0.0;
        _191 = 0.0;
        _193 = true;
    }
    else
    {
        bool _195 = _138 > 0.0;
        float _197 = _138 * (*spvDescriptorSet0.vp_c3)._m0[16].w;
        bool _199 = _140 > 0.0;
        float _201 = _140 * (*spvDescriptorSet0.vp_c3)._m0[16].w;
        bool _203 = _54 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _205 = isnan(_54);
        bool _207 = _203 || _205;
        bool _209 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _211 = _207 || _209;
        out.m_34.x = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        _181 = _201;
        if (_195)
        {
            _171 = 0;
        }
        int _213 = _171;
        int _215 = _213;
        if (!_195)
        {
            float _217 = -_197;
            float _219 = (-0.0) + _217;
            _215 = as_type<int>(_219);
        }
        int _221 = _215;
        if (_199)
        {
            _173 = 0;
        }
        int _223 = _173;
        int _225 = _223;
        if (!_199)
        {
            float _227 = -_201;
            float _229 = (-0.0) + _227;
            _225 = as_type<int>(_229);
        }
        int _231 = _225;
        int _233 = 0;
        _191 = as_type<float>(_231);
        if (!_211)
        {
            _233 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[16].z);
        }
        int _235 = _233;
        if (_195)
        {
            out.m_38.x = _197;
        }
        if (_195)
        {
            _175 = _197;
        }
        float _237 = _175;
        int _239 = 0;
        float _241 = _237;
        if (_211)
        {
            _239 = 0;
        }
        int _243 = _239;
        int _245 = _243;
        if (!_211)
        {
            out.m_36.x = as_type<float>(_235);
        }
        float _247 = 0.0;
        if (_199)
        {
            _247 = as_type<float>(_221);
        }
        float _249 = _247;
        float _251 = _249;
        if (!_195)
        {
            out.m_40.x = as_type<float>(_221);
        }
        if (!_195)
        {
            _241 = 0.0;
        }
        float _253 = _241;
        _189 = _253;
        if (!_211)
        {
            _245 = as_type<int>((*spvDescriptorSet0.vp_c3)._m0[16].z);
        }
        int _255 = _245;
        _185 = _255;
        if (!_199)
        {
            out.m_38.y = as_type<float>(_231);
        }
        if (!_199)
        {
            _251 = as_type<float>(_221);
        }
        float _257 = _251;
        _187 = _257;
        _183 = (*spvDescriptorSet0.vp_c3)._m0[16].y;
        if (_199)
        {
            out.m_40.y = _201;
        }
        if (!_199)
        {
            _181 = 0.0;
        }
    }
    _193 = false;
    float _259 = _181;
    float _261 = _183;
    int _263 = _185;
    float _265 = _187;
    float _267 = _189;
    float _269 = _191;
    float _271 = _54 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    float _273 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 2.0, _54);
    float _275 = abs(_271);
    float _277 = log2(_275);
    float _279 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 3.0, _54);
    float _281 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 4.0, _54);
    float _283 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 5.0, _54);
    float _285 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 6.0, _54);
    float _287 = fma((*spvDescriptorSet0.vp_c3)._m0[16].y, 7.0, _54);
    float _289 = abs(_273);
    float _291 = log2(_289);
    float _293 = abs(_279);
    float _295 = log2(_293);
    float _297 = _277 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _299 = _122 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _301 = -_299;
    float _303 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[15].z, _301);
    float _305 = abs(_283);
    float _307 = log2(_305);
    float _309 = _291 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _311 = _122 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _313 = fma(_102, (*spvDescriptorSet0.vp_c3)._m0[15].y, _311);
    float _315 = abs(_281);
    float _317 = log2(_315);
    float _319 = _295 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _321 = _313 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _323 = _313 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _325 = fma(_303, (*spvDescriptorSet0.vp_c3)._m0[15].y, _321);
    float _327 = -_323;
    float _329 = fma(_303, (*spvDescriptorSet0.vp_c3)._m0[15].z, _327);
    float _331 = abs(_285);
    float _333 = log2(_331);
    float _335 = _307 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _337 = _325 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _339 = exp2(_297);
    float _341 = _317 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _343 = _325 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _345 = exp2(_309);
    float _347 = _333 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _349 = fma(_329, (*spvDescriptorSet0.vp_c3)._m0[15].y, _337);
    float _351 = -_343;
    float _353 = fma(_329, (*spvDescriptorSet0.vp_c3)._m0[15].z, _351);
    float _355 = exp2(_319);
    float _357 = _339 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _359 = _303 * _357;
    float _361 = _313 * _357;
    float _363 = _349 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _365 = abs(_287);
    float _367 = log2(_365);
    float _369 = _345 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _371 = fma(_361, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float _373 = fma(_353, (*spvDescriptorSet0.vp_c3)._m0[15].y, _363);
    float _375 = _329 * _369;
    float _377 = _325 * _369;
    float _379 = _349 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _381 = exp2(_341);
    float _383 = _355 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _385 = _373 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _387 = -_379;
    float _389 = fma(_353, (*spvDescriptorSet0.vp_c3)._m0[15].z, _387);
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float _393 = _353 * _383;
    float _395 = _349 * _383;
    float _397 = fma(_389, (*spvDescriptorSet0.vp_c3)._m0[15].y, _385);
    float _399 = _367 * (*spvDescriptorSet0.vp_c3)._m0[14].w;
    float _401 = _373 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _403 = exp2(_335);
    float _405 = _397 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _407 = _397 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _409 = -_401;
    float _411 = fma(_389, (*spvDescriptorSet0.vp_c3)._m0[15].z, _409);
    float _413 = _132 + _393;
    float _415 = _381 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _417 = fma(_411, (*spvDescriptorSet0.vp_c3)._m0[15].y, _405);
    float _419 = exp2(_399);
    float _421 = -_407;
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c3)._m0[15].z, _421);
    float _425 = _389 * _415;
    float _427 = _417 * (*spvDescriptorSet0.vp_c3)._m0[15].y;
    float _429 = _373 * _415;
    float _431 = _417 * (*spvDescriptorSet0.vp_c3)._m0[15].z;
    float _433 = _132 + _425;
    float _435 = -_427;
    float _437 = fma(_423, (*spvDescriptorSet0.vp_c3)._m0[15].z, _435);
    float _439 = exp2(_347);
    float _441 = _403 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _443 = fma(_423, (*spvDescriptorSet0.vp_c3)._m0[15].y, _431);
    float _445 = _411 * _441;
    float _447 = _397 * _441;
    float _449 = fma(_395, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float _451 = _419 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float _453 = _132 + _445;
    float _455 = fma(_429, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float _457 = fma(_447, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float _459 = _437 * _451;
    float _461 = _132 + _359;
    float _463 = _443 * _451;
    float _465 = _132 + _375;
    float _467 = _439 * (*spvDescriptorSet0.vp_c3)._m0[15].w;
    float2 _2161 = float2(_461, _371);
    float _469 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2161, float2(0.0), isnan(_2161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2161, float2(0.0), isnan(_2161)), level(0.0)).x;
    float _471 = _132 + _459;
    float _473 = _423 * _467;
    float _475 = _417 * _467;
    float2 _2178 = float2(_465, _391);
    float _477 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2178, float2(0.0), isnan(_2178)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2178, float2(0.0), isnan(_2178)), level(0.0)).x;
    float2 _2186 = float2(_413, _449);
    float _479 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2186, float2(0.0), isnan(_2186)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2186, float2(0.0), isnan(_2186)), level(0.0)).x;
    float2 _2194 = float2(_433, _455);
    float _481 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2194, float2(0.0), isnan(_2194)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2194, float2(0.0), isnan(_2194)), level(0.0)).x;
    float2 _2202 = float2(_453, _457);
    float _483 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2202, float2(0.0), isnan(_2202)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2202, float2(0.0), isnan(_2202)), level(0.0)).x;
    float _485 = _132 + _473;
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float _489 = fma(_463, (*spvDescriptorSet0.vp_c3)._m0[14].z, _134);
    float2 _2223 = float2(_485, _487);
    float _491 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2223, float2(0.0), isnan(_2223)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2223, float2(0.0), isnan(_2223)), level(0.0)).x;
    float2 _2231 = float2(_471, _489);
    float _493 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_2231, float2(0.0), isnan(_2231)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_2231, float2(0.0), isnan(_2231)), level(0.0)).x;
    float _495 = -_469;
    float _497 = fma(_154, _495, 1.0);
    float _499 = 1.0 / _497;
    float _501 = _499 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _503 = -_82;
    bool _505 = _501 > _503;
    int _507 = as_type<int>(_501);
    int _509 = as_type<int>(_499);
    int _511 = as_type<int>(_265);
    int _513 = as_type<int>(_359);
    int _515 = as_type<int>(_269);
    float _517 = _261;
    int _519 = _263;
    float _521 = _267;
    float _523 = _261;
    int _525 = as_type<int>(_265);
    int _527 = _263;
    float _529 = _269;
    float _531 = _267;
    int _533 = as_type<int>(_259);
    int _535 = as_type<int>(_273);
    int _537 = as_type<int>(_375);
    int _539 = as_type<int>(_273);
    int _541 = as_type<int>(_279);
    int _543 = as_type<int>(_393);
    int _545 = as_type<int>(_279);
    int _547 = as_type<int>(_425);
    int _549 = as_type<int>(_445);
    int _551 = as_type<int>(_473);
    int _553 = as_type<int>(_459);
    if (!_505)
    {
        _507 = as_type<int>(_259);
    }
    int _555 = _507;
    bool _557 = !_505;
    int _559 = _555;
    float _561 = as_type<float>(_555);
    if (!_557)
    {
        bool _563 = _271 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _565 = isnan(_271);
        bool _567 = _563 || _565;
        bool _569 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _571 = _567 || _569;
        float _573 = _261 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _575 = _359 > 0.0;
        bool _577 = _361 > 0.0;
        out.m_34.x = _573;
        if (_571)
        {
            _509 = _263;
        }
        int _579 = _509;
        int _581 = _579;
        if (!_571)
        {
            float _583 = as_type<float>(_263) + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _581 = as_type<int>(_583);
        }
        int _585 = _581;
        if (!_575)
        {
            float _587 = -_359;
            float _589 = fma(_587, (*spvDescriptorSet0.vp_c3)._m0[16].w, _265);
            _511 = as_type<int>(_589);
        }
        int _591 = _511;
        _525 = _591;
        if (_575)
        {
            float _593 = fma(_359, (*spvDescriptorSet0.vp_c3)._m0[16].w, _267);
            _513 = as_type<int>(_593);
        }
        int _595 = _513;
        float _597 = as_type<float>(_595);
        if (!_577)
        {
            float _599 = -_361;
            float _601 = fma(_599, (*spvDescriptorSet0.vp_c3)._m0[16].w, _269);
            _515 = as_type<int>(_601);
        }
        int _603 = _515;
        _529 = as_type<float>(_603);
        if (_577)
        {
            float _605 = fma(_361, (*spvDescriptorSet0.vp_c3)._m0[16].w, _259);
            _559 = as_type<int>(_605);
        }
        int _607 = _559;
        float _609 = as_type<float>(_607);
        if (!_571)
        {
            out.m_36.x = as_type<float>(_585);
        }
        if (_577)
        {
            _517 = _573;
        }
        float _611 = _517;
        float _613 = _611;
        if (_577)
        {
            _519 = _585;
        }
        int _615 = _519;
        int _617 = _615;
        if (!_575)
        {
            out.m_40.x = as_type<float>(_591);
        }
        if (!_577)
        {
            _613 = _573;
        }
        float _619 = _613;
        _523 = _619;
        if (!_577)
        {
            _617 = _585;
        }
        int _621 = _617;
        _527 = _621;
        if (!_577)
        {
            out.m_38.y = as_type<float>(_603);
        }
        if (_575)
        {
            out.m_38.x = as_type<float>(_595);
        }
        if (_577)
        {
            out.m_40.y = as_type<float>(_607);
        }
        if (!_575)
        {
            _597 = _267;
        }
        float _623 = _597;
        if (_577)
        {
            _521 = _623;
        }
        float _625 = _521;
        _531 = _625;
        if (!_577)
        {
            _609 = _259;
        }
        float _627 = _609;
        _561 = _627;
        if (!_577)
        {
            _531 = _623;
        }
    }
    float _629 = _561;
    float _631 = _523;
    int _633 = _525;
    int _635 = _527;
    float _637 = _529;
    float _639 = _531;
    float _641 = -_477;
    float _643 = fma(_154, _641, 1.0);
    float _645 = 1.0 / _643;
    float _647 = _645 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _649 = -_82;
    bool _651 = _647 > _649;
    int _653 = as_type<int>(_647);
    int _655 = as_type<int>(_637);
    float _657 = _631;
    int _659 = _633;
    int _661 = _635;
    float _663 = _639;
    float _665 = _631;
    int _667 = _633;
    int _669 = _635;
    float _671 = _637;
    float _673 = _639;
    if (!_651)
    {
        _533 = as_type<int>(_629);
    }
    int _675 = _533;
    bool _677 = !_651;
    int _679 = _675;
    float _681 = as_type<float>(_675);
    if (!_677)
    {
        bool _683 = _375 > 0.0;
        float _685 = _631 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _687 = _273 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _689 = isnan(_273);
        bool _691 = _687 || _689;
        bool _693 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _695 = _691 || _693;
        bool _697 = _377 > 0.0;
        out.m_34.x = _685;
        if (_683)
        {
            _535 = _633;
        }
        int _699 = _535;
        int _701 = _699;
        if (!_683)
        {
            float _703 = -_375;
            float _705 = fma(_703, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_633));
            _701 = as_type<int>(_705);
        }
        int _707 = _701;
        _539 = _707;
        if (_695)
        {
            _653 = _635;
        }
        int _709 = _653;
        int _711 = _709;
        if (!_695)
        {
            float _713 = as_type<float>(_635) + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _711 = as_type<int>(_713);
        }
        int _715 = _711;
        if (!_697)
        {
            float _717 = -_377;
            float _719 = fma(_717, (*spvDescriptorSet0.vp_c3)._m0[16].w, _637);
            _655 = as_type<int>(_719);
        }
        int _721 = _655;
        _671 = as_type<float>(_721);
        if (_683)
        {
            float _723 = fma(_375, (*spvDescriptorSet0.vp_c3)._m0[16].w, _639);
            _537 = as_type<int>(_723);
        }
        int _725 = _537;
        float _727 = as_type<float>(_725);
        if (!_683)
        {
            out.m_40.x = as_type<float>(_707);
        }
        if (_697)
        {
            float _729 = fma(_377, (*spvDescriptorSet0.vp_c3)._m0[16].w, _629);
            _679 = as_type<int>(_729);
        }
        int _731 = _679;
        float _733 = as_type<float>(_731);
        if (_697)
        {
            _657 = _685;
        }
        float _735 = _657;
        float _737 = _735;
        if (!_697)
        {
            out.m_38.y = as_type<float>(_721);
        }
        if (_697)
        {
            _659 = _707;
        }
        int _739 = _659;
        int _741 = _739;
        if (_697)
        {
            _661 = _715;
        }
        int _743 = _661;
        int _745 = _743;
        if (!_695)
        {
            out.m_36.x = as_type<float>(_715);
        }
        if (!_697)
        {
            _737 = _685;
        }
        float _747 = _737;
        _665 = _747;
        if (!_697)
        {
            _741 = _707;
        }
        int _749 = _741;
        _667 = _749;
        if (_683)
        {
            out.m_38.x = as_type<float>(_725);
        }
        if (!_697)
        {
            _745 = _715;
        }
        int _751 = _745;
        _669 = _751;
        if (_697)
        {
            out.m_40.y = as_type<float>(_731);
        }
        if (!_683)
        {
            _727 = _639;
        }
        float _753 = _727;
        if (_697)
        {
            _663 = _753;
        }
        float _755 = _663;
        _673 = _755;
        if (!_697)
        {
            _733 = _629;
        }
        float _757 = _733;
        _681 = _757;
        if (!_697)
        {
            _673 = _753;
        }
    }
    float _759 = _681;
    float _761 = _665;
    int _763 = _667;
    int _765 = _669;
    float _767 = _671;
    float _769 = _673;
    int _771 = _539;
    float _773 = -_479;
    float _775 = fma(_154, _773, 1.0);
    float _777 = 1.0 / _775;
    float _779 = _777 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _781 = -_82;
    bool _783 = _779 > _781;
    int _785 = _771;
    int _787 = as_type<int>(_779);
    int _789 = as_type<int>(_767);
    float _791 = _761;
    int _793 = _763;
    int _795 = _765;
    float _797 = _769;
    float _799 = _761;
    int _801 = _763;
    int _803 = _765;
    float _805 = _767;
    float _807 = _769;
    int _809 = as_type<int>(_759);
    if (!_783)
    {
        _785 = as_type<int>(_759);
    }
    int _811 = _785;
    bool _813 = !_783;
    int _815 = _811;
    float _817 = as_type<float>(_811);
    if (!_813)
    {
        bool _819 = _393 > 0.0;
        float _821 = _761 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _823 = _279 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _825 = isnan(_279);
        bool _827 = _823 || _825;
        bool _829 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _831 = _827 || _829;
        bool _833 = _395 > 0.0;
        out.m_34.x = _821;
        if (_819)
        {
            _541 = _763;
        }
        int _835 = _541;
        int _837 = _835;
        if (!_819)
        {
            float _839 = -_393;
            float _841 = fma(_839, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_763));
            _837 = as_type<int>(_841);
        }
        int _843 = _837;
        _545 = _843;
        if (_831)
        {
            _787 = _765;
        }
        int _845 = _787;
        int _847 = _845;
        if (!_831)
        {
            float _849 = as_type<float>(_765) + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _847 = as_type<int>(_849);
        }
        int _851 = _847;
        if (!_833)
        {
            float _853 = -_395;
            float _855 = fma(_853, (*spvDescriptorSet0.vp_c3)._m0[16].w, _767);
            _789 = as_type<int>(_855);
        }
        int _857 = _789;
        _805 = as_type<float>(_857);
        if (_819)
        {
            float _859 = fma(_393, (*spvDescriptorSet0.vp_c3)._m0[16].w, _769);
            _543 = as_type<int>(_859);
        }
        int _861 = _543;
        float _863 = as_type<float>(_861);
        if (!_819)
        {
            out.m_40.x = as_type<float>(_843);
        }
        if (_833)
        {
            float _865 = fma(_395, (*spvDescriptorSet0.vp_c3)._m0[16].w, _759);
            _815 = as_type<int>(_865);
        }
        int _867 = _815;
        float _869 = as_type<float>(_867);
        if (_833)
        {
            _791 = _821;
        }
        float _871 = _791;
        float _873 = _871;
        if (!_833)
        {
            out.m_38.y = as_type<float>(_857);
        }
        if (_833)
        {
            _793 = _843;
        }
        int _875 = _793;
        int _877 = _875;
        if (_833)
        {
            _795 = _851;
        }
        int _879 = _795;
        int _881 = _879;
        if (!_831)
        {
            out.m_36.x = as_type<float>(_851);
        }
        if (!_833)
        {
            _873 = _821;
        }
        float _883 = _873;
        _799 = _883;
        if (!_833)
        {
            _877 = _843;
        }
        int _885 = _877;
        _801 = _885;
        if (_819)
        {
            out.m_38.x = as_type<float>(_861);
        }
        if (!_833)
        {
            _881 = _851;
        }
        int _887 = _881;
        _803 = _887;
        if (_833)
        {
            out.m_40.y = as_type<float>(_867);
        }
        if (!_819)
        {
            _863 = _769;
        }
        float _889 = _863;
        if (_833)
        {
            _797 = _889;
        }
        float _891 = _797;
        _807 = _891;
        if (!_833)
        {
            _869 = _759;
        }
        float _893 = _869;
        _817 = _893;
        if (!_833)
        {
            _807 = _889;
        }
    }
    float _895 = _817;
    float _897 = _799;
    int _899 = _801;
    int _901 = _803;
    float _903 = _805;
    float _905 = _807;
    int _907 = _545;
    float _909 = -_481;
    float _911 = fma(_154, _909, 1.0);
    float _913 = 1.0 / _911;
    float _915 = _913 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _917 = -_82;
    bool _919 = _915 > _917;
    int _921 = _907;
    int _923 = as_type<int>(_915);
    int _925 = as_type<int>(_903);
    float _927 = _897;
    int _929 = _899;
    int _931 = _901;
    float _933 = _905;
    float _935 = _897;
    int _937 = _899;
    int _939 = _901;
    float _941 = _903;
    float _943 = _905;
    int _945 = as_type<int>(_895);
    if (!_919)
    {
        _809 = as_type<int>(_895);
    }
    int _947 = _809;
    bool _949 = !_919;
    int _951 = _947;
    float _953 = as_type<float>(_947);
    if (!_949)
    {
        bool _955 = _425 > 0.0;
        bool _957 = _281 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _959 = isnan(_281);
        bool _961 = _957 || _959;
        bool _963 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _965 = _961 || _963;
        float _967 = _897 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _969 = _429 > 0.0;
        out.m_34.x = _967;
        if (_955)
        {
            _921 = _899;
        }
        int _971 = _921;
        int _973 = _971;
        if (!_955)
        {
            float _975 = -_425;
            float _977 = fma(_975, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_899));
            _973 = as_type<int>(_977);
        }
        int _979 = _973;
        if (_965)
        {
            _923 = _901;
        }
        int _981 = _923;
        int _983 = _981;
        if (!_965)
        {
            float _985 = as_type<float>(_901) + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _983 = as_type<int>(_985);
        }
        int _987 = _983;
        if (!_969)
        {
            float _989 = -_429;
            float _991 = fma(_989, (*spvDescriptorSet0.vp_c3)._m0[16].w, _903);
            _925 = as_type<int>(_991);
        }
        int _993 = _925;
        _941 = as_type<float>(_993);
        if (_955)
        {
            float _995 = fma(_425, (*spvDescriptorSet0.vp_c3)._m0[16].w, _905);
            _547 = as_type<int>(_995);
        }
        int _997 = _547;
        float _999 = as_type<float>(_997);
        if (!_955)
        {
            out.m_40.x = as_type<float>(_979);
        }
        if (_969)
        {
            float _1001 = fma(_429, (*spvDescriptorSet0.vp_c3)._m0[16].w, _895);
            _951 = as_type<int>(_1001);
        }
        int _1003 = _951;
        float _1005 = as_type<float>(_1003);
        if (_969)
        {
            _927 = _967;
        }
        float _1007 = _927;
        float _1009 = _1007;
        if (!_969)
        {
            out.m_38.y = as_type<float>(_993);
        }
        if (_969)
        {
            _929 = _979;
        }
        int _1011 = _929;
        int _1013 = _1011;
        if (_969)
        {
            _931 = _987;
        }
        int _1015 = _931;
        int _1017 = _1015;
        if (!_965)
        {
            out.m_36.x = as_type<float>(_987);
        }
        if (!_969)
        {
            _1009 = _967;
        }
        float _1019 = _1009;
        _935 = _1019;
        if (!_969)
        {
            _1013 = _979;
        }
        int _1021 = _1013;
        _937 = _1021;
        if (_955)
        {
            out.m_38.x = as_type<float>(_997);
        }
        if (!_969)
        {
            _1017 = _987;
        }
        int _1023 = _1017;
        _939 = _1023;
        if (_969)
        {
            out.m_40.y = as_type<float>(_1003);
        }
        if (!_955)
        {
            _999 = _905;
        }
        float _1025 = _999;
        if (_969)
        {
            _933 = _1025;
        }
        float _1027 = _933;
        _943 = _1027;
        if (!_969)
        {
            _1005 = _895;
        }
        float _1029 = _1005;
        _953 = _1029;
        if (!_969)
        {
            _943 = _1025;
        }
    }
    float _1031 = _953;
    float _1033 = _935;
    int _1035 = _937;
    int _1037 = _939;
    float _1039 = _941;
    float _1041 = _943;
    float _1043 = -_483;
    float _1045 = fma(_154, _1043, 1.0);
    float _1047 = -_491;
    float _1049 = fma(_154, _1047, 1.0);
    float _1051 = -_493;
    float _1053 = fma(_154, _1051, 1.0);
    float _1055 = 1.0 / _1045;
    float _1057 = 1.0 / _1049;
    float _1059 = 1.0 / _1053;
    float _1061 = _1055 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _1063 = -_82;
    bool _1065 = _1061 > _1063;
    float _1067 = _1057 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    float _1069 = -_82;
    bool _1071 = _1067 > _1069;
    float _1073 = _1059 * (*spvDescriptorSet0.vp_c3)._m0[14].x;
    int _1075 = as_type<int>(_1067);
    int _1077 = as_type<int>(_1073);
    int _1079 = as_type<int>(_1039);
    float _1081 = _1033;
    int _1083 = _1035;
    int _1085 = _1037;
    float _1087 = _1041;
    int _1089 = as_type<int>(_1039);
    float _1091 = _1033;
    int _1093 = _1035;
    int _1095 = _1037;
    float _1097 = _1041;
    int _1099 = as_type<int>(_1073);
    int _1101 = as_type<int>(_1031);
    if (!_1065)
    {
        _1075 = as_type<int>(_1031);
    }
    int _1103 = _1075;
    float _1105 = -_82;
    bool _1107 = _1073 > _1105;
    bool _1109 = !_1065;
    int _1111 = _1103;
    float _1113 = as_type<float>(_1103);
    if (!_1109)
    {
        bool _1115 = _445 > 0.0;
        float _1117 = _1033 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _1119 = _283 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _1121 = isnan(_283);
        bool _1123 = _1119 || _1121;
        bool _1125 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _1127 = _1123 || _1125;
        bool _1129 = _447 > 0.0;
        out.m_34.x = _1117;
        _945 = as_type<int>(_1117);
        if (_1115)
        {
            _1077 = _1035;
        }
        int _1131 = _1077;
        int _1133 = _1131;
        if (!_1115)
        {
            float _1135 = -_445;
            float _1137 = fma(_1135, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_1035));
            _1133 = as_type<int>(_1137);
        }
        int _1139 = _1133;
        _1099 = _1139;
        if (_1127)
        {
            _177 = _1037;
        }
        int _1141 = _177;
        int _1143 = _1141;
        if (!_1127)
        {
            float _1145 = as_type<float>(_1037) + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _1143 = as_type<int>(_1145);
        }
        int _1147 = _1143;
        _179 = _1147;
        if (!_1129)
        {
            float _1149 = -_447;
            float _1151 = fma(_1149, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1039);
            _1079 = as_type<int>(_1151);
        }
        int _1153 = _1079;
        _1089 = _1153;
        if (_1115)
        {
            float _1155 = fma(_445, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1041);
            _549 = as_type<int>(_1155);
        }
        int _1157 = _549;
        float _1159 = as_type<float>(_1157);
        if (!_1115)
        {
            out.m_40.x = as_type<float>(_1139);
        }
        if (_1129)
        {
            float _1161 = fma(_447, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1031);
            _1111 = as_type<int>(_1161);
        }
        int _1163 = _1111;
        float _1165 = as_type<float>(_1163);
        if (_1129)
        {
            _1081 = _1117;
        }
        float _1167 = _1081;
        float _1169 = _1167;
        if (!_1129)
        {
            out.m_38.y = as_type<float>(_1153);
        }
        if (_1129)
        {
            _1083 = _1139;
        }
        int _1171 = _1083;
        int _1173 = _1171;
        if (_1129)
        {
            _1085 = _1147;
        }
        int _1175 = _1085;
        int _1177 = _1175;
        if (!_1127)
        {
            out.m_36.x = as_type<float>(_1147);
        }
        if (!_1129)
        {
            _1169 = _1117;
        }
        float _1179 = _1169;
        _1091 = _1179;
        if (!_1129)
        {
            _1173 = _1139;
        }
        int _1181 = _1173;
        _1093 = _1181;
        if (_1115)
        {
            out.m_38.x = as_type<float>(_1157);
        }
        if (!_1129)
        {
            _1177 = _1147;
        }
        int _1183 = _1177;
        _1095 = _1183;
        if (_1129)
        {
            out.m_40.y = as_type<float>(_1163);
        }
        if (!_1115)
        {
            _1159 = _1041;
        }
        float _1185 = _1159;
        if (_1129)
        {
            _1087 = _1185;
        }
        float _1187 = _1087;
        _1097 = _1187;
        if (!_1129)
        {
            _1165 = _1031;
        }
        float _1189 = _1165;
        _1113 = _1189;
        if (!_1129)
        {
            _1097 = _1185;
        }
    }
    int _1191 = _1089;
    float _1193 = _1113;
    float _1195 = _1091;
    int _1197 = _1093;
    int _1199 = _1095;
    int _1201 = _945;
    float _1203 = _1097;
    int _1205 = _179;
    int _1207 = _1099;
    int _1209 = _1207;
    int _1211 = _1201;
    int _1213 = _1205;
    float _1215 = _1195;
    float _1217 = as_type<float>(_1197);
    float _1219 = as_type<float>(_1199);
    float _1221 = _1203;
    float _1223 = _1195;
    float _1225 = _1203;
    float _1227 = as_type<float>(_1197);
    float _1229 = as_type<float>(_1199);
    int _1231 = _1191;
    int _1233 = as_type<int>(_1193);
    if (!_1071)
    {
        _1101 = _1191;
    }
    int _1235 = _1101;
    int _1237 = _1235;
    float _1239 = as_type<float>(_1235);
    if (!_1071)
    {
        _1209 = as_type<int>(_1193);
    }
    int _1241 = _1209;
    bool _1243 = !_1071;
    int _1245 = _1241;
    float _1247 = as_type<float>(_1241);
    if (!_1243)
    {
        bool _1249 = _473 > 0.0;
        float _1251 = _1195 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
        bool _1253 = _475 > 0.0;
        bool _1255 = _285 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
        bool _1257 = isnan(_285);
        bool _1259 = _1255 || _1257;
        bool _1261 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
        bool _1263 = _1259 || _1261;
        out.m_34.x = _1251;
        if (_1249)
        {
            _1211 = _1197;
        }
        int _1265 = _1211;
        int _1267 = _1265;
        if (!_1249)
        {
            float _1269 = -_473;
            float _1271 = fma(_1269, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_1197));
            _1267 = as_type<int>(_1271);
        }
        int _1273 = _1267;
        if (_1253)
        {
            _1237 = _1191;
        }
        int _1275 = _1237;
        int _1277 = _1275;
        if (!_1253)
        {
            float _1279 = -_475;
            float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c3)._m0[16].w, as_type<float>(_1191));
            _1277 = as_type<int>(_1281);
        }
        int _1283 = _1277;
        _1239 = as_type<float>(_1283);
        if (_1263)
        {
            _1213 = _1199;
        }
        int _1285 = _1213;
        int _1287 = _1285;
        if (!_1263)
        {
            float _1289 = as_type<float>(_1199) + (*spvDescriptorSet0.vp_c3)._m0[16].z;
            _1287 = as_type<int>(_1289);
        }
        int _1291 = _1287;
        if (!_1249)
        {
            out.m_40.x = as_type<float>(_1273);
        }
        if (_1249)
        {
            float _1293 = fma(_473, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1203);
            _551 = as_type<int>(_1293);
        }
        int _1295 = _551;
        float _1297 = as_type<float>(_1295);
        if (_1253)
        {
            float _1299 = fma(_475, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1193);
            _1245 = as_type<int>(_1299);
        }
        int _1301 = _1245;
        float _1303 = as_type<float>(_1301);
        if (_1253)
        {
            _1215 = _1251;
        }
        float _1305 = _1215;
        float _1307 = _1305;
        if (!_1253)
        {
            out.m_38.y = as_type<float>(_1283);
        }
        if (_1253)
        {
            _1217 = as_type<float>(_1273);
        }
        float _1309 = _1217;
        float _1311 = _1309;
        if (_1253)
        {
            _1219 = as_type<float>(_1291);
        }
        float _1313 = _1219;
        float _1315 = _1313;
        if (!_1263)
        {
            out.m_36.x = as_type<float>(_1291);
        }
        if (!_1253)
        {
            _1307 = _1251;
        }
        float _1317 = _1307;
        _1223 = _1317;
        if (!_1253)
        {
            _1311 = as_type<float>(_1273);
        }
        float _1319 = _1311;
        _1227 = _1319;
        if (_1249)
        {
            out.m_38.x = as_type<float>(_1295);
        }
        if (!_1253)
        {
            _1315 = as_type<float>(_1291);
        }
        float _1321 = _1315;
        _1229 = _1321;
        if (_1253)
        {
            out.m_40.y = as_type<float>(_1301);
        }
        if (!_1249)
        {
            _1297 = _1203;
        }
        float _1323 = _1297;
        if (_1253)
        {
            _1221 = _1323;
        }
        float _1325 = _1221;
        _1225 = _1325;
        if (!_1253)
        {
            _1303 = _1193;
        }
        float _1327 = _1303;
        _1247 = _1327;
        if (!_1253)
        {
            _1225 = _1323;
        }
    }
    float _1329 = _1223;
    float _1331 = _1225;
    float _1333 = _1227;
    float _1335 = _1229;
    float _1337 = _1247;
    float _1339 = _1239;
    int _1341 = as_type<int>(_1337);
    if (!_1107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _1343 = _459 > 0.0;
    float _1345 = _1329 + (*spvDescriptorSet0.vp_c3)._m0[16].y;
    bool _1347 = _287 >= (*spvDescriptorSet0.vp_c3)._m0[16].x;
    bool _1349 = isnan(_287);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c3)._m0[16].x);
    bool _1355 = _1351 || _1353;
    bool _1357 = _463 > 0.0;
    out.m_34.x = _1345;
    if (_1343)
    {
        float _1359 = fma(_459, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1331);
        _1231 = as_type<int>(_1359);
    }
    int _1361 = _1231;
    if (!_1343)
    {
        float _1363 = -_459;
        float _1365 = fma(_1363, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1333);
        _553 = as_type<int>(_1365);
    }
    int _1367 = _553;
    if (!_1355)
    {
        float _1369 = _1335 + (*spvDescriptorSet0.vp_c3)._m0[16].z;
        _1233 = as_type<int>(_1369);
    }
    int _1371 = _1233;
    if (_1357)
    {
        float _1373 = fma(_463, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1337);
        _1341 = as_type<int>(_1373);
    }
    int _1375 = _1341;
    if (_1343)
    {
        out.m_38.x = as_type<float>(_1361);
    }
    if (!_1355)
    {
        out.m_36.x = as_type<float>(_1371);
    }
    if (!_1343)
    {
        out.m_40.x = as_type<float>(_1367);
    }
    if (_1357)
    {
        out.m_40.y = as_type<float>(_1375);
    }
    if (_1357)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1377 = -_463;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c3)._m0[16].w, _1339);
    out.m_38.y = _1379;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_36.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_36.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_36.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_36.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_34.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_34.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_34.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_34.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

