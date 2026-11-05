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
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _268 = false;
    bool _266 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _489 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_489, float2(0.0), isnan(_489)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _506 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_506, float2(0.0), isnan(_506))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_506, float2(0.0), isnan(_506))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].z, _82);
    float _86 = -_62;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_64;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = _68 * _84;
    float _100 = _70 * _84;
    float _102 = -_98;
    float _104 = fma(_90, _72, _102);
    float _106 = -_98;
    float _108 = fma(_96, _74, _106);
    float _110 = -_100;
    float _112 = fma(_90, _76, _110);
    float _114 = -_100;
    float _116 = fma(_96, _78, _114);
    float _118 = _104 * _104;
    float _120 = _108 * _108;
    float _122 = -_84;
    float _124 = _122 + _90;
    float _126 = -_84;
    float _128 = _126 + _96;
    float _130 = fma(_112, _112, _118);
    float _132 = fma(_116, _116, _120);
    float _134 = fma(_124, _124, _130);
    float _136 = fma(_128, _128, _132);
    float _138 = rsqrt(_134);
    float _140 = rsqrt(_136);
    float _142 = _112 * _138;
    float _144 = _124 * _138;
    float _146 = _104 * _138;
    float _148 = _128 * _140;
    float _150 = _108 * _140;
    float _152 = _116 * _140;
    float _154 = _142 * _148;
    float _156 = _144 * _150;
    float _158 = -_154;
    float _160 = fma(_144, _152, _158);
    float _162 = _146 * _152;
    float _164 = -_156;
    float _166 = fma(_146, _148, _164);
    float _168 = _160 * _160;
    float _170 = -_162;
    float _172 = fma(_142, _150, _170);
    float _174 = -_66;
    float _176 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _178 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[46].z, _176);
    float _180 = fma(_166, _166, _168);
    float _182 = -_178;
    bool _186 = _182 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _188 = fma(_172, _172, _180);
    float _190 = -_178;
    bool _192 = _190 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _194 = !_186;
    uint _197 = uint(_194 ? 0 : 1);
    float _199 = rsqrt(_188);
    uint _201 = 2u;
    if (!_186)
    {
        _201 = 1u;
    }
    uint _203 = _201;
    uint _205 = _203;
    if (!_192)
    {
        _205 = _197;
    }
    uint _207 = _205;
    uint _209 = min(_207, 2u);
    float _211 = _160 * _199;
    float _213 = _166 * _199;
    float _215 = _172 * _199;
    int _218 = int(_209) << 2;
    float _220 = _211 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _222 = fma(_213, (*spvDescriptorSet0.fp_c3)._m0[35].x, _220);
    float _224 = fma(_215, (*spvDescriptorSet0.fp_c3)._m0[35].z, _222);
    uint _226 = uint(int(uint(_218) >> uint(2)));
    uint _228 = uint(int(uint(int(_226)) >> uint(2)));
    int _230 = int(_226) & 3;
    float _232 = (*spvDescriptorSet0.fp_c1)._m0[int(_228)][_230];
    float _234 = abs(_224);
    float _236 = -_234;
    float _238 = _236 + 1.0;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = abs(_240);
    float _244 = log2(_242);
    float _246 = _244 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _248 = exp2(_246);
    float _250 = _248 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _252 = _211 * _250;
    float _254 = _213 * _250;
    float _256 = fma(_215, _250, _178);
    float _258 = fma(_178, _68, _252);
    float _260 = fma(_178, _70, _254);
    bool _262 = as_type<int>(_232) == 1216;
    if (!_262)
    {
        bool _264 = as_type<int>(_232) == 1488;
        _266 = _264;
        if (!_266)
        {
            _268 = true;
        }
    }
    float _302;
    float _304;
    float _306;
    float _308;
    if (!_266)
    {
        if (!_268)
        {
            float _270 = _258 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _272 = _258 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _274 = _258 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _276 = _258 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _278 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[0].x, _270);
            float _280 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[1].x, _272);
            float _282 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[2].x, _274);
            float _284 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[3].x, _276);
            float _286 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[0].z, _278);
            float _288 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[1].z, _280);
            float _290 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[2].z, _282);
            float _292 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[3].z, _284);
            float _294 = _286 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _296 = _288 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _298 = _290 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _302 = _300;
            _304 = _298;
            _306 = _296;
            _308 = _294;
        }
    }
    if ((false || _268) || _266)
    {
        if ((!_268) || _266)
        {
            _266 = false;
            float _310 = _258 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _312 = _258 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _314 = _258 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _316 = _258 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _318 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[4].x, _310);
            float _320 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[5].x, _312);
            float _322 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[6].x, _314);
            float _324 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[7].x, _316);
            float _326 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[4].z, _318);
            float _328 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[5].z, _320);
            float _330 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[6].z, _322);
            float _332 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[7].z, _324);
            float _334 = _326 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _336 = _328 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _338 = _330 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _302 = _340;
            _304 = _338;
            _306 = _336;
            _308 = _334;
        }
        if (false || _268)
        {
            _268 = false;
            float _342 = _258 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _344 = _258 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _346 = _258 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _348 = _258 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _350 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[8].x, _342);
            float _352 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[9].x, _344);
            float _354 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[10].x, _346);
            float _356 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[11].x, _348);
            float _358 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[8].z, _350);
            float _360 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[9].z, _352);
            float _362 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[10].z, _354);
            float _364 = fma(_256, (*spvDescriptorSet0.fp_c3)._m0[11].z, _356);
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _370 = _362 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _302 = _372;
            _304 = _370;
            _306 = _368;
            _308 = _366;
        }
    }
    float _374 = _302;
    float _376 = _304;
    float _378 = _306;
    float _380 = _308;
    float _382 = float(int(_207));
    float _384 = 1.0 / _374;
    float _386 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _388 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _390 = rint(_382);
    float _392 = precise::max(_390, 0.0);
    uint _394 = uint(_392);
    uint _396 = clamp(_394, 0u, 65535u);
    float _398 = _384 * _376;
    float _400 = precise::clamp(_398, 0.0, 1.0);
    float _402 = _384 * _378;
    float _404 = _384 * _380;
    float _406 = fma(_400, _388, _402);
    float _408 = fma(_400, _386, _404);
    float _410 = -_386;
    float _412 = fma(_400, _410, _404);
    float _414 = -_388;
    float _416 = fma(_400, _414, _402);
    float3 _1157 = float3(_404, _406, float(int(_396)));
    float3 _1161 = select(_1157, float3(0.0), isnan(_1157));
    float _418 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1161.xy, uint(rint(_1161.z)), _400);
    float3 _1170 = float3(_408, _406, float(int(_396)));
    float3 _1172 = select(_1170, float3(0.0), isnan(_1170));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1172.xy, uint(rint(_1172.z)), _400);
    float3 _1181 = float3(_412, _406, float(int(_396)));
    float3 _1183 = select(_1181, float3(0.0), isnan(_1181));
    float _422 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1183.xy, uint(rint(_1183.z)), _400);
    float3 _1192 = float3(_408, _402, float(int(_396)));
    float3 _1194 = select(_1192, float3(0.0), isnan(_1192));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1194.xy, uint(rint(_1194.z)), _400);
    float3 _1203 = float3(_404, _402, float(int(_396)));
    float3 _1205 = select(_1203, float3(0.0), isnan(_1203));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1205.xy, uint(rint(_1205.z)), _400);
    float3 _1214 = float3(_412, _402, float(int(_396)));
    float3 _1216 = select(_1214, float3(0.0), isnan(_1214));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1216.xy, uint(rint(_1216.z)), _400);
    float3 _1225 = float3(_408, _416, float(int(_396)));
    float3 _1227 = select(_1225, float3(0.0), isnan(_1225));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1227.xy, uint(rint(_1227.z)), _400);
    float3 _1236 = float3(_404, _416, float(int(_396)));
    float3 _1238 = select(_1236, float3(0.0), isnan(_1236));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1238.xy, uint(rint(_1238.z)), _400);
    float3 _1247 = float3(_412, _416, float(int(_396)));
    float3 _1249 = select(_1247, float3(0.0), isnan(_1247));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1249.xy, uint(rint(_1249.z)), _400);
    float2 _1255 = float2(_52, _54);
    float _436 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1255, float2(0.0), isnan(_1255))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1255, float2(0.0), isnan(_1255))).x;
    float _438 = -_178;
    float _440 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _442 = _438 + _440;
    float _444 = _420 + _418;
    float _446 = _444 + _422;
    float _448 = _446 + _424;
    float _450 = _448 + _426;
    float _452 = _450 + _428;
    float _454 = _452 + _430;
    float _456 = _454 + _432;
    float _458 = -_178;
    float _460 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _462 = _458 + _460;
    float _464 = _462 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _466 = precise::clamp(_464, 0.0, 1.0);
    float _468 = _456 + _434;
    float _470 = _442 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _472 = precise::clamp(_470, 0.0, 1.0);
    float _474 = fma(_468, 0.111111111938953399658203125, _466);
    float _476 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[48].w, _472);
    out.m_45.x = _436;
    out.m_45.y = _474;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _476;
    return out;
}

