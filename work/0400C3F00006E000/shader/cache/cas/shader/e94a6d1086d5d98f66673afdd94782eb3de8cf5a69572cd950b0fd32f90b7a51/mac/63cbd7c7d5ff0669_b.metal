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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
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
    bool _296 = false;
    bool _294 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _467 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_467, float2(0.0), isnan(_467)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _484 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_484, float2(0.0), isnan(_484))).x;
    float2 _492 = float2(_52, _54);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_492, float2(0.0), isnan(_492))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_492, float2(0.0), isnan(_492))).x;
    float _70 = in.m_38.y;
    float _72 = in.m_40.y;
    float _74 = in.m_38.x;
    float _76 = in.m_42.y;
    float _78 = in.m_40.x;
    float _80 = in.m_42.x;
    float _82 = -_60;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_62;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = -_64;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = 1.0 / _84;
    float _96 = 1.0 / _88;
    float _98 = -_66;
    float _100 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _102 = 1.0 / _92;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = _94 * _104;
    float _108 = _70 * _106;
    float _110 = _74 * _106;
    float _112 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _114 = _96 * _112;
    float _116 = 1.0 / _100;
    float _118 = -_108;
    float _120 = fma(_114, _72, _118);
    float _122 = -_110;
    float _124 = fma(_114, _78, _122);
    float _126 = -_106;
    float _128 = _126 + _114;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _132 = _102 * _130;
    float _134 = _120 * _120;
    float _136 = -_108;
    float _138 = fma(_132, _76, _136);
    float _140 = -_110;
    float _142 = fma(_132, _80, _140);
    float _144 = fma(_124, _124, _134);
    float _146 = -_106;
    float _148 = _146 + _132;
    float _150 = _138 * _138;
    float _152 = fma(_128, _128, _144);
    float _154 = fma(_142, _142, _150);
    float _156 = fma(_148, _148, _154);
    float _158 = rsqrt(_152);
    float _160 = rsqrt(_156);
    float _162 = _124 * _158;
    float _164 = _128 * _158;
    float _166 = _120 * _158;
    float _168 = _148 * _160;
    float _170 = _138 * _160;
    float _172 = _142 * _160;
    float _174 = _162 * _168;
    float _176 = _164 * _170;
    float _178 = _166 * _172;
    float _180 = -_174;
    float _182 = fma(_164, _172, _180);
    float _184 = -_176;
    float _186 = fma(_166, _168, _184);
    float _188 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _190 = _116 * _188;
    float _192 = -_178;
    float _194 = fma(_162, _170, _192);
    float _196 = _182 * _182;
    float _198 = -_190;
    bool _202 = _198 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _204 = fma(_186, _186, _196);
    float _206 = -_190;
    bool _208 = _206 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _210 = -_190;
    bool _212 = _210 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _214 = fma(_194, _194, _204);
    bool _216 = !_202;
    int _219 = _216 ? 0 : 1;
    float _221 = rsqrt(_214);
    int _223 = 2;
    if (!_202)
    {
        _223 = 1;
    }
    int _225 = _223;
    int _227 = _225;
    if (!_208)
    {
        _227 = _219;
    }
    int _229 = _227;
    int _231 = _229 + 1;
    uint _234 = uint(_231);
    if (!_212)
    {
        _234 = uint(_229);
    }
    uint _236 = _234;
    float _238 = _182 * _221;
    float _240 = _186 * _221;
    uint _242 = min(_236, 2u);
    float _244 = _194 * _221;
    float _246 = _238 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _248 = int(_242) << 2;
    float _250 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[35].x, _246);
    uint _252 = uint(int(uint(_248) >> uint(2)));
    uint _254 = uint(int(uint(int(_252)) >> uint(2)));
    int _256 = int(_252) & 3;
    float _258 = (*spvDescriptorSet0.fp_c1)._m0[int(_254)][_256];
    float _260 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[35].z, _250);
    float _262 = abs(_260);
    float _264 = -_262;
    float _266 = _264 + 1.0;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = abs(_268);
    float _272 = log2(_270);
    float _274 = _272 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _276 = exp2(_274);
    float _278 = _276 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _280 = _240 * _278;
    float _282 = _238 * _278;
    float _284 = fma(_244, _278, _190);
    float _286 = fma(_190, _74, _280);
    float _288 = fma(_190, _70, _282);
    bool _290 = as_type<int>(_258) == 1424;
    if (!_290)
    {
        bool _292 = as_type<int>(_258) == 1696;
        _294 = _292;
        if (!_294)
        {
            _296 = true;
        }
    }
    float _330;
    float _332;
    float _334;
    float _336;
    if (!_294)
    {
        if (!_296)
        {
            float _298 = _288 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _300 = _288 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _302 = _288 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _304 = _288 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _306 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[0].x, _298);
            float _308 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[2].x, _300);
            float _310 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[1].x, _302);
            float _312 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[3].x, _304);
            float _314 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[0].z, _306);
            float _316 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[2].z, _308);
            float _318 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[1].z, _310);
            float _320 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[3].z, _312);
            float _322 = _314 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _324 = _316 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _326 = _318 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _328 = _320 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _330 = _328;
            _332 = _326;
            _334 = _322;
            _336 = _324;
        }
    }
    if ((false || _296) || _294)
    {
        if ((!_296) || _294)
        {
            _294 = false;
            float _338 = _288 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _340 = _288 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _342 = _288 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _344 = _288 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _346 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[4].x, _338);
            float _348 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[6].x, _340);
            float _350 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[5].x, _342);
            float _352 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[7].x, _344);
            float _354 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[4].z, _346);
            float _356 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[6].z, _348);
            float _358 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[5].z, _350);
            float _360 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[7].z, _352);
            float _362 = _354 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _364 = _356 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _330 = _368;
            _332 = _366;
            _334 = _362;
            _336 = _364;
        }
        if (false || _296)
        {
            _296 = false;
            float _370 = _288 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _372 = _288 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _374 = _288 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _376 = _288 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _378 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[8].x, _370);
            float _380 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[10].x, _372);
            float _382 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[9].x, _374);
            float _384 = fma(_286, (*spvDescriptorSet0.fp_c3)._m0[11].x, _376);
            float _386 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[8].z, _378);
            float _388 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[10].z, _380);
            float _390 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[9].z, _382);
            float _392 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[11].z, _384);
            float _394 = _386 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _396 = _388 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _398 = _390 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _400 = _392 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _330 = _400;
            _332 = _398;
            _334 = _394;
            _336 = _396;
        }
    }
    float _402 = _330;
    float _404 = _332;
    float _406 = _334;
    float _408 = _336;
    float _410 = 1.0 / _402;
    float _412 = float(int(_236));
    float _414 = rint(_412);
    float _416 = precise::max(_414, 0.0);
    uint _418 = uint(_416);
    uint _420 = clamp(_418, 0u, 65535u);
    float _422 = _410 * _404;
    float _424 = _410 * _406;
    float _426 = _410 * _408;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float3 _1143 = float3(_424, _422, float(int(_420)));
    float3 _1147 = select(_1143, float3(0.0), isnan(_1143));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1147.xy, uint(rint(_1147.z)), _428);
    float _432 = -_190;
    float _434 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _436 = _432 + _434;
    float _438 = -_190;
    float _440 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _442 = _438 + _440;
    float _444 = _436 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _446 = precise::clamp(_444, 0.0, 1.0);
    float _448 = _442 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _450 = precise::clamp(_448, 0.0, 1.0);
    float _452 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[48].w, _446);
    float _454 = _430 + _450;
    out.m_45.x = _68;
    out.m_45.y = _454;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _452;
    return out;
}

