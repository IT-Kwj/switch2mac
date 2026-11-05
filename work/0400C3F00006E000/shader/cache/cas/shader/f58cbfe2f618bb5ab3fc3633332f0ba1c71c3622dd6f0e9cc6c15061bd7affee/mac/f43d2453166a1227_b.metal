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
    constant _16* fp_c3 [[id(0)]];
    texture2d_array<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.z;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _39;
    float _61 = _59 * _45;
    float _63 = _59 * _51;
    float _65 = _59 * _57;
    float _67 = rint(_61);
    float _69 = precise::max(_67, 0.0);
    uint _72 = uint(_69);
    uint _74 = clamp(_72, 0u, 65535u);
    float3 _917 = float3(_63, _65, float(int(_74)));
    float3 _921 = select(_917, float3(0.0), isnan(_917));
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _921.xy, uint(rint(_921.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _921.xy, uint(rint(_921.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)).x;
    float3 _935 = float3(_63, _65, float(int(_74)));
    float3 _937 = select(_935, float3(0.0), isnan(_935));
    float _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _937.xy, uint(rint(_937.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _937.xy, uint(rint(_937.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)).x;
    float3 _949 = float3(_63, _65, float(int(_74)));
    float3 _951 = select(_949, float3(0.0), isnan(_949));
    float _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _951.xy, uint(rint(_951.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _951.xy, uint(rint(_951.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)).x;
    float3 _963 = float3(_63, _65, float(int(_74)));
    float3 _965 = select(_963, float3(0.0), isnan(_963));
    float _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _965.xy, uint(rint(_965.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _965.xy, uint(rint(_965.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)).x;
    float3 _977 = float3(_63, _65, float(int(_74)));
    float3 _979 = select(_977, float3(0.0), isnan(_977));
    float _84 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _979.xy, uint(rint(_979.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _979.xy, uint(rint(_979.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)).x;
    float3 _991 = float3(_63, _65, float(int(_74)));
    float3 _993 = select(_991, float3(0.0), isnan(_991));
    float _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _993.xy, uint(rint(_993.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _993.xy, uint(rint(_993.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)).x;
    float3 _1005 = float3(_63, _65, float(int(_74)));
    float3 _1007 = select(_1005, float3(0.0), isnan(_1005));
    float _88 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1007.xy, uint(rint(_1007.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1007.xy, uint(rint(_1007.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)).x;
    float3 _1019 = float3(_63, _65, float(int(_74)));
    float3 _1021 = select(_1019, float3(0.0), isnan(_1019));
    float _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1021.xy, uint(rint(_1021.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1021.xy, uint(rint(_1021.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)).x;
    float3 _1033 = float3(_63, _65, float(int(_74)));
    float3 _1035 = select(_1033, float3(0.0), isnan(_1033));
    float _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1035.xy, uint(rint(_1035.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1035.xy, uint(rint(_1035.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)).x;
    float3 _1047 = float3(_63, _65, float(int(_74)));
    float3 _1049 = select(_1047, float3(0.0), isnan(_1047));
    float _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1049.xy, uint(rint(_1049.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1049.xy, uint(rint(_1049.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)).x;
    float3 _1061 = float3(_63, _65, float(int(_74)));
    float3 _1063 = select(_1061, float3(0.0), isnan(_1061));
    float _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1063.xy, uint(rint(_1063.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1063.xy, uint(rint(_1063.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _1074 = float3(_63, _65, float(int(_74)));
    float3 _1076 = select(_1074, float3(0.0), isnan(_1074));
    float _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1076.xy, uint(rint(_1076.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1076.xy, uint(rint(_1076.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)).x;
    float3 _1088 = float3(_63, _65, float(int(_74)));
    float3 _1090 = select(_1088, float3(0.0), isnan(_1088));
    float _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1090.xy, uint(rint(_1090.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1090.xy, uint(rint(_1090.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)).x;
    float3 _1102 = float3(_63, _65, float(int(_74)));
    float3 _1104 = select(_1102, float3(0.0), isnan(_1102));
    float _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1104.xy, uint(rint(_1104.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1104.xy, uint(rint(_1104.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)).x;
    float3 _1116 = float3(_63, _65, float(int(_74)));
    float3 _1118 = select(_1116, float3(0.0), isnan(_1116));
    float _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1118.xy, uint(rint(_1118.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1118.xy, uint(rint(_1118.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)).x;
    float3 _1130 = float3(_63, _65, float(int(_74)));
    float3 _1132 = select(_1130, float3(0.0), isnan(_1130));
    float _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1132.xy, uint(rint(_1132.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1132.xy, uint(rint(_1132.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)).x;
    float _108 = precise::max(_76, _78);
    float _110 = precise::max(_80, _82);
    float _112 = precise::min(_76, _78);
    float _114 = precise::max(_108, _110);
    float _116 = precise::min(_80, _82);
    float _118 = precise::min(_112, _116);
    float _120 = precise::max(_84, _86);
    float _122 = precise::max(_88, _90);
    float _124 = precise::min(_88, _90);
    float _126 = precise::max(_92, _94);
    float _128 = precise::min(_92, _94);
    float _130 = precise::max(_122, _126);
    float _132 = precise::min(_124, _128);
    float _134 = precise::min(_84, _86);
    float _136 = precise::max(_96, _98);
    float _138 = precise::min(_96, _98);
    float _140 = precise::max(_136, _120);
    float _142 = precise::min(_138, _134);
    float _144 = precise::max(_100, _102);
    float _146 = precise::min(_100, _102);
    float _148 = precise::max(_104, _106);
    float _150 = precise::min(_104, _106);
    float _152 = precise::max(_144, _148);
    float _154 = precise::min(_146, _150);
    float _156 = precise::max(_140, _114);
    float _158 = precise::max(_130, _152);
    float _160 = precise::min(_142, _118);
    float _162 = precise::min(_132, _154);
    float _164 = precise::max(_156, _158);
    float _166 = precise::min(_160, _162);
    float _168 = _164 * 255.0;
    float _170 = _166 * 255.0;
    float _172 = trunc(_168);
    float _174 = precise::max(_172, 0.0);
    uint _176 = uint(_174);
    float _178 = trunc(_170);
    float _180 = precise::max(_178, 0.0);
    uint _182 = uint(_180);
    bool _186 = _176 > _182;
    int _189 = int(_182) << 8;
    int _191 = _189 & 65280;
    int _193 = 255 & int(_176);
    int _195 = _191 | _193;
    int _197 = as_type<int>(_160);
    int _199 = as_type<int>(_134);
    int _201 = _191;
    if (!_186)
    {
        _197 = 0;
    }
    int _203 = _197;
    if (!_186)
    {
        _199 = 0;
        _201 = 0;
    }
    int _205 = _199;
    int _207 = _201;
    if (!_186)
    {
        out.m_32.x = as_type<float>(_195);
        out.m_32.y = as_type<float>(_203);
        out.m_32.z = as_type<float>(_205);
        out.m_32.w = as_type<float>(_207);
        return out;
    }
    float _209 = -_166;
    float _211 = _164 + _209;
    float _213 = -_166;
    float _215 = _98 + _213;
    float _217 = -_166;
    float _219 = _96 + _217;
    float _221 = -_166;
    float _223 = _84 + _221;
    float _225 = -_166;
    float _227 = _86 + _225;
    float _229 = -_166;
    float _231 = _76 + _229;
    float _233 = 1.0 / _211;
    float _235 = -_166;
    float _237 = _78 + _235;
    float _239 = -_166;
    float _241 = _80 + _239;
    float _243 = -_166;
    float _245 = _82 + _243;
    float _247 = -_166;
    float _249 = _88 + _247;
    float _251 = -_166;
    float _253 = _90 + _251;
    float _255 = -_166;
    float _257 = _94 + _255;
    float _259 = -_166;
    float _261 = _100 + _259;
    float _263 = -_166;
    float _265 = _102 + _263;
    float _267 = -_166;
    float _269 = _106 + _267;
    float _271 = _215 * _233;
    float _273 = -_166;
    float _275 = _92 + _273;
    float _277 = _219 * _233;
    float _279 = _223 * _233;
    float _281 = _227 * _233;
    float _283 = _275 * _233;
    float _285 = -_166;
    float _287 = _104 + _285;
    float _289 = _231 * _233;
    float _291 = _237 * _233;
    float _293 = _241 * _233;
    float _295 = _245 * _233;
    float _297 = _249 * _233;
    float _299 = _253 * _233;
    float _301 = _257 * _233;
    float _303 = _261 * _233;
    float _305 = _265 * _233;
    float _307 = _287 * _233;
    float _309 = _269 * _233;
    float _311 = -_277;
    float _313 = _311 + 0.5;
    float _315 = fma(_277, -1.99999904632568359375, 1.99999904632568359375);
    float _317 = fma(_277, -7.99999904632568359375, 7.99999904632568359375);
    float _319 = fma(_271, -1.99999904632568359375, 1.99999904632568359375);
    float _321 = fma(_271, -7.99999904632568359375, 7.99999904632568359375);
    float _323 = abs(_313);
    bool _325 = _323 >= 0.375;
    float _327 = -_271;
    float _329 = _327 + 0.5;
    float _331 = fma(_279, -1.99999904632568359375, 1.99999904632568359375);
    float _333 = fma(_279, -7.99999904632568359375, 7.99999904632568359375);
    float _335 = trunc(_315);
    float _337 = precise::max(_335, 0.0);
    uint _339 = uint(_337);
    float _341 = fma(_281, -1.99999904632568359375, 1.99999904632568359375);
    float _343 = abs(_329);
    bool _345 = _343 >= 0.375;
    float _347 = -_279;
    float _349 = _347 + 0.5;
    float _351 = fma(_281, -7.99999904632568359375, 7.99999904632568359375);
    float _353 = fma(_289, -1.99999904632568359375, 1.99999904632568359375);
    float _355 = fma(_289, -7.99999904632568359375, 7.99999904632568359375);
    float _357 = fma(_291, -1.99999904632568359375, 1.99999904632568359375);
    float _359 = trunc(_317);
    float _361 = precise::max(_359, 0.0);
    uint _363 = uint(_361);
    float _365 = abs(_349);
    bool _367 = _365 >= 0.375;
    float _369 = fma(_291, -7.99999904632568359375, 7.99999904632568359375);
    float _371 = fma(_293, -1.99999904632568359375, 1.99999904632568359375);
    float _373 = fma(_293, -7.99999904632568359375, 7.99999904632568359375);
    float _375 = -_281;
    float _377 = _375 + 0.5;
    float _379 = -_289;
    float _381 = _379 + 0.5;
    float _383 = fma(_295, -1.99999904632568359375, 1.99999904632568359375);
    float _385 = trunc(_319);
    float _387 = precise::max(_385, 0.0);
    uint _389 = uint(_387);
    float _391 = fma(_295, -7.99999904632568359375, 7.99999904632568359375);
    float _393 = -_291;
    float _395 = _393 + 0.5;
    float _397 = -_293;
    float _399 = _397 + 0.5;
    float _401 = abs(_377);
    bool _403 = _401 >= 0.375;
    float _405 = fma(_297, -1.99999904632568359375, 1.99999904632568359375);
    float _407 = fma(_297, -7.99999904632568359375, 7.99999904632568359375);
    float _409 = abs(_381);
    bool _411 = _409 >= 0.375;
    float _413 = trunc(_321);
    float _415 = precise::max(_413, 0.0);
    uint _417 = uint(_415);
    float _419 = fma(_299, -1.99999904632568359375, 1.99999904632568359375);
    float _421 = fma(_299, -7.99999904632568359375, 7.99999904632568359375);
    float _423 = -_295;
    float _425 = _423 + 0.5;
    float _427 = abs(_395);
    bool _429 = _427 >= 0.375;
    float _431 = -_297;
    float _433 = _431 + 0.5;
    float _435 = abs(_399);
    bool _437 = _435 >= 0.375;
    float _439 = fma(_283, -1.99999904632568359375, 1.99999904632568359375);
    float _441 = trunc(_331);
    float _443 = precise::max(_441, 0.0);
    uint _445 = uint(_443);
    float _447 = fma(_283, -7.99999904632568359375, 7.99999904632568359375);
    float _449 = fma(_301, -1.99999904632568359375, 1.99999904632568359375);
    float _451 = fma(_301, -7.99999904632568359375, 7.99999904632568359375);
    int _453 = int(_339);
    int _455 = int(_389);
    int _457 = int(_445);
    if (!_325)
    {
        int _459 = int(_363) + 1;
        _453 = _459;
    }
    int _461 = _453;
    float _463 = -_299;
    float _465 = _463 + 0.5;
    float _467 = abs(_425);
    bool _469 = _467 >= 0.375;
    float _471 = fma(_303, -1.99999904632568359375, 1.99999904632568359375);
    float _473 = trunc(_333);
    float _475 = precise::max(_473, 0.0);
    uint _477 = uint(_475);
    if (!_345)
    {
        int _479 = int(_417) + 1;
        _455 = _479;
    }
    int _481 = _455;
    float _483 = fma(_303, -7.99999904632568359375, 7.99999904632568359375);
    float _485 = abs(_433);
    bool _487 = _485 >= 0.375;
    float _489 = fma(_305, -1.99999904632568359375, 1.99999904632568359375);
    float _491 = fma(_305, -7.99999904632568359375, 7.99999904632568359375);
    float _493 = -_283;
    float _495 = _493 + 0.5;
    float _497 = -_301;
    float _499 = _497 + 0.5;
    float _501 = trunc(_341);
    float _503 = precise::max(_501, 0.0);
    uint _505 = uint(_503);
    float _507 = fma(_307, -1.99999904632568359375, 1.99999904632568359375);
    float _509 = -_303;
    float _511 = _509 + 0.5;
    float _513 = -_305;
    float _515 = _513 + 0.5;
    float _517 = fma(_309, -1.99999904632568359375, 1.99999904632568359375);
    int _519 = _481 * 8;
    float _521 = trunc(_351);
    float _523 = precise::max(_521, 0.0);
    uint _525 = uint(_523);
    int _527 = int(_505);
    if (!_367)
    {
        int _529 = int(_477) + 1;
        _457 = _529;
    }
    int _531 = _457;
    float _533 = abs(_465);
    bool _535 = _533 >= 0.375;
    int _537 = _461 | _519;
    int _539 = _531 << 6;
    float _541 = trunc(_353);
    float _543 = precise::max(_541, 0.0);
    uint _545 = uint(_543);
    float _547 = trunc(_355);
    float _549 = precise::max(_547, 0.0);
    uint _551 = uint(_549);
    int _553 = int(_545);
    if (!_403)
    {
        int _555 = int(_525) + 1;
        _527 = _555;
    }
    int _557 = _527;
    float _559 = fma(_307, -7.99999904632568359375, 7.99999904632568359375);
    float _561 = fma(_309, -7.99999904632568359375, 7.99999904632568359375);
    float _563 = abs(_495);
    bool _565 = _563 >= 0.375;
    float _567 = -_307;
    float _569 = _567 + 0.5;
    float _571 = -_309;
    float _573 = _571 + 0.5;
    int _575 = _557 * 512;
    float _577 = trunc(_357);
    float _579 = precise::max(_577, 0.0);
    uint _581 = uint(_579);
    int _583 = _537 | _539;
    int _585 = _575 | _583;
    float _587 = trunc(_369);
    float _589 = precise::max(_587, 0.0);
    uint _591 = uint(_589);
    int _593 = int(_581);
    if (!_411)
    {
        int _595 = int(_551) + 1;
        _553 = _595;
    }
    int _597 = _553;
    float _599 = abs(_499);
    bool _601 = _599 >= 0.375;
    int _603 = _597 * 4096;
    float _605 = trunc(_371);
    float _607 = precise::max(_605, 0.0);
    uint _609 = uint(_607);
    float _611 = trunc(_373);
    float _613 = precise::max(_611, 0.0);
    uint _615 = uint(_613);
    int _617 = int(_609);
    if (!_429)
    {
        int _619 = int(_591) + 1;
        _593 = _619;
    }
    int _621 = _593;
    float _623 = abs(_511);
    bool _625 = _623 >= 0.375;
    int _627 = _621 << 15;
    float _629 = trunc(_383);
    float _631 = precise::max(_629, 0.0);
    uint _633 = uint(_631);
    int _635 = _585 | _603;
    int _637 = _627 | _635;
    float _639 = trunc(_391);
    float _641 = precise::max(_639, 0.0);
    uint _643 = uint(_641);
    int _645 = int(_633);
    if (!_437)
    {
        int _647 = int(_615) + 1;
        _617 = _647;
    }
    int _649 = _617;
    float _651 = abs(_515);
    bool _653 = _651 >= 0.375;
    int _655 = _649 << 18;
    float _657 = trunc(_405);
    float _659 = precise::max(_657, 0.0);
    uint _661 = uint(_659);
    float _663 = trunc(_407);
    float _665 = precise::max(_663, 0.0);
    uint _667 = uint(_665);
    int _669 = int(_661);
    if (!_469)
    {
        int _671 = int(_643) + 1;
        _645 = _671;
    }
    int _673 = _645;
    float _675 = abs(_569);
    bool _677 = _675 >= 0.375;
    int _679 = _673 << 21;
    float _681 = trunc(_419);
    float _683 = precise::max(_681, 0.0);
    uint _685 = uint(_683);
    int _687 = _637 | _655;
    int _689 = _679 | _687;
    uint _691 = uint(int(uint(_689) >> uint(16)));
    int _693 = _689 & 65535;
    float _695 = trunc(_421);
    float _697 = precise::max(_695, 0.0);
    uint _699 = uint(_697);
    int _701 = int(_685);
    if (!_487)
    {
        int _703 = int(_667) + 1;
        _669 = _703;
    }
    int _705 = _669;
    float _707 = abs(_573);
    bool _709 = _707 >= 0.375;
    float _711 = trunc(_439);
    float _713 = precise::max(_711, 0.0);
    uint _715 = uint(_713);
    float _717 = trunc(_447);
    float _719 = precise::max(_717, 0.0);
    uint _721 = uint(_719);
    int _723 = int(_715);
    if (!_535)
    {
        int _725 = int(_699) + 1;
        _701 = _725;
    }
    int _727 = _701;
    int _729 = _727 << 3;
    float _731 = trunc(_449);
    float _733 = precise::max(_731, 0.0);
    uint _735 = uint(_733);
    int _737 = _705 | _729;
    float _739 = trunc(_451);
    float _741 = precise::max(_739, 0.0);
    uint _743 = uint(_741);
    int _745 = int(_735);
    if (!_565)
    {
        int _747 = int(_721) + 1;
        _723 = _747;
    }
    int _749 = _723;
    int _751 = _749 << 6;
    float _753 = trunc(_489);
    float _755 = precise::max(_753, 0.0);
    uint _757 = uint(_755);
    float _759 = trunc(_491);
    float _761 = precise::max(_759, 0.0);
    uint _763 = uint(_761);
    int _765 = int(_757);
    if (!_601)
    {
        int _767 = int(_743) + 1;
        _745 = _767;
    }
    int _769 = _745;
    int _771 = _769 << 9;
    float _773 = trunc(_471);
    float _775 = precise::max(_773, 0.0);
    uint _777 = uint(_775);
    int _779 = _737 | _751;
    int _781 = _771 | _779;
    float _783 = trunc(_483);
    float _785 = precise::max(_783, 0.0);
    uint _787 = uint(_785);
    int _789 = int(_777);
    if (!_653)
    {
        int _791 = int(_763) + 1;
        _765 = _791;
    }
    int _793 = _765;
    int _795 = _793 * 32768;
    float _797 = trunc(_507);
    float _799 = precise::max(_797, 0.0);
    uint _801 = uint(_799);
    float _803 = trunc(_559);
    float _805 = precise::max(_803, 0.0);
    uint _807 = uint(_805);
    int _809 = int(_801);
    if (!_625)
    {
        int _811 = int(_787) + 1;
        _789 = _811;
    }
    int _813 = _789;
    int _815 = _813 << 12;
    float _817 = trunc(_517);
    float _819 = precise::max(_817, 0.0);
    uint _821 = uint(_819);
    int _823 = _781 | _815;
    int _825 = _795 | _823;
    float _827 = trunc(_561);
    float _829 = precise::max(_827, 0.0);
    uint _831 = uint(_829);
    int _833 = int(_821);
    if (!_677)
    {
        int _835 = int(_807) + 1;
        _809 = _835;
    }
    int _837 = _809;
    int _839 = _837 * 262144;
    if (!_709)
    {
        int _841 = int(_831) + 1;
        _833 = _841;
    }
    int _843 = _833;
    int _845 = _843 << 21;
    int _847 = _825 | _839;
    int _849 = _845 | _847;
    int _851 = _849 << 8;
    uint _853 = uint(int(uint(_849) >> uint(8)));
    int _855 = 65280 & _851;
    int _857 = int(_691) | _855;
    out.m_32.x = as_type<float>(_195);
    out.m_32.y = as_type<float>(_693);
    out.m_32.z = as_type<float>(_857);
    out.m_32.w = as_type<float>(_853);
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.z;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _39;
    float _61 = _59 * _45;
    float _63 = _59 * _51;
    float _65 = _59 * _57;
    float _67 = rint(_61);
    float _69 = precise::max(_67, 0.0);
    uint _72 = uint(_69);
    uint _74 = clamp(_72, 0u, 65535u);
    float3 _917 = float3(_63, _65, float(int(_74)));
    float3 _921 = select(_917, float3(0.0), isnan(_917));
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _921.xy, uint(rint(_921.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _921.xy, uint(rint(_921.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)).x;
    float3 _935 = float3(_63, _65, float(int(_74)));
    float3 _937 = select(_935, float3(0.0), isnan(_935));
    float _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _937.xy, uint(rint(_937.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _937.xy, uint(rint(_937.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)).x;
    float3 _949 = float3(_63, _65, float(int(_74)));
    float3 _951 = select(_949, float3(0.0), isnan(_949));
    float _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _951.xy, uint(rint(_951.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _951.xy, uint(rint(_951.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)).x;
    float3 _963 = float3(_63, _65, float(int(_74)));
    float3 _965 = select(_963, float3(0.0), isnan(_963));
    float _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _965.xy, uint(rint(_965.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _965.xy, uint(rint(_965.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)).x;
    float3 _977 = float3(_63, _65, float(int(_74)));
    float3 _979 = select(_977, float3(0.0), isnan(_977));
    float _84 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _979.xy, uint(rint(_979.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _979.xy, uint(rint(_979.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)).x;
    float3 _991 = float3(_63, _65, float(int(_74)));
    float3 _993 = select(_991, float3(0.0), isnan(_991));
    float _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _993.xy, uint(rint(_993.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _993.xy, uint(rint(_993.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)).x;
    float3 _1005 = float3(_63, _65, float(int(_74)));
    float3 _1007 = select(_1005, float3(0.0), isnan(_1005));
    float _88 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1007.xy, uint(rint(_1007.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1007.xy, uint(rint(_1007.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)).x;
    float3 _1019 = float3(_63, _65, float(int(_74)));
    float3 _1021 = select(_1019, float3(0.0), isnan(_1019));
    float _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1021.xy, uint(rint(_1021.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1021.xy, uint(rint(_1021.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)).x;
    float3 _1033 = float3(_63, _65, float(int(_74)));
    float3 _1035 = select(_1033, float3(0.0), isnan(_1033));
    float _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1035.xy, uint(rint(_1035.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1035.xy, uint(rint(_1035.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)).x;
    float3 _1047 = float3(_63, _65, float(int(_74)));
    float3 _1049 = select(_1047, float3(0.0), isnan(_1047));
    float _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1049.xy, uint(rint(_1049.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1049.xy, uint(rint(_1049.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)).x;
    float3 _1061 = float3(_63, _65, float(int(_74)));
    float3 _1063 = select(_1061, float3(0.0), isnan(_1061));
    float _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1063.xy, uint(rint(_1063.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1063.xy, uint(rint(_1063.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).x;
    float3 _1074 = float3(_63, _65, float(int(_74)));
    float3 _1076 = select(_1074, float3(0.0), isnan(_1074));
    float _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1076.xy, uint(rint(_1076.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1076.xy, uint(rint(_1076.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)).x;
    float3 _1088 = float3(_63, _65, float(int(_74)));
    float3 _1090 = select(_1088, float3(0.0), isnan(_1088));
    float _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1090.xy, uint(rint(_1090.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1090.xy, uint(rint(_1090.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)).x;
    float3 _1102 = float3(_63, _65, float(int(_74)));
    float3 _1104 = select(_1102, float3(0.0), isnan(_1102));
    float _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1104.xy, uint(rint(_1104.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1104.xy, uint(rint(_1104.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)).x;
    float3 _1116 = float3(_63, _65, float(int(_74)));
    float3 _1118 = select(_1116, float3(0.0), isnan(_1116));
    float _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1118.xy, uint(rint(_1118.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1118.xy, uint(rint(_1118.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)).x;
    float3 _1130 = float3(_63, _65, float(int(_74)));
    float3 _1132 = select(_1130, float3(0.0), isnan(_1130));
    float _106 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1132.xy, uint(rint(_1132.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1132.xy, uint(rint(_1132.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)).x;
    float _108 = precise::max(_76, _78);
    float _110 = precise::max(_80, _82);
    float _112 = precise::min(_76, _78);
    float _114 = precise::max(_108, _110);
    float _116 = precise::min(_80, _82);
    float _118 = precise::min(_112, _116);
    float _120 = precise::max(_84, _86);
    float _122 = precise::max(_88, _90);
    float _124 = precise::min(_88, _90);
    float _126 = precise::max(_92, _94);
    float _128 = precise::min(_92, _94);
    float _130 = precise::max(_122, _126);
    float _132 = precise::min(_124, _128);
    float _134 = precise::min(_84, _86);
    float _136 = precise::max(_96, _98);
    float _138 = precise::min(_96, _98);
    float _140 = precise::max(_136, _120);
    float _142 = precise::min(_138, _134);
    float _144 = precise::max(_100, _102);
    float _146 = precise::min(_100, _102);
    float _148 = precise::max(_104, _106);
    float _150 = precise::min(_104, _106);
    float _152 = precise::max(_144, _148);
    float _154 = precise::min(_146, _150);
    float _156 = precise::max(_140, _114);
    float _158 = precise::max(_130, _152);
    float _160 = precise::min(_142, _118);
    float _162 = precise::min(_132, _154);
    float _164 = precise::max(_156, _158);
    float _166 = precise::min(_160, _162);
    float _168 = _164 * 255.0;
    float _170 = _166 * 255.0;
    float _172 = trunc(_168);
    float _174 = precise::max(_172, 0.0);
    uint _176 = uint(_174);
    float _178 = trunc(_170);
    float _180 = precise::max(_178, 0.0);
    uint _182 = uint(_180);
    bool _186 = _176 > _182;
    int _189 = int(_182) << 8;
    int _191 = _189 & 65280;
    int _193 = 255 & int(_176);
    int _195 = _191 | _193;
    int _197 = as_type<int>(_160);
    int _199 = as_type<int>(_134);
    int _201 = _191;
    if (!_186)
    {
        _197 = 0;
    }
    int _203 = _197;
    if (!_186)
    {
        _199 = 0;
        _201 = 0;
    }
    int _205 = _199;
    int _207 = _201;
    if (!_186)
    {
        out.m_32.x = as_type<float>(_195);
        out.m_32.y = as_type<float>(_203);
        out.m_32.z = as_type<float>(_205);
        out.m_32.w = as_type<float>(_207);
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    float _209 = -_166;
    float _211 = _164 + _209;
    float _213 = -_166;
    float _215 = _98 + _213;
    float _217 = -_166;
    float _219 = _96 + _217;
    float _221 = -_166;
    float _223 = _84 + _221;
    float _225 = -_166;
    float _227 = _86 + _225;
    float _229 = -_166;
    float _231 = _76 + _229;
    float _233 = 1.0 / _211;
    float _235 = -_166;
    float _237 = _78 + _235;
    float _239 = -_166;
    float _241 = _80 + _239;
    float _243 = -_166;
    float _245 = _82 + _243;
    float _247 = -_166;
    float _249 = _88 + _247;
    float _251 = -_166;
    float _253 = _90 + _251;
    float _255 = -_166;
    float _257 = _94 + _255;
    float _259 = -_166;
    float _261 = _100 + _259;
    float _263 = -_166;
    float _265 = _102 + _263;
    float _267 = -_166;
    float _269 = _106 + _267;
    float _271 = _215 * _233;
    float _273 = -_166;
    float _275 = _92 + _273;
    float _277 = _219 * _233;
    float _279 = _223 * _233;
    float _281 = _227 * _233;
    float _283 = _275 * _233;
    float _285 = -_166;
    float _287 = _104 + _285;
    float _289 = _231 * _233;
    float _291 = _237 * _233;
    float _293 = _241 * _233;
    float _295 = _245 * _233;
    float _297 = _249 * _233;
    float _299 = _253 * _233;
    float _301 = _257 * _233;
    float _303 = _261 * _233;
    float _305 = _265 * _233;
    float _307 = _287 * _233;
    float _309 = _269 * _233;
    float _311 = -_277;
    float _313 = _311 + 0.5;
    float _315 = fma(_277, -1.99999904632568359375, 1.99999904632568359375);
    float _317 = fma(_277, -7.99999904632568359375, 7.99999904632568359375);
    float _319 = fma(_271, -1.99999904632568359375, 1.99999904632568359375);
    float _321 = fma(_271, -7.99999904632568359375, 7.99999904632568359375);
    float _323 = abs(_313);
    bool _325 = _323 >= 0.375;
    float _327 = -_271;
    float _329 = _327 + 0.5;
    float _331 = fma(_279, -1.99999904632568359375, 1.99999904632568359375);
    float _333 = fma(_279, -7.99999904632568359375, 7.99999904632568359375);
    float _335 = trunc(_315);
    float _337 = precise::max(_335, 0.0);
    uint _339 = uint(_337);
    float _341 = fma(_281, -1.99999904632568359375, 1.99999904632568359375);
    float _343 = abs(_329);
    bool _345 = _343 >= 0.375;
    float _347 = -_279;
    float _349 = _347 + 0.5;
    float _351 = fma(_281, -7.99999904632568359375, 7.99999904632568359375);
    float _353 = fma(_289, -1.99999904632568359375, 1.99999904632568359375);
    float _355 = fma(_289, -7.99999904632568359375, 7.99999904632568359375);
    float _357 = fma(_291, -1.99999904632568359375, 1.99999904632568359375);
    float _359 = trunc(_317);
    float _361 = precise::max(_359, 0.0);
    uint _363 = uint(_361);
    float _365 = abs(_349);
    bool _367 = _365 >= 0.375;
    float _369 = fma(_291, -7.99999904632568359375, 7.99999904632568359375);
    float _371 = fma(_293, -1.99999904632568359375, 1.99999904632568359375);
    float _373 = fma(_293, -7.99999904632568359375, 7.99999904632568359375);
    float _375 = -_281;
    float _377 = _375 + 0.5;
    float _379 = -_289;
    float _381 = _379 + 0.5;
    float _383 = fma(_295, -1.99999904632568359375, 1.99999904632568359375);
    float _385 = trunc(_319);
    float _387 = precise::max(_385, 0.0);
    uint _389 = uint(_387);
    float _391 = fma(_295, -7.99999904632568359375, 7.99999904632568359375);
    float _393 = -_291;
    float _395 = _393 + 0.5;
    float _397 = -_293;
    float _399 = _397 + 0.5;
    float _401 = abs(_377);
    bool _403 = _401 >= 0.375;
    float _405 = fma(_297, -1.99999904632568359375, 1.99999904632568359375);
    float _407 = fma(_297, -7.99999904632568359375, 7.99999904632568359375);
    float _409 = abs(_381);
    bool _411 = _409 >= 0.375;
    float _413 = trunc(_321);
    float _415 = precise::max(_413, 0.0);
    uint _417 = uint(_415);
    float _419 = fma(_299, -1.99999904632568359375, 1.99999904632568359375);
    float _421 = fma(_299, -7.99999904632568359375, 7.99999904632568359375);
    float _423 = -_295;
    float _425 = _423 + 0.5;
    float _427 = abs(_395);
    bool _429 = _427 >= 0.375;
    float _431 = -_297;
    float _433 = _431 + 0.5;
    float _435 = abs(_399);
    bool _437 = _435 >= 0.375;
    float _439 = fma(_283, -1.99999904632568359375, 1.99999904632568359375);
    float _441 = trunc(_331);
    float _443 = precise::max(_441, 0.0);
    uint _445 = uint(_443);
    float _447 = fma(_283, -7.99999904632568359375, 7.99999904632568359375);
    float _449 = fma(_301, -1.99999904632568359375, 1.99999904632568359375);
    float _451 = fma(_301, -7.99999904632568359375, 7.99999904632568359375);
    int _453 = int(_339);
    int _455 = int(_389);
    int _457 = int(_445);
    if (!_325)
    {
        int _459 = int(_363) + 1;
        _453 = _459;
    }
    int _461 = _453;
    float _463 = -_299;
    float _465 = _463 + 0.5;
    float _467 = abs(_425);
    bool _469 = _467 >= 0.375;
    float _471 = fma(_303, -1.99999904632568359375, 1.99999904632568359375);
    float _473 = trunc(_333);
    float _475 = precise::max(_473, 0.0);
    uint _477 = uint(_475);
    if (!_345)
    {
        int _479 = int(_417) + 1;
        _455 = _479;
    }
    int _481 = _455;
    float _483 = fma(_303, -7.99999904632568359375, 7.99999904632568359375);
    float _485 = abs(_433);
    bool _487 = _485 >= 0.375;
    float _489 = fma(_305, -1.99999904632568359375, 1.99999904632568359375);
    float _491 = fma(_305, -7.99999904632568359375, 7.99999904632568359375);
    float _493 = -_283;
    float _495 = _493 + 0.5;
    float _497 = -_301;
    float _499 = _497 + 0.5;
    float _501 = trunc(_341);
    float _503 = precise::max(_501, 0.0);
    uint _505 = uint(_503);
    float _507 = fma(_307, -1.99999904632568359375, 1.99999904632568359375);
    float _509 = -_303;
    float _511 = _509 + 0.5;
    float _513 = -_305;
    float _515 = _513 + 0.5;
    float _517 = fma(_309, -1.99999904632568359375, 1.99999904632568359375);
    int _519 = _481 * 8;
    float _521 = trunc(_351);
    float _523 = precise::max(_521, 0.0);
    uint _525 = uint(_523);
    int _527 = int(_505);
    if (!_367)
    {
        int _529 = int(_477) + 1;
        _457 = _529;
    }
    int _531 = _457;
    float _533 = abs(_465);
    bool _535 = _533 >= 0.375;
    int _537 = _461 | _519;
    int _539 = _531 << 6;
    float _541 = trunc(_353);
    float _543 = precise::max(_541, 0.0);
    uint _545 = uint(_543);
    float _547 = trunc(_355);
    float _549 = precise::max(_547, 0.0);
    uint _551 = uint(_549);
    int _553 = int(_545);
    if (!_403)
    {
        int _555 = int(_525) + 1;
        _527 = _555;
    }
    int _557 = _527;
    float _559 = fma(_307, -7.99999904632568359375, 7.99999904632568359375);
    float _561 = fma(_309, -7.99999904632568359375, 7.99999904632568359375);
    float _563 = abs(_495);
    bool _565 = _563 >= 0.375;
    float _567 = -_307;
    float _569 = _567 + 0.5;
    float _571 = -_309;
    float _573 = _571 + 0.5;
    int _575 = _557 * 512;
    float _577 = trunc(_357);
    float _579 = precise::max(_577, 0.0);
    uint _581 = uint(_579);
    int _583 = _537 | _539;
    int _585 = _575 | _583;
    float _587 = trunc(_369);
    float _589 = precise::max(_587, 0.0);
    uint _591 = uint(_589);
    int _593 = int(_581);
    if (!_411)
    {
        int _595 = int(_551) + 1;
        _553 = _595;
    }
    int _597 = _553;
    float _599 = abs(_499);
    bool _601 = _599 >= 0.375;
    int _603 = _597 * 4096;
    float _605 = trunc(_371);
    float _607 = precise::max(_605, 0.0);
    uint _609 = uint(_607);
    float _611 = trunc(_373);
    float _613 = precise::max(_611, 0.0);
    uint _615 = uint(_613);
    int _617 = int(_609);
    if (!_429)
    {
        int _619 = int(_591) + 1;
        _593 = _619;
    }
    int _621 = _593;
    float _623 = abs(_511);
    bool _625 = _623 >= 0.375;
    int _627 = _621 << 15;
    float _629 = trunc(_383);
    float _631 = precise::max(_629, 0.0);
    uint _633 = uint(_631);
    int _635 = _585 | _603;
    int _637 = _627 | _635;
    float _639 = trunc(_391);
    float _641 = precise::max(_639, 0.0);
    uint _643 = uint(_641);
    int _645 = int(_633);
    if (!_437)
    {
        int _647 = int(_615) + 1;
        _617 = _647;
    }
    int _649 = _617;
    float _651 = abs(_515);
    bool _653 = _651 >= 0.375;
    int _655 = _649 << 18;
    float _657 = trunc(_405);
    float _659 = precise::max(_657, 0.0);
    uint _661 = uint(_659);
    float _663 = trunc(_407);
    float _665 = precise::max(_663, 0.0);
    uint _667 = uint(_665);
    int _669 = int(_661);
    if (!_469)
    {
        int _671 = int(_643) + 1;
        _645 = _671;
    }
    int _673 = _645;
    float _675 = abs(_569);
    bool _677 = _675 >= 0.375;
    int _679 = _673 << 21;
    float _681 = trunc(_419);
    float _683 = precise::max(_681, 0.0);
    uint _685 = uint(_683);
    int _687 = _637 | _655;
    int _689 = _679 | _687;
    uint _691 = uint(int(uint(_689) >> uint(16)));
    int _693 = _689 & 65535;
    float _695 = trunc(_421);
    float _697 = precise::max(_695, 0.0);
    uint _699 = uint(_697);
    int _701 = int(_685);
    if (!_487)
    {
        int _703 = int(_667) + 1;
        _669 = _703;
    }
    int _705 = _669;
    float _707 = abs(_573);
    bool _709 = _707 >= 0.375;
    float _711 = trunc(_439);
    float _713 = precise::max(_711, 0.0);
    uint _715 = uint(_713);
    float _717 = trunc(_447);
    float _719 = precise::max(_717, 0.0);
    uint _721 = uint(_719);
    int _723 = int(_715);
    if (!_535)
    {
        int _725 = int(_699) + 1;
        _701 = _725;
    }
    int _727 = _701;
    int _729 = _727 << 3;
    float _731 = trunc(_449);
    float _733 = precise::max(_731, 0.0);
    uint _735 = uint(_733);
    int _737 = _705 | _729;
    float _739 = trunc(_451);
    float _741 = precise::max(_739, 0.0);
    uint _743 = uint(_741);
    int _745 = int(_735);
    if (!_565)
    {
        int _747 = int(_721) + 1;
        _723 = _747;
    }
    int _749 = _723;
    int _751 = _749 << 6;
    float _753 = trunc(_489);
    float _755 = precise::max(_753, 0.0);
    uint _757 = uint(_755);
    float _759 = trunc(_491);
    float _761 = precise::max(_759, 0.0);
    uint _763 = uint(_761);
    int _765 = int(_757);
    if (!_601)
    {
        int _767 = int(_743) + 1;
        _745 = _767;
    }
    int _769 = _745;
    int _771 = _769 << 9;
    float _773 = trunc(_471);
    float _775 = precise::max(_773, 0.0);
    uint _777 = uint(_775);
    int _779 = _737 | _751;
    int _781 = _771 | _779;
    float _783 = trunc(_483);
    float _785 = precise::max(_783, 0.0);
    uint _787 = uint(_785);
    int _789 = int(_777);
    if (!_653)
    {
        int _791 = int(_763) + 1;
        _765 = _791;
    }
    int _793 = _765;
    int _795 = _793 * 32768;
    float _797 = trunc(_507);
    float _799 = precise::max(_797, 0.0);
    uint _801 = uint(_799);
    float _803 = trunc(_559);
    float _805 = precise::max(_803, 0.0);
    uint _807 = uint(_805);
    int _809 = int(_801);
    if (!_625)
    {
        int _811 = int(_787) + 1;
        _789 = _811;
    }
    int _813 = _789;
    int _815 = _813 << 12;
    float _817 = trunc(_517);
    float _819 = precise::max(_817, 0.0);
    uint _821 = uint(_819);
    int _823 = _781 | _815;
    int _825 = _795 | _823;
    float _827 = trunc(_561);
    float _829 = precise::max(_827, 0.0);
    uint _831 = uint(_829);
    int _833 = int(_821);
    if (!_677)
    {
        int _835 = int(_807) + 1;
        _809 = _835;
    }
    int _837 = _809;
    int _839 = _837 * 262144;
    if (!_709)
    {
        int _841 = int(_831) + 1;
        _833 = _841;
    }
    int _843 = _833;
    int _845 = _843 << 21;
    int _847 = _825 | _839;
    int _849 = _845 | _847;
    int _851 = _849 << 8;
    uint _853 = uint(int(uint(_849) >> uint(8)));
    int _855 = 65280 & _851;
    int _857 = int(_691) | _855;
    out.m_32.x = as_type<float>(_195);
    out.m_32.y = as_type<float>(_693);
    out.m_32.z = as_type<float>(_857);
    out.m_32.w = as_type<float>(_853);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

