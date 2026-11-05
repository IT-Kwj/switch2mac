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
    texture2d_array<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_12 [[id(9)]];
    sampler fp_t_tcb_12Smplr [[id(10)]];
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
    float2 _663 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_663, float2(0.0), isnan(_663))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_663, float2(0.0), isnan(_663))).x;
    float _58 = in.m_42.y;
    float _60 = in.m_42.x;
    float _62 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _64 = -_56;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[46].z, _66);
    float _70 = _68 * _58;
    float _72 = _68 * _60;
    float _74 = -_70;
    float _76 = _74 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _78 = -_72;
    float _80 = _78 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _82 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _84 = _76 * _76;
    float _86 = -_68;
    float _88 = _86 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _90 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _82);
    float _92 = fma(_80, _80, _84);
    float _94 = _70 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _96 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _90);
    float _98 = fma(_88, _88, _92);
    float _100 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _102 = _96 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _104 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _100);
    float _106 = sqrt(_98);
    float _108 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _110 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _104);
    float _112 = _110 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _114 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _108);
    float _116 = 1.0 / _112;
    float _118 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _114);
    bool _122 = _106 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _124 = _118 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _126 = _106 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _128 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _94);
    bool _130 = !_122;
    int _133 = _130 ? 0 : 1;
    float _135 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _128);
    float _137 = _135 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _139 = _124 * _116;
    int _141 = 2;
    if (!_122)
    {
        _141 = 1;
    }
    int _143 = _141;
    float _145 = _102 * _116;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    int _149 = _143;
    if (!_126)
    {
        _149 = _133;
    }
    int _151 = _149;
    float _153 = _137 * _116;
    float _155 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _157 = fma(_147, _62, _153);
    float _159 = fma(_147, _155, _139);
    float _161 = -_155;
    float _163 = fma(_147, _161, _139);
    float3 _871 = float3(_159, _157, float(0));
    float3 _875 = select(_871, float3(0.0), isnan(_871));
    float _165 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _875.xy, uint(rint(_875.z)), _147);
    float3 _882 = float3(_139, _157, float(0));
    float3 _884 = select(_882, float3(0.0), isnan(_882));
    float _167 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _884.xy, uint(rint(_884.z)), _147);
    float3 _891 = float3(_163, _157, float(0));
    float3 _893 = select(_891, float3(0.0), isnan(_891));
    float _169 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _893.xy, uint(rint(_893.z)), _147);
    float3 _900 = float3(_159, _153, float(0));
    float3 _902 = select(_900, float3(0.0), isnan(_900));
    float _171 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _902.xy, uint(rint(_902.z)), _147);
    float _173 = float(_151);
    float3 _911 = float3(_139, _153, float(0));
    float3 _913 = select(_911, float3(0.0), isnan(_911));
    float _175 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _913.xy, uint(rint(_913.z)), _147);
    float _177 = _70 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _179 = precise::min(_173, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _181 = _70 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _183 = _70 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _185 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[21].x, _177);
    float _187 = _70 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    bool _189 = _179 != 1.0;
    bool _191 = isnan(_179);
    bool _193 = _189 || _191;
    bool _195 = isnan(1.0);
    bool _197 = _193 || _195;
    float _199 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[19].x, _181);
    float _201 = _70 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _203 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[22].x, _187);
    bool _205 = _179 != 0.0;
    bool _207 = isnan(_179);
    bool _209 = _205 || _207;
    bool _211 = isnan(0.0);
    bool _213 = _209 || _211;
    float _215 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _199);
    float _217 = _70 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _219 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _203);
    float _221 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[20].x, _201);
    float _223 = _70 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _225 = _215 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _227 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[23].x, _183);
    float _229 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _221);
    float _231 = _225;
    if (_197)
    {
        float _233 = _219 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _231 = _233;
    }
    float _235 = _231;
    float _237 = _70 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _239 = _70 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _241 = _229 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _243 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[16].x, _223);
    float _245 = rint(_179);
    float _247 = precise::max(_245, 0.0);
    uint _250 = uint(_247);
    uint _252 = clamp(_250, 0u, 65535u);
    float _254 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[24].x, _217);
    float _256 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _227);
    float _258 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _243);
    float _260 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[18].x, _237);
    float _262 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[17].x, _239);
    float _264 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _185);
    float _266 = _235;
    float _268 = _241;
    if (!_213)
    {
        float _270 = _258 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _266 = _270;
    }
    float _272 = _266;
    float _274 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _254);
    float _276 = -_62;
    float _278 = fma(_147, _276, _153);
    float _280 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _260);
    float _282 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _262);
    if (_197)
    {
        float _284 = _256 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _268 = _284;
    }
    float _286 = _268;
    float _288 = _264 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float3 _1140 = float3(_163, _153, float(0));
    float3 _1142 = select(_1140, float3(0.0), isnan(_1140));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1142.xy, uint(rint(_1142.z)), _147);
    float _292 = _288;
    float _294 = _286;
    if (_197)
    {
        float _296 = _274 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _292 = _296;
    }
    float _298 = _292;
    float _300 = _298;
    if (!_213)
    {
        float _302 = _280 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _300 = _302;
    }
    float _304 = _300;
    if (!_213)
    {
        float _306 = _282 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _294 = _306;
    }
    float _308 = _294;
    float _310 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _312 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _314 = 0.0 + _304;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float3 _1195 = float3(_159, _278, float(0));
    float3 _1197 = select(_1195, float3(0.0), isnan(_1195));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1197.xy, uint(rint(_1197.z)), _147);
    float _320 = fma(_316, _312, _308);
    float3 _1208 = float3(_139, _278, float(0));
    float3 _1210 = select(_1208, float3(0.0), isnan(_1208));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1210.xy, uint(rint(_1210.z)), _147);
    float _324 = fma(_316, _310, _272);
    float3 _1221 = float3(_163, _278, float(0));
    float3 _1223 = select(_1221, float3(0.0), isnan(_1221));
    float _326 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1223.xy, uint(rint(_1223.z)), _147);
    float3 _1232 = float3(_272, _320, float(int(_252)));
    float3 _1234 = select(_1232, float3(0.0), isnan(_1232));
    float _328 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1234.xy, uint(rint(_1234.z)), _316);
    float3 _1243 = float3(_324, _320, float(int(_252)));
    float3 _1245 = select(_1243, float3(0.0), isnan(_1243));
    float _330 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1245.xy, uint(rint(_1245.z)), _316);
    float _332 = -_310;
    float _334 = fma(_316, _332, _272);
    float _336 = -_312;
    float _338 = fma(_316, _336, _308);
    float _340 = _165 + _167;
    float _342 = _340 + _169;
    float _344 = _342 + _171;
    float3 _1275 = float3(_334, _320, float(int(_252)));
    float3 _1277 = select(_1275, float3(0.0), isnan(_1275));
    float _346 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1277.xy, uint(rint(_1277.z)), _316);
    float3 _1286 = float3(_324, _308, float(int(_252)));
    float3 _1288 = select(_1286, float3(0.0), isnan(_1286));
    float _348 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1288.xy, uint(rint(_1288.z)), _316);
    float3 _1297 = float3(_272, _308, float(int(_252)));
    float3 _1299 = select(_1297, float3(0.0), isnan(_1297));
    float _350 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1299.xy, uint(rint(_1299.z)), _316);
    float3 _1308 = float3(_334, _308, float(int(_252)));
    float3 _1310 = select(_1308, float3(0.0), isnan(_1308));
    float _352 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1310.xy, uint(rint(_1310.z)), _316);
    float3 _1319 = float3(_324, _338, float(int(_252)));
    float3 _1321 = select(_1319, float3(0.0), isnan(_1319));
    float _354 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1321.xy, uint(rint(_1321.z)), _316);
    float2 _1327 = float2(_52, _54);
    float2 _358 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1327, float2(0.0), isnan(_1327))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1327, float2(0.0), isnan(_1327))).xy;
    float _360 = _358.x;
    float _362 = _358.y;
    float _364 = -_70;
    float _366 = _364 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _368 = _344 + _175;
    float _370 = -_72;
    float _372 = _370 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _374 = _366 * _366;
    float _376 = fma(_372, _372, _374);
    float _378 = -_68;
    float _380 = _378 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _382 = _70 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _384 = fma(_380, _380, _376);
    float _386 = sqrt(_384);
    float _388 = _70 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _390 = _70 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _392 = _70 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _394 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[29].x, _382);
    float _396 = _368 + _290;
    bool _398 = _386 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _400 = _386 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _402 = _70 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    bool _404 = !_398;
    int _406 = _404 ? 0 : 1;
    float _408 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[30].x, _392);
    float _410 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _394);
    float _412 = _396 + _318;
    float _414 = _70 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _416 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _408);
    float _418 = _412 + _322;
    int _420 = 2;
    if (!_398)
    {
        _420 = 1;
    }
    int _422 = _420;
    float _424 = _70 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    int _426 = _422;
    if (!_400)
    {
        _426 = _406;
    }
    int _428 = _426;
    float _430 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[31].x, _414);
    float _432 = _418 + _326;
    float _434 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[25].x, _388);
    float _436 = float(_428);
    float _438 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[32].x, _424);
    float _440 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _430);
    float _442 = _330 + _328;
    float _444 = precise::min(_436, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _446 = _70 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _448 = _70 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _450 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[28].x, _402);
    bool _452 = _444 != 1.0;
    bool _454 = isnan(_444);
    bool _456 = _452 || _454;
    bool _458 = isnan(1.0);
    bool _460 = _456 || _458;
    float _462 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[26].x, _446);
    bool _464 = _444 != 0.0;
    bool _466 = isnan(_444);
    bool _468 = _464 || _466;
    bool _470 = isnan(0.0);
    bool _472 = _468 || _470;
    float _474 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[33].x, _448);
    float _476 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[27].x, _390);
    float _478 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _450);
    float _480 = rint(_444);
    float _482 = precise::max(_480, 0.0);
    uint _484 = uint(_482);
    uint _486 = clamp(_484, 0u, 65535u);
    float _488 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _474);
    float _490 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _476);
    float _492 = _416 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _494 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _438);
    float _496 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _462);
    float _498 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _434);
    float _500 = _492;
    if (_460)
    {
        float _502 = _488 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _500 = _502;
    }
    float _504 = _500;
    float _506 = _410 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _508 = _504;
    float _510 = _506;
    if (!_472)
    {
        float _512 = _490 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _508 = _512;
    }
    float _514 = _508;
    float _516 = _478 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _518 = _516;
    if (_460)
    {
        float _520 = _494 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _510 = _520;
    }
    float _522 = _510;
    float _524 = _522;
    if (_460)
    {
        float _526 = _440 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _518 = _526;
    }
    float _528 = _518;
    float _530 = _528;
    if (!_472)
    {
        float _532 = _496 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _524 = _532;
    }
    float _534 = _524;
    float _536 = 0.0 + _514;
    float _538 = precise::clamp(_536, 0.0, 1.0);
    if (!_472)
    {
        float _540 = _498 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _530 = _540;
    }
    float _542 = _530;
    float _544 = _442 + _346;
    float _546 = _544 + _348;
    float _548 = _546 + _350;
    float _550 = fma(_360, 2.0, -1.0);
    float _552 = fma(_362, 2.0, -1.0);
    float _554 = _548 + _352;
    float _556 = fma(_312, _538, _534);
    float _558 = _554 + _354;
    float _560 = fma(_310, _538, _542);
    float _562 = -_310;
    float _564 = fma(_562, _538, _542);
    float _566 = _552 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float3 _1706 = float3(_272, _338, float(int(_252)));
    float3 _1708 = select(_1706, float3(0.0), isnan(_1706));
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1708.xy, uint(rint(_1708.z)), _316);
    float3 _1717 = float3(_334, _338, float(int(_252)));
    float3 _1719 = select(_1717, float3(0.0), isnan(_1717));
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1719.xy, uint(rint(_1719.z)), _316);
    float3 _1728 = float3(_542, _556, float(int(_486)));
    float3 _1730 = select(_1728, float3(0.0), isnan(_1728));
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1730.xy, uint(rint(_1730.z)), _538);
    float3 _1739 = float3(_560, _556, float(int(_486)));
    float3 _1741 = select(_1739, float3(0.0), isnan(_1739));
    float _574 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1741.xy, uint(rint(_1741.z)), _538);
    float3 _1750 = float3(_564, _556, float(int(_486)));
    float3 _1752 = select(_1750, float3(0.0), isnan(_1750));
    float _576 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1752.xy, uint(rint(_1752.z)), _538);
    float3 _1761 = float3(_560, _534, float(int(_486)));
    float3 _1763 = select(_1761, float3(0.0), isnan(_1761));
    float _578 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1763.xy, uint(rint(_1763.z)), _538);
    float _580 = _550 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _582 = fma(_566, 2.0, _54);
    float _584 = fma(_580, 2.0, _52);
    float3 _1782 = float3(_542, _534, float(int(_486)));
    float3 _1784 = select(_1782, float3(0.0), isnan(_1782));
    float _586 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1784.xy, uint(rint(_1784.z)), _538);
    float _588 = -_312;
    float _590 = fma(_588, _538, _534);
    float3 _1799 = float3(_564, _534, float(int(_486)));
    float3 _1801 = select(_1799, float3(0.0), isnan(_1799));
    float _592 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1801.xy, uint(rint(_1801.z)), _538);
    float3 _1810 = float3(_560, _590, float(int(_486)));
    float3 _1812 = select(_1810, float3(0.0), isnan(_1810));
    float _594 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1812.xy, uint(rint(_1812.z)), _538);
    float3 _1821 = float3(_542, _590, float(int(_486)));
    float3 _1823 = select(_1821, float3(0.0), isnan(_1821));
    float _596 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1823.xy, uint(rint(_1823.z)), _538);
    float3 _1832 = float3(_564, _590, float(int(_486)));
    float3 _1834 = select(_1832, float3(0.0), isnan(_1832));
    float _598 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1834.xy, uint(rint(_1834.z)), _538);
    float2 _1840 = float2(_584, _582);
    float _600 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1840, float2(0.0), isnan(_1840))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1840, float2(0.0), isnan(_1840))).x;
    float _602 = -_68;
    float _604 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _606 = _602 + _604;
    float _608 = _606 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _610 = precise::clamp(_608, 0.0, 1.0);
    float _612 = fma(_432, 0.111111111938953399658203125, _610);
    float _614 = -_68;
    float _616 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _618 = _614 + _616;
    float _620 = _618 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _622 = precise::clamp(_620, 0.0, 1.0);
    float _624 = _558 + _568;
    float _626 = _574 + _572;
    float _628 = _624 + _570;
    float _630 = _626 + _576;
    float _632 = _628 * 0.111111111938953399658203125;
    float _634 = _630 + _578;
    float _636 = _634 + _586;
    float _638 = _636 + _592;
    float _640 = _638 + _594;
    float _642 = _640 + _596;
    float _644 = _642 + _598;
    float _646 = _644 * 0.111111111938953399658203125;
    float _648 = _646 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _650 = fma(_632, (*spvDescriptorSet0.fp_c3)._m0[49].z, _648);
    float _652 = _622 + _650;
    out.m_45.x = _600;
    out.m_45.y = _612;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _652;
    return out;
}

