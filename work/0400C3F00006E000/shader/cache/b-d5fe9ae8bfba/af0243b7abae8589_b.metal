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
    float2 _771 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_771, float2(0.0), isnan(_771))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_771, float2(0.0), isnan(_771))).x;
    float _58 = in.m_42.y;
    float _60 = in.m_42.x;
    float _62 = -_56;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].z, _64);
    float _68 = _66 * _58;
    float _70 = _66 * _60;
    float _72 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _74 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _76 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _78 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _72);
    float _80 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _82 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _76);
    float _84 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _78);
    float _86 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _80);
    float _88 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _82);
    float _90 = _84 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _92 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _74);
    float _94 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _86);
    float _96 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _98 = _88 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _100 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _92);
    float _102 = 1.0 / _90;
    float _104 = _94 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _106 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _108 = _100 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _110 = _104 * _102;
    float _112 = precise::clamp(_110, 0.0, 1.0);
    float _114 = _108 * _102;
    float _116 = _98 * _102;
    float _118 = _112 * _96;
    float _120 = _112 * _106;
    float _122 = fma(_118, 1.5, _114);
    float _124 = fma(_120, 1.5, _116);
    float _126 = fma(_118, 0.5, _114);
    float3 _924 = float3(_122, _124, float(0));
    float3 _928 = select(_924, float3(0.0), isnan(_924));
    float _128 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _928.xy, uint(rint(_928.z)), _112);
    float3 _935 = float3(_126, _124, float(0));
    float3 _937 = select(_935, float3(0.0), isnan(_935));
    float _130 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _937.xy, uint(rint(_937.z)), _112);
    float _132 = -_68;
    float _134 = _132 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _136 = -_70;
    float _138 = _136 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _140 = _68 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _142 = _68 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _144 = _134 * _134;
    float _146 = _68 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _148 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].x, _140);
    float _150 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].x, _142);
    float _152 = fma(_138, _138, _144);
    float _154 = -_66;
    float _156 = _154 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _158 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].x, _146);
    float _160 = fma(_120, 0.5, _116);
    float _162 = fma(_120, -0.5, _116);
    float _164 = fma(_156, _156, _152);
    float _166 = fma(_120, -1.5, _116);
    float _168 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _158);
    float _170 = _68 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _172 = sqrt(_164);
    float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _150);
    float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _148);
    float _178 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].x, _170);
    float _180 = _174 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _182 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _178);
    float _184 = _68 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    bool _188 = _172 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _190 = _172 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _192 = !_188;
    int _195 = _192 ? 0 : 1;
    int _197 = 2;
    float _199 = _180;
    if (!_188)
    {
        _197 = 1;
    }
    int _201 = _197;
    int _203 = _201;
    if (!_190)
    {
        _203 = _195;
    }
    int _205 = _203;
    float _207 = _68 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _209 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].x, _207);
    float _211 = _68 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _213 = float(_205);
    float _215 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _209);
    float _217 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].x, _211);
    float _219 = precise::min(_213, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _221 = _215 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _223 = fma(_118, -0.5, _114);
    float _225 = fma(_118, -1.5, _114);
    bool _227 = _219 != 1.0;
    bool _229 = isnan(_219);
    bool _231 = _227 || _229;
    bool _233 = isnan(1.0);
    bool _235 = _231 || _233;
    float _237 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _217);
    float3 _1140 = float3(_223, _124, float(0));
    float3 _1142 = select(_1140, float3(0.0), isnan(_1140));
    float _239 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1142.xy, uint(rint(_1142.z)), _112);
    float _241 = _237 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float3 _1153 = float3(_225, _124, float(0));
    float3 _1155 = select(_1153, float3(0.0), isnan(_1153));
    float _243 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1155.xy, uint(rint(_1155.z)), _112);
    float _245 = _241;
    float _247 = _221;
    if (_235)
    {
        float _249 = _168 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _245 = _249;
    }
    float _251 = _245;
    float _253 = _251;
    if (_235)
    {
        float _255 = _182 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _199 = _255;
    }
    float _257 = _199;
    float _259 = _257;
    if (_235)
    {
        float _261 = _176 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _247 = _261;
    }
    float _263 = _247;
    bool _265 = _219 != 0.0;
    bool _267 = isnan(_219);
    bool _269 = _265 || _267;
    bool _271 = isnan(0.0);
    bool _273 = _269 || _271;
    float _275 = _128 + _130;
    float3 _1207 = float3(_122, _160, float(0));
    float3 _1209 = select(_1207, float3(0.0), isnan(_1207));
    float _277 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1209.xy, uint(rint(_1209.z)), _112);
    float3 _1216 = float3(_126, _160, float(0));
    float3 _1218 = select(_1216, float3(0.0), isnan(_1216));
    float _279 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1218.xy, uint(rint(_1218.z)), _112);
    float3 _1225 = float3(_223, _160, float(0));
    float3 _1227 = select(_1225, float3(0.0), isnan(_1225));
    float _281 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1227.xy, uint(rint(_1227.z)), _112);
    float3 _1234 = float3(_225, _160, float(0));
    float3 _1236 = select(_1234, float3(0.0), isnan(_1234));
    float _283 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1236.xy, uint(rint(_1236.z)), _112);
    float _285 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].x, _184);
    float _287 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _285);
    float _289 = _263;
    if (!_273)
    {
        float _291 = _287 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _289 = _291;
    }
    float _293 = _289;
    float _295 = _275 + _239;
    float _297 = _295 + _243;
    float _299 = _68 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _301 = _297 + _277;
    float _303 = _301 + _279;
    float _305 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].x, _299);
    float3 _1286 = float3(_122, _162, float(0));
    float3 _1288 = select(_1286, float3(0.0), isnan(_1286));
    float _307 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1288.xy, uint(rint(_1288.z)), _112);
    float3 _1295 = float3(_126, _162, float(0));
    float3 _1297 = select(_1295, float3(0.0), isnan(_1295));
    float _309 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1297.xy, uint(rint(_1297.z)), _112);
    float3 _1304 = float3(_223, _162, float(0));
    float3 _1306 = select(_1304, float3(0.0), isnan(_1304));
    float _311 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1306.xy, uint(rint(_1306.z)), _112);
    float _313 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _305);
    float3 _1318 = float3(_225, _162, float(0));
    float3 _1320 = select(_1318, float3(0.0), isnan(_1318));
    float _315 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1320.xy, uint(rint(_1320.z)), _112);
    float _317 = _68 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _319 = _303 + _281;
    if (!_273)
    {
        float _321 = _313 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _253 = _321;
    }
    float _323 = _253;
    float _325 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].x, _317);
    float _327 = _319 + _283;
    float _329 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _325);
    if (!_273)
    {
        float _331 = _329 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _259 = _331;
    }
    float _333 = _259;
    float _335 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _337 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float3 _1378 = float3(_122, _166, float(0));
    float3 _1380 = select(_1378, float3(0.0), isnan(_1378));
    float _339 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1380.xy, uint(rint(_1380.z)), _112);
    float3 _1387 = float3(_126, _166, float(0));
    float3 _1389 = select(_1387, float3(0.0), isnan(_1387));
    float _341 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1389.xy, uint(rint(_1389.z)), _112);
    float _343 = 0.0 + _333;
    float _345 = precise::clamp(_343, 0.0, 1.0);
    float _347 = _345 * _335;
    float3 _1403 = float3(_223, _166, float(0));
    float3 _1405 = select(_1403, float3(0.0), isnan(_1403));
    float _349 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1405.xy, uint(rint(_1405.z)), _112);
    float _351 = fma(_347, 0.5, _293);
    float _353 = fma(_347, 1.5, _293);
    float3 _1418 = float3(_225, _166, float(0));
    float3 _1420 = select(_1418, float3(0.0), isnan(_1418));
    float _355 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1420.xy, uint(rint(_1420.z)), _112);
    float _357 = _327 + _307;
    float _359 = _357 + _309;
    float _361 = _345 * _337;
    float _363 = rint(_219);
    float _365 = precise::max(_363, 0.0);
    uint _368 = uint(_365);
    uint _370 = clamp(_368, 0u, 65535u);
    float _372 = _359 + _311;
    float _374 = fma(_361, 1.5, _323);
    float3 _1454 = float3(_351, _374, float(int(_370)));
    float3 _1456 = select(_1454, float3(0.0), isnan(_1454));
    float _376 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1456.xy, uint(rint(_1456.z)), _345);
    float3 _1465 = float3(_353, _374, float(int(_370)));
    float3 _1467 = select(_1465, float3(0.0), isnan(_1465));
    float _378 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1467.xy, uint(rint(_1467.z)), _345);
    float _380 = _372 + _315;
    float _382 = fma(_347, -0.5, _293);
    float _384 = fma(_347, -1.5, _293);
    float _386 = _380 + _339;
    float _388 = fma(_361, -0.5, _323);
    float _390 = _386 + _341;
    float3 _1494 = float3(_382, _374, float(int(_370)));
    float3 _1496 = select(_1494, float3(0.0), isnan(_1494));
    float _392 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1496.xy, uint(rint(_1496.z)), _345);
    float _394 = _390 + _349;
    float _396 = _394 + _355;
    float _398 = fma(_361, 0.5, _323);
    float3 _1514 = float3(_384, _374, float(int(_370)));
    float3 _1516 = select(_1514, float3(0.0), isnan(_1514));
    float _400 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1516.xy, uint(rint(_1516.z)), _345);
    float3 _1525 = float3(_353, _398, float(int(_370)));
    float3 _1527 = select(_1525, float3(0.0), isnan(_1525));
    float _402 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1527.xy, uint(rint(_1527.z)), _345);
    float _404 = _378 + _376;
    float3 _1539 = float3(_351, _398, float(int(_370)));
    float3 _1541 = select(_1539, float3(0.0), isnan(_1539));
    float _406 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1541.xy, uint(rint(_1541.z)), _345);
    float3 _1550 = float3(_382, _398, float(int(_370)));
    float3 _1552 = select(_1550, float3(0.0), isnan(_1550));
    float _408 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1552.xy, uint(rint(_1552.z)), _345);
    float3 _1561 = float3(_384, _398, float(int(_370)));
    float3 _1563 = select(_1561, float3(0.0), isnan(_1561));
    float _410 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1563.xy, uint(rint(_1563.z)), _345);
    float3 _1572 = float3(_353, _388, float(int(_370)));
    float3 _1574 = select(_1572, float3(0.0), isnan(_1572));
    float _412 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1574.xy, uint(rint(_1574.z)), _345);
    float _414 = _404 + _392;
    float _416 = _414 + _400;
    float _418 = fma(_361, -1.5, _323);
    float3 _1592 = float3(_351, _388, float(int(_370)));
    float3 _1594 = select(_1592, float3(0.0), isnan(_1592));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1594.xy, uint(rint(_1594.z)), _345);
    float _422 = _416 + _402;
    float3 _1606 = float3(_382, _388, float(int(_370)));
    float3 _1608 = select(_1606, float3(0.0), isnan(_1606));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1608.xy, uint(rint(_1608.z)), _345);
    float _426 = _422 + _406;
    float _428 = _426 + _408;
    float3 _1623 = float3(_384, _388, float(int(_370)));
    float3 _1625 = select(_1623, float3(0.0), isnan(_1623));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1625.xy, uint(rint(_1625.z)), _345);
    float3 _1634 = float3(_353, _418, float(int(_370)));
    float3 _1636 = select(_1634, float3(0.0), isnan(_1634));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1636.xy, uint(rint(_1636.z)), _345);
    float3 _1645 = float3(_351, _418, float(int(_370)));
    float3 _1647 = select(_1645, float3(0.0), isnan(_1645));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1647.xy, uint(rint(_1647.z)), _345);
    float _436 = _428 + _410;
    float _438 = _436 + _412;
    float3 _1662 = float3(_382, _418, float(int(_370)));
    float3 _1664 = select(_1662, float3(0.0), isnan(_1662));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1664.xy, uint(rint(_1664.z)), _345);
    float _442 = -_68;
    float _444 = _442 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _446 = -_70;
    float _448 = _446 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _450 = _444 * _444;
    float _452 = fma(_448, _448, _450);
    float _454 = -_66;
    float _456 = _454 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _458 = fma(_456, _456, _452);
    float _460 = sqrt(_458);
    float _462 = _68 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _464 = _68 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _466 = _68 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _468 = _68 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _470 = _68 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _472 = _68 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _474 = _68 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _476 = _68 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _478 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].x, _470);
    float _480 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].x, _468);
    float _482 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].x, _466);
    float _484 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].x, _472);
    float _486 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].x, _474);
    float _488 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].x, _476);
    bool _490 = _460 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _492 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _478);
    bool _494 = _460 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _496 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _488);
    bool _498 = !_490;
    int _500 = _498 ? 0 : 1;
    float _502 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _480);
    float _504 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _484);
    float _506 = _492 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _508 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _482);
    float _510 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _486);
    float _512 = _438 + _420;
    float _514 = _508 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    int _516 = 2;
    float _518 = _506;
    float _520 = _514;
    if (!_490)
    {
        _516 = 1;
    }
    int _522 = _516;
    float _524 = _512 + _424;
    int _526 = _522;
    if (!_494)
    {
        _526 = _500;
    }
    int _528 = _526;
    float _530 = _68 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _532 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].x, _462);
    float _534 = float(_528);
    float _536 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].x, _464);
    float _538 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].x, _530);
    float _540 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _532);
    float _542 = precise::min(_534, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _544 = _502 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _546 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _538);
    float _548 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _536);
    bool _550 = _542 != 1.0;
    bool _552 = isnan(_542);
    bool _554 = _550 || _552;
    bool _556 = isnan(1.0);
    bool _558 = _554 || _556;
    float _560 = rint(_542);
    float _562 = precise::max(_560, 0.0);
    uint _564 = uint(_562);
    uint _566 = clamp(_564, 0u, 65535u);
    bool _568 = _542 != 0.0;
    bool _570 = isnan(_542);
    bool _572 = _568 || _570;
    bool _574 = isnan(0.0);
    bool _576 = _572 || _574;
    float _578 = _544;
    if (_558)
    {
        float _580 = _496 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _518 = _580;
    }
    float _582 = _518;
    float _584 = _582;
    if (_558)
    {
        float _586 = _504 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _578 = _586;
    }
    float _588 = _578;
    float _590 = _588;
    if (!_576)
    {
        float _592 = _546 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _584 = _592;
    }
    float _594 = _584;
    if (!_576)
    {
        float _596 = _540 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _590 = _596;
    }
    float _598 = _590;
    if (_558)
    {
        float _600 = _510 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _520 = _600;
    }
    float _602 = _520;
    float _604 = _602;
    if (!_576)
    {
        float _606 = _548 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _604 = _606;
    }
    float _608 = _604;
    float _610 = 0.0 + _594;
    float _612 = precise::clamp(_610, 0.0, 1.0);
    float _614 = _335 * _612;
    float _616 = _337 * _612;
    float3 _1991 = float3(_384, _418, float(int(_370)));
    float3 _1993 = select(_1991, float3(0.0), isnan(_1991));
    float _618 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1993.xy, uint(rint(_1993.z)), _345);
    float _620 = fma(_614, 0.5, _598);
    float _622 = fma(_616, 1.5, _608);
    float _624 = fma(_616, 0.5, _608);
    float _626 = -_66;
    float _628 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _630 = _626 + _628;
    float3 _2019 = float3(_620, _622, float(int(_566)));
    float3 _2021 = select(_2019, float3(0.0), isnan(_2019));
    float _632 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2021.xy, uint(rint(_2021.z)), _612);
    float _634 = _630 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _636 = precise::clamp(_634, 0.0, 1.0);
    float _638 = _524 + _430;
    float _640 = fma(_614, 1.5, _598);
    float _642 = _638 + _432;
    float _644 = fma(_614, -0.5, _598);
    float3 _2048 = float3(_640, _622, float(int(_566)));
    float3 _2050 = select(_2048, float3(0.0), isnan(_2048));
    float _646 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2050.xy, uint(rint(_2050.z)), _612);
    float _648 = _642 + _434;
    float3 _2062 = float3(_644, _622, float(int(_566)));
    float3 _2064 = select(_2062, float3(0.0), isnan(_2062));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2064.xy, uint(rint(_2064.z)), _612);
    float _652 = fma(_614, -1.5, _598);
    float _654 = _648 + _440;
    float3 _2079 = float3(_652, _622, float(int(_566)));
    float3 _2081 = select(_2079, float3(0.0), isnan(_2079));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2081.xy, uint(rint(_2081.z)), _612);
    float3 _2090 = float3(_640, _624, float(int(_566)));
    float3 _2092 = select(_2090, float3(0.0), isnan(_2090));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2092.xy, uint(rint(_2092.z)), _612);
    float3 _2101 = float3(_620, _624, float(int(_566)));
    float3 _2103 = select(_2101, float3(0.0), isnan(_2101));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2103.xy, uint(rint(_2103.z)), _612);
    float _662 = fma(_396, 0.0625, _636);
    float _664 = fma(_616, -0.5, _608);
    float _666 = fma(_616, -1.5, _608);
    float _668 = _646 + _632;
    float _670 = _654 + _618;
    float _672 = _668 + _650;
    float3 _2131 = float3(_644, _624, float(int(_566)));
    float3 _2133 = select(_2131, float3(0.0), isnan(_2131));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2133.xy, uint(rint(_2133.z)), _612);
    float2 _2139 = float2(_52, _54);
    float2 _678 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2139, float2(0.0), isnan(_2139))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2139, float2(0.0), isnan(_2139))).xy;
    float _680 = _678.x;
    float _682 = _678.y;
    float _684 = _672 + _656;
    float _686 = _684 + _658;
    float3 _2160 = float3(_652, _624, float(int(_566)));
    float3 _2162 = select(_2160, float3(0.0), isnan(_2160));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2162.xy, uint(rint(_2162.z)), _612);
    float3 _2171 = float3(_640, _664, float(int(_566)));
    float3 _2173 = select(_2171, float3(0.0), isnan(_2171));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2173.xy, uint(rint(_2173.z)), _612);
    float3 _2182 = float3(_620, _664, float(int(_566)));
    float3 _2184 = select(_2182, float3(0.0), isnan(_2182));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2184.xy, uint(rint(_2184.z)), _612);
    float3 _2193 = float3(_644, _664, float(int(_566)));
    float3 _2195 = select(_2193, float3(0.0), isnan(_2193));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2195.xy, uint(rint(_2195.z)), _612);
    float3 _2204 = float3(_652, _664, float(int(_566)));
    float3 _2206 = select(_2204, float3(0.0), isnan(_2204));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2206.xy, uint(rint(_2206.z)), _612);
    float _698 = _686 + _660;
    float _700 = fma(_680, 2.0, -1.0);
    float _702 = fma(_682, 2.0, -1.0);
    float _704 = _700 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _706 = _702 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _708 = _698 + _674;
    float _710 = fma(_704, 2.0, _52);
    float _712 = fma(_706, 2.0, _54);
    float3 _2242 = float3(_640, _666, float(int(_566)));
    float3 _2244 = select(_2242, float3(0.0), isnan(_2242));
    float _714 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2244.xy, uint(rint(_2244.z)), _612);
    float3 _2253 = float3(_620, _666, float(int(_566)));
    float3 _2255 = select(_2253, float3(0.0), isnan(_2253));
    float _716 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2255.xy, uint(rint(_2255.z)), _612);
    float3 _2264 = float3(_644, _666, float(int(_566)));
    float3 _2266 = select(_2264, float3(0.0), isnan(_2264));
    float _718 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2266.xy, uint(rint(_2266.z)), _612);
    float3 _2275 = float3(_652, _666, float(int(_566)));
    float3 _2277 = select(_2275, float3(0.0), isnan(_2275));
    float _720 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2277.xy, uint(rint(_2277.z)), _612);
    float2 _2283 = float2(_710, _712);
    float _722 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2283, float2(0.0), isnan(_2283))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2283, float2(0.0), isnan(_2283))).x;
    float _724 = _708 + _688;
    float _726 = _670 * 0.0625;
    float _728 = _724 + _690;
    float _730 = _728 + _692;
    float _732 = _730 + _694;
    float _734 = _732 + _696;
    float _736 = -_66;
    float _738 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _740 = _736 + _738;
    float _742 = _740 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _744 = precise::clamp(_742, 0.0, 1.0);
    float _746 = _734 + _714;
    float _748 = _746 + _716;
    float _750 = _748 + _718;
    float _752 = _750 + _720;
    float _754 = _752 * 0.0625;
    float _756 = _754 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _758 = fma(_726, (*spvDescriptorSet0.fp_c3)._m0[49].z, _756);
    float _760 = _744 + _758;
    out.m_45.x = _722;
    out.m_45.y = _662;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _760;
    return out;
}

