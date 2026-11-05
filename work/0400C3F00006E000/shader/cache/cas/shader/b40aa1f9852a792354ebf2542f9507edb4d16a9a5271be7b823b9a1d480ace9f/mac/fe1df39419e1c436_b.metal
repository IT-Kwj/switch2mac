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
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c10 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_41 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_33.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_33.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _555 = float2(_77, _79);
    float4 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_555, float2(0.0), isnan(_555))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_555, float2(0.0), isnan(_555))).xyzw;
    float _84 = _82.x;
    float _86 = _82.y;
    float _88 = _82.z;
    float _90 = _82.w;
    float _92 = in.m_35.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _100 = in.m_35.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_35.z;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_41.y;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_41.x;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_41.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_43.y;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_45.w;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_43.w;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_47.x;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_43.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_47.y;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_43.z;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _174 = _172 + 1.0;
    float _176 = _75 * _96;
    bool _179 = as_type<int>(_98) != 0;
    float _181 = _75 * _104;
    bool _183 = !_179;
    float _185 = -_176;
    float _187 = _183 ? _185 : _176;
    float _189 = _75 * _110;
    bool _191 = !_179;
    float _193 = -_181;
    float _195 = _191 ? _193 : _181;
    float _197 = _75 * _128;
    float _199 = _187 * _187;
    bool _201 = !_179;
    float _203 = -_189;
    float _205 = _201 ? _203 : _189;
    float _207 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _209 = _197 + _207;
    float _211 = in.m_49.w;
    float _213 = gl_FragCoord.w;
    float _215 = _211 * _213;
    float _217 = fma(_195, _195, _199);
    float _219 = fma(_205, _205, _217);
    float _221 = rsqrt(_219);
    float _223 = _75 * _122;
    float _225 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _227 = _223 + _225;
    float _229 = _187 * _221;
    float _231 = _195 * _221;
    float _233 = _205 * _221;
    float _235 = _229 * _229;
    float _237 = _75 * _215;
    float _239 = fma(_231, _231, _235);
    float _241 = _75 * _116;
    float _243 = in.m_51.x;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = fma(_233, _233, _239);
    float _251 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _253 = _241 + _251;
    float _255 = _237 * (*spvDescriptorSet0.fp_c10)._m0[3].x;
    float _257 = rsqrt(_249);
    float _259 = _253 * _253;
    bool _261 = _255 != 1.0;
    bool _263 = isnan(_255);
    bool _265 = _261 || _263;
    bool _267 = isnan(1.0);
    bool _269 = _265 || _267;
    float _271 = fma(_227, _227, _259);
    float _273 = fma(_209, _209, _271);
    float _275 = rsqrt(_273);
    float _277 = _229 * _257;
    float _279 = _231 * _257;
    float _281 = _233 * _257;
    float _283 = _277 * _277;
    float _285 = in.m_47.w;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = fma(_279, _279, _283);
    float _293 = _75 * _247;
    float _295 = fma(_281, _281, _291);
    float _297 = _253 * _275;
    float _299 = in.m_47.z;
    float _301 = gl_FragCoord.w;
    float _303 = _299 * _301;
    float _305 = _227 * _275;
    float _307 = _209 * _275;
    float _309 = rsqrt(_295);
    float _311 = _75 * _140;
    float _313 = _277 * _309;
    float _315 = _279 * _309;
    float _317 = _75 * _164;
    float _319 = _313 * _297;
    float _321 = _281 * _309;
    float _323 = _75 * _134;
    float _325 = _75 * _152;
    float _327 = fma(_315, _305, _319);
    float _329 = _321 * 0.577381789684295654296875;
    float _331 = _75 * _146;
    float _333 = _75 * _158;
    float _335 = _75 * _303;
    float _337 = fma(_313, 0.816474258899688720703125, _329);
    float _339 = fma(_313, 0.5, 0.5);
    float _341 = _75 * _170;
    float _343 = _75 * _289;
    float _345 = 0.0 + _337;
    float _347 = precise::clamp(_345, 0.0, 1.0);
    float _349 = fma(_321, _307, _327);
    float _351 = fma(_339, -0.1500000059604644775390625, 0.5);
    float _353 = fma(_339, 0.25, 0.5);
    float _355 = fma(_347, _174, (*spvDescriptorSet0.fp_c9)._m0[194].z);
    float _357 = fma(_339, 0.1500000059604644775390625, 0.5);
    float _359 = fma(_339, -0.25, 0.5);
    float _361 = fma(_339, 0.7000000476837158203125, 0.5);
    float _363 = fma(_339, -0.7000000476837158203125, 0.5);
    float _365 = fma(_337, 0.5, 0.5);
    float _367 = fma(_355, _357, _351);
    float _369 = precise::clamp(_367, 0.0, 1.0);
    float _371 = fma(_355, _359, _353);
    float _373 = precise::clamp(_371, 0.0, 1.0);
    float _375 = fma(_355, _363, _361);
    float _377 = precise::clamp(_375, 0.0, 1.0);
    float _379 = abs(_349);
    float _381 = -_379;
    float _383 = _381 + 1.0;
    float _385 = _383 * _383;
    float _387 = _385 * _365;
    float _389 = -_84;
    float _391 = _389 + 1.0;
    float _393 = -_86;
    float _395 = _393 + 1.0;
    float _397 = -_88;
    float _399 = _397 + 1.0;
    float _401 = -_331;
    float _403 = fma(_90, _311, _401);
    float _405 = _325 * _391;
    float _407 = _317 * _395;
    float _409 = _335 * _399;
    float _411 = _343 * _403;
    float _413 = precise::clamp(_411, 0.0, 1.0);
    float _415 = fma(_84, _333, _405);
    float _417 = fma(_86, _323, _407);
    float _419 = fma(_88, _341, _409);
    float _421 = _413 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _423 = precise::clamp(_421, 0.0, 1.0);
    float _425 = fma(_415, _387, _415);
    float _427 = precise::clamp(_425, 0.0, 1.0);
    float _429 = fma(_417, _387, _417);
    float _431 = precise::clamp(_429, 0.0, 1.0);
    float _433 = fma(_419, _387, _419);
    float _435 = precise::clamp(_433, 0.0, 1.0);
    float _437 = _423 * _293;
    float _439 = _369 * _427;
    float _441 = precise::clamp(_439, 0.0, 1.0);
    float _443 = _373 * _431;
    float _445 = precise::clamp(_443, 0.0, 1.0);
    float _447 = _377 * _435;
    float _449 = precise::clamp(_447, 0.0, 1.0);
    bool _451 = !_269;
    if (!_451)
    {
        float _453 = gl_FragCoord.x;
        float _455 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _457 = _453 / _455;
        float _459 = gl_FragCoord.y;
        float _461 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _463 = _459 / _461;
        float _465 = trunc(_457);
        int _468 = int(_465);
        float _470 = trunc(_463);
        int _472 = int(_470);
        int _474 = _468 + 2;
        int _476 = _474 >> 1;
        uint _479 = uint(int(uint(_472) >> uint(1)));
        int _481 = _476 ^ int(_479);
        int _483 = _481 << 16;
        int _485 = _483 ^ _476;
        int _487 = 983055 & _485;
        float _489 = _255 * 256.0;
        int _491 = _487 << 6;
        int _493 = _491 + _487;
        float _495 = trunc(_489);
        int _497 = int(_495);
        int _499 = _493 & 13369548;
        uint _501 = uint(int(uint(_499) >> uint(3)));
        int _503 = _499 | int(_501);
        int _505 = _503 & 5570560;
        int _507 = _503 & 85;
        uint _509 = uint(int(uint(_497) >> uint(7)));
        int _511 = int(_509) + _497;
        uint _513 = uint(int(uint(_505) >> uint(15)));
        int _515 = int(_513) + _507;
        bool _517 = uint(_511) > uint(_515);
        if (!_517)
        {
            discard_fragment();
        }
        if (!_517)
        {
            out.m_54.x = _441;
            out.m_54.y = _445;
            out.m_54.z = _449;
            out.m_54.w = _437;
            return out;
        }
    }
    float _519 = 0.0 + _437;
    float _521 = precise::clamp(_519, 0.0, 1.0);
    out.m_54.x = 1.0;
    out.m_54.y = 1.0;
    out.m_54.z = 1.0;
    out.m_54.w = _521;
    return out;
}

