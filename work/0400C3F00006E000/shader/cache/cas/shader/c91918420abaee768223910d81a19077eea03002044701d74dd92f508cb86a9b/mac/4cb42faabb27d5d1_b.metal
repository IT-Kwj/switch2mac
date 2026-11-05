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
    texture2d_array<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
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
    float2 _775 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_775, float2(0.0), isnan(_775))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_775, float2(0.0), isnan(_775))).x;
    float _58 = in.m_42.y;
    float _60 = in.m_42.x;
    float _62 = -_56;
    float _64 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _66 = 1.0 / _64;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = _66 * _68;
    float _72 = _70 * _58;
    float _74 = _70 * _60;
    float _76 = _72 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _78 = _72 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _80 = _72 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _82 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].x, _76);
    float _84 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _86 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].x, _78);
    float _88 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].x, _80);
    float _90 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _82);
    float _92 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _94 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _86);
    float _96 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _88);
    float _98 = _90 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _100 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].x, _84);
    float _102 = _94 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _104 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _106 = _96 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _108 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _100);
    float _110 = 1.0 / _98;
    float _112 = _108 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _114 = _102 * _110;
    float _116 = precise::clamp(_114, 0.0, 1.0);
    float _118 = _112 * _110;
    float _120 = _106 * _110;
    float _122 = _116 * _104;
    float _124 = _116 * _92;
    float _126 = fma(_122, 1.5, _118);
    float _128 = fma(_124, 1.5, _120);
    float _130 = fma(_122, 0.5, _118);
    float3 _932 = float3(_126, _128, float(0));
    float3 _936 = select(_932, float3(0.0), isnan(_932));
    float _132 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _936.xy, uint(rint(_936.z)), _116);
    float3 _943 = float3(_130, _128, float(0));
    float3 _945 = select(_943, float3(0.0), isnan(_943));
    float _134 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _945.xy, uint(rint(_945.z)), _116);
    float _136 = -_72;
    float _138 = _136 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _140 = -_74;
    float _142 = _140 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _144 = _72 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _146 = _72 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _148 = _138 * _138;
    float _150 = _72 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _152 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[22].x, _144);
    float _154 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[21].x, _146);
    float _156 = fma(_142, _142, _148);
    float _158 = -_70;
    float _160 = _158 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _162 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[23].x, _150);
    float _164 = fma(_124, 0.5, _120);
    float _166 = fma(_124, -0.5, _120);
    float _168 = fma(_160, _160, _156);
    float _170 = fma(_124, -1.5, _120);
    float _172 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].z, _162);
    float _174 = _72 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _176 = sqrt(_168);
    float _178 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].z, _154);
    float _180 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].z, _152);
    float _182 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[24].x, _174);
    float _184 = _178 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _186 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].z, _182);
    float _188 = _72 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    bool _192 = _176 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _194 = _176 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _196 = !_192;
    int _199 = _196 ? 0 : 1;
    int _201 = 2;
    float _203 = _184;
    if (!_192)
    {
        _201 = 1;
    }
    int _205 = _201;
    int _207 = _205;
    if (!_194)
    {
        _207 = _199;
    }
    int _209 = _207;
    float _211 = _72 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _213 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[19].x, _211);
    float _215 = _72 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _217 = float(_209);
    float _219 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].z, _213);
    float _221 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[20].x, _215);
    float _223 = precise::min(_217, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _225 = _219 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _227 = fma(_122, -0.5, _118);
    float _229 = fma(_122, -1.5, _118);
    bool _231 = _223 != 1.0;
    bool _233 = isnan(_223);
    bool _235 = _231 || _233;
    bool _237 = isnan(1.0);
    bool _239 = _235 || _237;
    float _241 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].z, _221);
    float3 _1148 = float3(_227, _128, float(0));
    float3 _1150 = select(_1148, float3(0.0), isnan(_1148));
    float _243 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1150.xy, uint(rint(_1150.z)), _116);
    float _245 = _241 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float3 _1161 = float3(_229, _128, float(0));
    float3 _1163 = select(_1161, float3(0.0), isnan(_1161));
    float _247 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1163.xy, uint(rint(_1163.z)), _116);
    float _249 = _245;
    float _251 = _225;
    if (_239)
    {
        float _253 = _172 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _249 = _253;
    }
    float _255 = _249;
    float _257 = _255;
    if (_239)
    {
        float _259 = _186 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _203 = _259;
    }
    float _261 = _203;
    float _263 = _261;
    if (_239)
    {
        float _265 = _180 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _251 = _265;
    }
    float _267 = _251;
    bool _269 = _223 != 0.0;
    bool _271 = isnan(_223);
    bool _273 = _269 || _271;
    bool _275 = isnan(0.0);
    bool _277 = _273 || _275;
    float _279 = _132 + _134;
    float3 _1215 = float3(_126, _164, float(0));
    float3 _1217 = select(_1215, float3(0.0), isnan(_1215));
    float _281 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1217.xy, uint(rint(_1217.z)), _116);
    float3 _1224 = float3(_130, _164, float(0));
    float3 _1226 = select(_1224, float3(0.0), isnan(_1224));
    float _283 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1226.xy, uint(rint(_1226.z)), _116);
    float3 _1233 = float3(_227, _164, float(0));
    float3 _1235 = select(_1233, float3(0.0), isnan(_1233));
    float _285 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1235.xy, uint(rint(_1235.z)), _116);
    float3 _1242 = float3(_229, _164, float(0));
    float3 _1244 = select(_1242, float3(0.0), isnan(_1242));
    float _287 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1244.xy, uint(rint(_1244.z)), _116);
    float _289 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[16].x, _188);
    float _291 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].z, _289);
    float _293 = _267;
    if (!_277)
    {
        float _295 = _291 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _293 = _295;
    }
    float _297 = _293;
    float _299 = _279 + _243;
    float _301 = _299 + _247;
    float _303 = _72 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _305 = _301 + _281;
    float _307 = _305 + _283;
    float _309 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[17].x, _303);
    float3 _1294 = float3(_126, _166, float(0));
    float3 _1296 = select(_1294, float3(0.0), isnan(_1294));
    float _311 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1296.xy, uint(rint(_1296.z)), _116);
    float3 _1303 = float3(_130, _166, float(0));
    float3 _1305 = select(_1303, float3(0.0), isnan(_1303));
    float _313 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1305.xy, uint(rint(_1305.z)), _116);
    float3 _1312 = float3(_227, _166, float(0));
    float3 _1314 = select(_1312, float3(0.0), isnan(_1312));
    float _315 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1314.xy, uint(rint(_1314.z)), _116);
    float _317 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].z, _309);
    float3 _1326 = float3(_229, _166, float(0));
    float3 _1328 = select(_1326, float3(0.0), isnan(_1326));
    float _319 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1328.xy, uint(rint(_1328.z)), _116);
    float _321 = _72 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _323 = _307 + _285;
    if (!_277)
    {
        float _325 = _317 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _257 = _325;
    }
    float _327 = _257;
    float _329 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[18].x, _321);
    float _331 = _323 + _287;
    float _333 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].z, _329);
    if (!_277)
    {
        float _335 = _333 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _263 = _335;
    }
    float _337 = _263;
    float _339 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _341 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float3 _1386 = float3(_126, _170, float(0));
    float3 _1388 = select(_1386, float3(0.0), isnan(_1386));
    float _343 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1388.xy, uint(rint(_1388.z)), _116);
    float3 _1395 = float3(_130, _170, float(0));
    float3 _1397 = select(_1395, float3(0.0), isnan(_1395));
    float _345 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1397.xy, uint(rint(_1397.z)), _116);
    float _347 = 0.0 + _337;
    float _349 = precise::clamp(_347, 0.0, 1.0);
    float _351 = _349 * _339;
    float3 _1411 = float3(_227, _170, float(0));
    float3 _1413 = select(_1411, float3(0.0), isnan(_1411));
    float _353 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1413.xy, uint(rint(_1413.z)), _116);
    float _355 = fma(_351, 0.5, _297);
    float _357 = fma(_351, 1.5, _297);
    float3 _1426 = float3(_229, _170, float(0));
    float3 _1428 = select(_1426, float3(0.0), isnan(_1426));
    float _359 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1428.xy, uint(rint(_1428.z)), _116);
    float _361 = _331 + _311;
    float _363 = _361 + _313;
    float _365 = _349 * _341;
    float _367 = rint(_223);
    float _369 = precise::max(_367, 0.0);
    uint _372 = uint(_369);
    uint _374 = clamp(_372, 0u, 65535u);
    float _376 = _363 + _315;
    float _378 = fma(_365, 1.5, _327);
    float3 _1462 = float3(_355, _378, float(int(_374)));
    float3 _1464 = select(_1462, float3(0.0), isnan(_1462));
    float _380 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1464.xy, uint(rint(_1464.z)), _349);
    float3 _1473 = float3(_357, _378, float(int(_374)));
    float3 _1475 = select(_1473, float3(0.0), isnan(_1473));
    float _382 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1475.xy, uint(rint(_1475.z)), _349);
    float _384 = _376 + _319;
    float _386 = fma(_351, -0.5, _297);
    float _388 = fma(_351, -1.5, _297);
    float _390 = _384 + _343;
    float _392 = fma(_365, -0.5, _327);
    float _394 = _390 + _345;
    float3 _1502 = float3(_386, _378, float(int(_374)));
    float3 _1504 = select(_1502, float3(0.0), isnan(_1502));
    float _396 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1504.xy, uint(rint(_1504.z)), _349);
    float _398 = _394 + _353;
    float _400 = _398 + _359;
    float _402 = fma(_365, 0.5, _327);
    float3 _1522 = float3(_388, _378, float(int(_374)));
    float3 _1524 = select(_1522, float3(0.0), isnan(_1522));
    float _404 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1524.xy, uint(rint(_1524.z)), _349);
    float3 _1533 = float3(_357, _402, float(int(_374)));
    float3 _1535 = select(_1533, float3(0.0), isnan(_1533));
    float _406 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1535.xy, uint(rint(_1535.z)), _349);
    float _408 = _382 + _380;
    float3 _1547 = float3(_355, _402, float(int(_374)));
    float3 _1549 = select(_1547, float3(0.0), isnan(_1547));
    float _410 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1549.xy, uint(rint(_1549.z)), _349);
    float3 _1558 = float3(_386, _402, float(int(_374)));
    float3 _1560 = select(_1558, float3(0.0), isnan(_1558));
    float _412 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1560.xy, uint(rint(_1560.z)), _349);
    float3 _1569 = float3(_388, _402, float(int(_374)));
    float3 _1571 = select(_1569, float3(0.0), isnan(_1569));
    float _414 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1571.xy, uint(rint(_1571.z)), _349);
    float3 _1580 = float3(_357, _392, float(int(_374)));
    float3 _1582 = select(_1580, float3(0.0), isnan(_1580));
    float _416 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1582.xy, uint(rint(_1582.z)), _349);
    float _418 = _408 + _396;
    float _420 = _418 + _404;
    float _422 = fma(_365, -1.5, _327);
    float3 _1600 = float3(_355, _392, float(int(_374)));
    float3 _1602 = select(_1600, float3(0.0), isnan(_1600));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1602.xy, uint(rint(_1602.z)), _349);
    float _426 = _420 + _406;
    float3 _1614 = float3(_386, _392, float(int(_374)));
    float3 _1616 = select(_1614, float3(0.0), isnan(_1614));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1616.xy, uint(rint(_1616.z)), _349);
    float _430 = _426 + _410;
    float _432 = _430 + _412;
    float3 _1631 = float3(_388, _392, float(int(_374)));
    float3 _1633 = select(_1631, float3(0.0), isnan(_1631));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1633.xy, uint(rint(_1633.z)), _349);
    float3 _1642 = float3(_357, _422, float(int(_374)));
    float3 _1644 = select(_1642, float3(0.0), isnan(_1642));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1644.xy, uint(rint(_1644.z)), _349);
    float3 _1653 = float3(_355, _422, float(int(_374)));
    float3 _1655 = select(_1653, float3(0.0), isnan(_1653));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1655.xy, uint(rint(_1655.z)), _349);
    float _440 = _432 + _414;
    float _442 = _440 + _416;
    float3 _1670 = float3(_386, _422, float(int(_374)));
    float3 _1672 = select(_1670, float3(0.0), isnan(_1670));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1672.xy, uint(rint(_1672.z)), _349);
    float _446 = -_72;
    float _448 = _446 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _450 = -_74;
    float _452 = _450 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _454 = _448 * _448;
    float _456 = fma(_452, _452, _454);
    float _458 = -_70;
    float _460 = _458 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _462 = fma(_460, _460, _456);
    float _464 = sqrt(_462);
    float _466 = _72 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _468 = _72 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _470 = _72 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _472 = _72 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _474 = _72 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _476 = _72 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _478 = _72 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _480 = _72 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _482 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[30].x, _474);
    float _484 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[28].x, _472);
    float _486 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[29].x, _470);
    float _488 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[31].x, _476);
    float _490 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[32].x, _478);
    float _492 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[33].x, _480);
    bool _494 = _464 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _496 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].z, _482);
    bool _498 = _464 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _500 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].z, _492);
    bool _502 = !_494;
    int _504 = _502 ? 0 : 1;
    float _506 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].z, _484);
    float _508 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].z, _488);
    float _510 = _496 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _512 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].z, _486);
    float _514 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].z, _490);
    float _516 = _442 + _424;
    float _518 = _512 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    int _520 = 2;
    float _522 = _510;
    float _524 = _518;
    if (!_494)
    {
        _520 = 1;
    }
    int _526 = _520;
    float _528 = _516 + _428;
    int _530 = _526;
    if (!_498)
    {
        _530 = _504;
    }
    int _532 = _530;
    float _534 = _72 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _536 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[25].x, _466);
    float _538 = float(_532);
    float _540 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[26].x, _468);
    float _542 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[27].x, _534);
    float _544 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].z, _536);
    float _546 = precise::min(_538, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _548 = _506 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _550 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].z, _542);
    float _552 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].z, _540);
    bool _554 = _546 != 1.0;
    bool _556 = isnan(_546);
    bool _558 = _554 || _556;
    bool _560 = isnan(1.0);
    bool _562 = _558 || _560;
    float _564 = rint(_546);
    float _566 = precise::max(_564, 0.0);
    uint _568 = uint(_566);
    uint _570 = clamp(_568, 0u, 65535u);
    bool _572 = _546 != 0.0;
    bool _574 = isnan(_546);
    bool _576 = _572 || _574;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    float _582 = _548;
    if (_562)
    {
        float _584 = _500 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _522 = _584;
    }
    float _586 = _522;
    float _588 = _586;
    if (_562)
    {
        float _590 = _508 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _582 = _590;
    }
    float _592 = _582;
    float _594 = _592;
    if (!_580)
    {
        float _596 = _550 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _588 = _596;
    }
    float _598 = _588;
    if (!_580)
    {
        float _600 = _544 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _594 = _600;
    }
    float _602 = _594;
    if (_562)
    {
        float _604 = _514 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _524 = _604;
    }
    float _606 = _524;
    float _608 = _606;
    if (!_580)
    {
        float _610 = _552 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _608 = _610;
    }
    float _612 = _608;
    float _614 = 0.0 + _598;
    float _616 = precise::clamp(_614, 0.0, 1.0);
    float _618 = _339 * _616;
    float _620 = _341 * _616;
    float3 _1999 = float3(_388, _422, float(int(_374)));
    float3 _2001 = select(_1999, float3(0.0), isnan(_1999));
    float _622 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2001.xy, uint(rint(_2001.z)), _349);
    float _624 = fma(_618, 0.5, _602);
    float _626 = fma(_620, 1.5, _612);
    float _628 = fma(_620, 0.5, _612);
    float _630 = -_70;
    float _632 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _634 = _630 + _632;
    float3 _2027 = float3(_624, _626, float(int(_570)));
    float3 _2029 = select(_2027, float3(0.0), isnan(_2027));
    float _636 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2029.xy, uint(rint(_2029.z)), _616);
    float _638 = _634 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _640 = precise::clamp(_638, 0.0, 1.0);
    float _642 = _528 + _434;
    float _644 = fma(_618, 1.5, _602);
    float _646 = _642 + _436;
    float _648 = fma(_618, -0.5, _602);
    float3 _2056 = float3(_644, _626, float(int(_570)));
    float3 _2058 = select(_2056, float3(0.0), isnan(_2056));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2058.xy, uint(rint(_2058.z)), _616);
    float _652 = _646 + _438;
    float3 _2070 = float3(_648, _626, float(int(_570)));
    float3 _2072 = select(_2070, float3(0.0), isnan(_2070));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2072.xy, uint(rint(_2072.z)), _616);
    float _656 = fma(_618, -1.5, _602);
    float _658 = _652 + _444;
    float3 _2087 = float3(_656, _626, float(int(_570)));
    float3 _2089 = select(_2087, float3(0.0), isnan(_2087));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2089.xy, uint(rint(_2089.z)), _616);
    float3 _2098 = float3(_644, _628, float(int(_570)));
    float3 _2100 = select(_2098, float3(0.0), isnan(_2098));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2100.xy, uint(rint(_2100.z)), _616);
    float3 _2109 = float3(_624, _628, float(int(_570)));
    float3 _2111 = select(_2109, float3(0.0), isnan(_2109));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2111.xy, uint(rint(_2111.z)), _616);
    float _666 = fma(_400, 0.0625, _640);
    float _668 = fma(_620, -0.5, _612);
    float _670 = fma(_620, -1.5, _612);
    float _672 = _650 + _636;
    float _674 = _658 + _622;
    float _676 = _672 + _654;
    float3 _2139 = float3(_648, _628, float(int(_570)));
    float3 _2141 = select(_2139, float3(0.0), isnan(_2139));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2141.xy, uint(rint(_2141.z)), _616);
    float2 _2147 = float2(_52, _54);
    float2 _682 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2147, float2(0.0), isnan(_2147))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2147, float2(0.0), isnan(_2147))).xy;
    float _684 = _682.x;
    float _686 = _682.y;
    float _688 = _676 + _660;
    float _690 = _688 + _662;
    float3 _2168 = float3(_656, _628, float(int(_570)));
    float3 _2170 = select(_2168, float3(0.0), isnan(_2168));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2170.xy, uint(rint(_2170.z)), _616);
    float3 _2179 = float3(_644, _668, float(int(_570)));
    float3 _2181 = select(_2179, float3(0.0), isnan(_2179));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2181.xy, uint(rint(_2181.z)), _616);
    float3 _2190 = float3(_624, _668, float(int(_570)));
    float3 _2192 = select(_2190, float3(0.0), isnan(_2190));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2192.xy, uint(rint(_2192.z)), _616);
    float3 _2201 = float3(_648, _668, float(int(_570)));
    float3 _2203 = select(_2201, float3(0.0), isnan(_2201));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2203.xy, uint(rint(_2203.z)), _616);
    float3 _2212 = float3(_656, _668, float(int(_570)));
    float3 _2214 = select(_2212, float3(0.0), isnan(_2212));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2214.xy, uint(rint(_2214.z)), _616);
    float _702 = _690 + _664;
    float _704 = fma(_684, 2.0, -1.0);
    float _706 = fma(_686, 2.0, -1.0);
    float _708 = _704 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _710 = _706 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _712 = _702 + _678;
    float _714 = fma(_708, 2.0, _52);
    float _716 = fma(_710, 2.0, _54);
    float3 _2250 = float3(_644, _670, float(int(_570)));
    float3 _2252 = select(_2250, float3(0.0), isnan(_2250));
    float _718 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2252.xy, uint(rint(_2252.z)), _616);
    float3 _2261 = float3(_624, _670, float(int(_570)));
    float3 _2263 = select(_2261, float3(0.0), isnan(_2261));
    float _720 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2263.xy, uint(rint(_2263.z)), _616);
    float3 _2272 = float3(_648, _670, float(int(_570)));
    float3 _2274 = select(_2272, float3(0.0), isnan(_2272));
    float _722 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2274.xy, uint(rint(_2274.z)), _616);
    float3 _2283 = float3(_656, _670, float(int(_570)));
    float3 _2285 = select(_2283, float3(0.0), isnan(_2283));
    float _724 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2285.xy, uint(rint(_2285.z)), _616);
    float2 _2291 = float2(_714, _716);
    float _726 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2291, float2(0.0), isnan(_2291))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2291, float2(0.0), isnan(_2291))).x;
    float _728 = _712 + _692;
    float _730 = _674 * 0.0625;
    float _732 = _728 + _694;
    float _734 = _732 + _696;
    float _736 = _734 + _698;
    float _738 = _736 + _700;
    float _740 = -_70;
    float _742 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _744 = _740 + _742;
    float _746 = _744 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _748 = precise::clamp(_746, 0.0, 1.0);
    float _750 = _738 + _718;
    float _752 = _750 + _720;
    float _754 = _752 + _722;
    float _756 = _754 + _724;
    float _758 = _756 * 0.0625;
    float _760 = _758 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _762 = fma(_730, (*spvDescriptorSet0.fp_c3)._m0[49].z, _760);
    float _764 = _748 + _762;
    out.m_45.x = _726;
    out.m_45.y = _666;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _764;
    return out;
}

