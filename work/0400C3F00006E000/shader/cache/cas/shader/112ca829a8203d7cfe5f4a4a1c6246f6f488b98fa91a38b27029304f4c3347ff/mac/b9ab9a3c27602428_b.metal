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
    float2 _467 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_467, float2(0.0), isnan(_467)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _484 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_484, float2(0.0), isnan(_484))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_40.y;
    float _72 = in.m_38.x;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].z, _82);
    float _86 = -_62;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = _68 * _84;
    float _94 = _72 * _84;
    float _96 = -_92;
    float _98 = fma(_90, _70, _96);
    float _100 = -_64;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[46].z, _102);
    float _106 = -_94;
    float _108 = fma(_90, _76, _106);
    float _110 = -_84;
    float _112 = _110 + _90;
    float _114 = _98 * _98;
    float _116 = -_92;
    float _118 = fma(_104, _74, _116);
    float _120 = -_94;
    float _122 = fma(_104, _78, _120);
    float _124 = -_84;
    float _126 = _124 + _104;
    float _128 = fma(_108, _108, _114);
    float _130 = _118 * _118;
    float _132 = fma(_112, _112, _128);
    float _134 = fma(_122, _122, _130);
    float _136 = fma(_126, _126, _134);
    float _138 = rsqrt(_132);
    float _140 = rsqrt(_136);
    float _142 = _108 * _138;
    float _144 = _112 * _138;
    float _146 = _98 * _138;
    float _148 = -_66;
    float _150 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _152 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[46].z, _150);
    float _154 = _126 * _140;
    float _156 = _122 * _140;
    float _158 = _118 * _140;
    float _160 = -_152;
    bool _164 = _160 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _166 = _142 * _154;
    float _168 = -_152;
    bool _170 = _168 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _172 = _144 * _158;
    bool _174 = !_164;
    uint _177 = uint(_174 ? 0 : 1);
    float _179 = -_166;
    float _181 = fma(_144, _156, _179);
    float _183 = _146 * _156;
    float _185 = -_172;
    float _187 = fma(_146, _154, _185);
    float _189 = _181 * _181;
    float _191 = -_183;
    float _193 = fma(_142, _158, _191);
    float _195 = fma(_187, _187, _189);
    uint _197 = 2u;
    if (!_164)
    {
        _197 = 1u;
    }
    uint _199 = _197;
    uint _201 = _199;
    if (!_170)
    {
        _201 = _177;
    }
    uint _203 = _201;
    float _205 = fma(_193, _193, _195);
    uint _207 = min(_203, 2u);
    float _209 = rsqrt(_205);
    int _212 = int(_207) << 2;
    float _214 = _181 * _209;
    float _216 = _187 * _209;
    float _218 = _193 * _209;
    float _220 = _214 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _222 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[35].x, _220);
    float _224 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[35].z, _222);
    uint _226 = uint(int(uint(_212) >> uint(2)));
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
    float _252 = _216 * _250;
    float _254 = _214 * _250;
    float _256 = fma(_218, _250, _152);
    float _258 = fma(_152, _72, _252);
    float _260 = fma(_152, _68, _254);
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
            float _270 = _260 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _272 = _260 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _274 = _260 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _276 = _260 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _278 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].x, _270);
            float _280 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[1].x, _272);
            float _282 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[2].x, _274);
            float _284 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[3].x, _276);
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
            _306 = _294;
            _308 = _296;
        }
    }
    if ((false || _268) || _266)
    {
        if ((!_268) || _266)
        {
            _266 = false;
            float _310 = _260 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _312 = _260 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _314 = _260 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _316 = _260 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _318 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[4].x, _310);
            float _320 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[5].x, _312);
            float _322 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[6].x, _314);
            float _324 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[7].x, _316);
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
            _306 = _334;
            _308 = _336;
        }
        if (false || _268)
        {
            _268 = false;
            float _342 = _260 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _344 = _260 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _346 = _260 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _348 = _260 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _350 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[8].x, _342);
            float _352 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[9].x, _344);
            float _354 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[10].x, _346);
            float _356 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[11].x, _348);
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
            _306 = _366;
            _308 = _368;
        }
    }
    float _374 = _302;
    float _376 = _304;
    float _378 = _306;
    float _380 = _308;
    float _382 = 1.0 / _374;
    float _384 = float(int(_203));
    float _386 = rint(_384);
    float _388 = precise::max(_386, 0.0);
    uint _390 = uint(_388);
    uint _392 = clamp(_390, 0u, 65535u);
    float _394 = _382 * _376;
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = _382 * _378;
    float _400 = _382 * _380;
    float _402 = _396 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _404 = _402 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _406 = _402 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _408 = fma(_404, 0.5, _398);
    float _410 = fma(_404, -0.5, _398);
    float _412 = fma(_406, 0.5, _400);
    float _414 = fma(_406, -0.5, _400);
    float3 _1131 = float3(_410, _412, float(int(_392)));
    float3 _1135 = select(_1131, float3(0.0), isnan(_1131));
    float _416 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1135.xy, uint(rint(_1135.z)), _396);
    float3 _1144 = float3(_408, _412, float(int(_392)));
    float3 _1146 = select(_1144, float3(0.0), isnan(_1144));
    float _418 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1146.xy, uint(rint(_1146.z)), _396);
    float3 _1155 = float3(_408, _414, float(int(_392)));
    float3 _1157 = select(_1155, float3(0.0), isnan(_1155));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1157.xy, uint(rint(_1157.z)), _396);
    float3 _1166 = float3(_410, _414, float(int(_392)));
    float3 _1168 = select(_1166, float3(0.0), isnan(_1166));
    float _422 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1168.xy, uint(rint(_1168.z)), _396);
    float2 _1174 = float2(_52, _54);
    float _424 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1174, float2(0.0), isnan(_1174))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1174, float2(0.0), isnan(_1174))).x;
    float _426 = -_152;
    float _428 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _430 = _426 + _428;
    float _432 = _418 + _416;
    float _434 = -_152;
    float _436 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _438 = _434 + _436;
    float _440 = _430 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = _438 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _446 = precise::clamp(_444, 0.0, 1.0);
    float _448 = _432 + _420;
    float _450 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[48].w, _442);
    float _452 = _448 + _422;
    float _454 = fma(_452, 0.25, _446);
    out.m_45.x = _424;
    out.m_45.y = _454;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _450;
    return out;
}

