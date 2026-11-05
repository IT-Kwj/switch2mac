#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_12 [[id(5)]];
    sampler fp_t_tcb_12Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    texture2d<float> fp_t_tcb_A [[id(11)]];
    sampler fp_t_tcb_ASmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _519 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_519, float2(0.0), isnan(_519))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_519, float2(0.0), isnan(_519))).x;
    float2 _530 = float2(_52, _54);
    float2 _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_530, float2(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_530, float2(0.0), isnan(_530))).xy;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = in.m_42.y;
    float _68 = in.m_42.x;
    float _70 = -_56;
    float _72 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _74 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[46].z, _72);
    float _76 = _74 * _66;
    float _78 = _74 * _68;
    float _80 = -_76;
    float _82 = _80 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _84 = -_78;
    float _86 = _84 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _88 = -_76;
    float _90 = _88 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _92 = -_78;
    float _94 = _92 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _96 = _82 * _82;
    float _98 = _76 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _100 = _90 * _90;
    float _102 = _76 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _104 = fma(_86, _86, _96);
    float _106 = -_74;
    float _108 = _106 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _110 = fma(_94, _94, _100);
    float _112 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[33].x, _98);
    float _114 = fma(_108, _108, _104);
    float _116 = -_74;
    float _118 = _116 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _120 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _122 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[33].z, _112);
    float _124 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _126 = fma(_118, _118, _110);
    float _128 = sqrt(_114);
    float _130 = _76 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _132 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[18].x, _102);
    float _134 = _76 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _136 = _76 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _138 = _76 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _140 = _76 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _142 = _76 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _144 = sqrt(_126);
    float _146 = _76 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _148 = _76 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _150 = _76 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _152 = _76 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _154 = _76 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _156 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[0].x, _120);
    float _158 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[1].x, _124);
    bool _162 = _128 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _164 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].x, _130);
    bool _166 = _128 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _168 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[18].z, _132);
    bool _170 = !_162;
    int _173 = _170 ? 0 : 1;
    float _175 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[22].x, _136);
    float _177 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[16].x, _140);
    float _179 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[17].x, _142);
    bool _181 = _144 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _183 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[25].x, _146);
    bool _185 = _144 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _187 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[26].x, _148);
    bool _189 = !_181;
    int _191 = _189 ? 0 : 1;
    float _193 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[28].x, _150);
    int _195 = 2;
    int _197 = 2;
    if (!_162)
    {
        _195 = 1;
    }
    int _199 = _195;
    float _201 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[29].x, _152);
    int _203 = _199;
    if (!_166)
    {
        _203 = _173;
    }
    int _205 = _203;
    float _207 = _76 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _209 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[31].x, _154);
    float _211 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].z, _156);
    float _213 = float(_205);
    float _215 = _76 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    if (!_181)
    {
        _197 = 1;
    }
    int _217 = _197;
    float _219 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[21].x, _207);
    int _221 = _217;
    if (!_185)
    {
        _221 = _191;
    }
    int _223 = _221;
    float _225 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[24].x, _215);
    float _227 = precise::min(_213, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _229 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[21].z, _219);
    float _231 = float(_223);
    float _233 = _76 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _235 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[24].z, _225);
    float _237 = _229 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    bool _239 = _227 != 1.0;
    bool _241 = isnan(_227);
    bool _243 = _239 || _241;
    bool _245 = isnan(1.0);
    bool _247 = _243 || _245;
    float _249 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[30].x, _233);
    float _251 = precise::min(_231, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _253 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].z, _158);
    bool _255 = _227 != 0.0;
    bool _257 = isnan(_227);
    bool _259 = _255 || _257;
    bool _261 = isnan(0.0);
    bool _263 = _259 || _261;
    float _265 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[30].z, _249);
    bool _267 = _251 != 1.0;
    bool _269 = isnan(_251);
    bool _271 = _267 || _269;
    bool _273 = isnan(1.0);
    bool _275 = _271 || _273;
    float _277 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].z, _164);
    bool _279 = _251 != 0.0;
    bool _281 = isnan(_251);
    bool _283 = _279 || _281;
    bool _285 = isnan(0.0);
    bool _287 = _283 || _285;
    float _289 = _265 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _291 = _76 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _293 = rint(_251);
    float _295 = precise::max(_293, 0.0);
    uint _298 = uint(_295);
    uint _300 = clamp(_298, 0u, 65535u);
    float _302 = _253 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _304 = _237;
    float _306 = _289;
    if (_247)
    {
        float _308 = _235 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _304 = _308;
    }
    float _310 = _304;
    float _312 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[3].x, _291);
    float _314 = _76 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _316 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[20].x, _134);
    float _318 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[23].x, _138);
    float _320 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].z, _312);
    float _322 = _310;
    if (_275)
    {
        float _324 = _122 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _306 = _324;
    }
    float _326 = _306;
    float _328 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[27].x, _314);
    float _330 = _76 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _332 = _320 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _334 = _76 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _336 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[27].z, _328);
    float _338 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[19].x, _330);
    float _340 = _326;
    if (!_263)
    {
        float _342 = _168 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _322 = _342;
    }
    float _344 = _322;
    float _346 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[32].x, _334);
    float _348 = 1.0 / _332;
    if (!_287)
    {
        float _350 = _336 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _340 = _350;
    }
    float _352 = _340;
    float _354 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[19].z, _338);
    float _356 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[20].z, _316);
    float _358 = _211 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _360 = _277 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _362 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[29].z, _201);
    float _364 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[32].z, _346);
    float _366 = rint(_227);
    float _368 = precise::max(_366, 0.0);
    uint _370 = uint(_368);
    uint _372 = clamp(_370, 0u, 65535u);
    float _374 = _354 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _376 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[28].z, _193);
    float _378 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[26].z, _187);
    float _380 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[23].z, _318);
    float _382 = _356 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _384 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[31].z, _209);
    float _386 = _362 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _388 = _358 * _348;
    float _390 = _302 * _348;
    float _392 = _360 * _348;
    float _394 = precise::clamp(_392, 0.0, 1.0);
    float _396 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[17].z, _179);
    float _398 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[25].z, _183);
    float _400 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[16].z, _177);
    float _402 = _386;
    float _404 = _382;
    float _406 = _374;
    if (_275)
    {
        float _408 = _364 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _402 = _408;
    }
    float _410 = _402;
    float _412 = fma(_62, 2.0, -1.0);
    float _414 = _376 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _416 = _410;
    float _418 = _414;
    if (!_287)
    {
        float _420 = _378 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _416 = _420;
    }
    float _422 = _416;
    float _424 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[22].z, _175);
    if (_247)
    {
        float _426 = _380 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _404 = _426;
    }
    float _428 = _404;
    float _430 = _428;
    if (_275)
    {
        float _432 = _384 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _418 = _432;
    }
    float _434 = _418;
    float _436 = _434;
    if (!_263)
    {
        float _438 = _396 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _430 = _438;
    }
    float _440 = _430;
    if (!_287)
    {
        float _442 = _398 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _436 = _442;
    }
    float _444 = _436;
    float _446 = 0.0 + _352;
    float _448 = precise::clamp(_446, 0.0, 1.0);
    float _450 = _412 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    if (_247)
    {
        float _452 = _424 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _406 = _452;
    }
    float _454 = _406;
    float _456 = _454;
    if (!_263)
    {
        float _458 = _400 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _456 = _458;
    }
    float _460 = _456;
    float _462 = fma(_64, 2.0, -1.0);
    float _464 = 0.0 + _344;
    float _466 = precise::clamp(_464, 0.0, 1.0);
    float3 _1284 = float3(_444, _422, float(int(_300)));
    float3 _1288 = select(_1284, float3(0.0), isnan(_1284));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1288.xy, uint(rint(_1288.z)), _448);
    float _470 = fma(_450, 2.0, _52);
    float _472 = _462 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float3 _1304 = float3(_460, _440, float(int(_372)));
    float3 _1306 = select(_1304, float3(0.0), isnan(_1304));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1306.xy, uint(rint(_1306.z)), _466);
    float _476 = fma(_472, 2.0, _54);
    float3 _1316 = float3(_388, _390, float(0));
    float3 _1318 = select(_1316, float3(0.0), isnan(_1316));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1318.xy, uint(rint(_1318.z)), _394);
    float2 _1324 = float2(_470, _476);
    float _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1324, float2(0.0), isnan(_1324))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1324, float2(0.0), isnan(_1324))).x;
    float _482 = -_74;
    float _484 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _486 = _482 + _484;
    float _488 = -_74;
    float _490 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _492 = _488 + _490;
    float _494 = _486 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _496 = precise::clamp(_494, 0.0, 1.0);
    float _498 = _492 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _500 = precise::clamp(_498, 0.0, 1.0);
    float _502 = _468 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _504 = fma(_474, (*spvDescriptorSet0.fp_c3)._m0[49].z, _502);
    float _506 = _496 + _478;
    float _508 = _500 + _504;
    out.m_45.x = _480;
    out.m_45.y = _506;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _508;
    return out;
}

