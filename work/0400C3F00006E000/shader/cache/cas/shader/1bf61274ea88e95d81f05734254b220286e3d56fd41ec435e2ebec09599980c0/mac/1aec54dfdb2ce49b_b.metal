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
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
    float4 m_38 [[user(locn2), center_no_perspective]];
    float4 m_34 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _292 = false;
    bool _290 = false;
    float _50 = in.m_34.x;
    float _52 = in.m_34.y;
    float2 _463 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_463, float2(0.0), isnan(_463)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _480 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_480, float2(0.0), isnan(_480))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_480, float2(0.0), isnan(_480))).x;
    float _66 = in.m_36.y;
    float _68 = in.m_38.y;
    float _70 = in.m_36.x;
    float _72 = in.m_40.y;
    float _74 = in.m_38.x;
    float _76 = in.m_40.x;
    float _78 = -_58;
    float _80 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _82 = -_60;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_62;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = 1.0 / _80;
    float _92 = 1.0 / _84;
    float _94 = -_64;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _98 = 1.0 / _88;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _90 * _100;
    float _104 = _66 * _102;
    float _106 = _70 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _92 * _108;
    float _112 = 1.0 / _96;
    float _114 = -_104;
    float _116 = fma(_110, _68, _114);
    float _118 = -_106;
    float _120 = fma(_110, _74, _118);
    float _122 = -_102;
    float _124 = _122 + _110;
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _128 = _98 * _126;
    float _130 = _116 * _116;
    float _132 = -_104;
    float _134 = fma(_128, _72, _132);
    float _136 = -_106;
    float _138 = fma(_128, _76, _136);
    float _140 = fma(_120, _120, _130);
    float _142 = -_102;
    float _144 = _142 + _128;
    float _146 = _134 * _134;
    float _148 = fma(_124, _124, _140);
    float _150 = fma(_138, _138, _146);
    float _152 = fma(_144, _144, _150);
    float _154 = rsqrt(_148);
    float _156 = rsqrt(_152);
    float _158 = _120 * _154;
    float _160 = _124 * _154;
    float _162 = _116 * _154;
    float _164 = _144 * _156;
    float _166 = _134 * _156;
    float _168 = _138 * _156;
    float _170 = _158 * _164;
    float _172 = _160 * _166;
    float _174 = _162 * _168;
    float _176 = -_170;
    float _178 = fma(_160, _168, _176);
    float _180 = -_172;
    float _182 = fma(_162, _164, _180);
    float _184 = -_174;
    float _186 = fma(_158, _166, _184);
    float _188 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _190 = _112 * _188;
    float _192 = _178 * _178;
    float _194 = fma(_182, _182, _192);
    float _196 = -_190;
    bool _200 = _196 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _202 = -_190;
    bool _204 = _202 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _206 = fma(_186, _186, _194);
    float _208 = -_190;
    bool _210 = _208 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _212 = !_200;
    int _215 = _212 ? 0 : 1;
    float _217 = rsqrt(_206);
    int _219 = 2;
    if (!_200)
    {
        _219 = 1;
    }
    int _221 = _219;
    int _223 = _221;
    if (!_204)
    {
        _223 = _215;
    }
    int _225 = _223;
    int _227 = _225 + 1;
    uint _230 = uint(_227);
    if (!_210)
    {
        _230 = uint(_225);
    }
    uint _232 = _230;
    float _234 = _178 * _217;
    float _236 = _182 * _217;
    float _238 = _186 * _217;
    uint _240 = min(_232, 2u);
    float _242 = _234 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _244 = int(_240) << 2;
    float _246 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[35].x, _242);
    uint _248 = uint(int(uint(_244) >> uint(2)));
    uint _250 = uint(int(uint(int(_248)) >> uint(2)));
    int _252 = int(_248) & 3;
    float _254 = (*spvDescriptorSet0.fp_c1)._m0[int(_250)][_252];
    float _256 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[35].z, _246);
    float _258 = abs(_256);
    float _260 = -_258;
    float _262 = _260 + 1.0;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = abs(_264);
    float _268 = log2(_266);
    float _270 = _268 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _272 = exp2(_270);
    float _274 = _272 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _276 = _234 * _274;
    float _278 = _236 * _274;
    float _280 = fma(_238, _274, _190);
    float _282 = fma(_190, _66, _276);
    float _284 = fma(_190, _70, _278);
    bool _286 = as_type<int>(_254) == 1392;
    if (!_286)
    {
        bool _288 = as_type<int>(_254) == 1664;
        _290 = _288;
        if (!_290)
        {
            _292 = true;
        }
    }
    float _326;
    float _328;
    float _330;
    float _332;
    if (!_290)
    {
        if (!_292)
        {
            float _294 = _282 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _296 = _282 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _298 = _282 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _300 = _282 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _302 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[0].x, _294);
            float _304 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[1].x, _296);
            float _306 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[2].x, _298);
            float _308 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[3].x, _300);
            float _310 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[0].z, _302);
            float _312 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[1].z, _304);
            float _314 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[2].z, _306);
            float _316 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[3].z, _308);
            float _318 = _310 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _320 = _312 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _322 = _314 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _324 = _316 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _326 = _324;
            _328 = _320;
            _330 = _318;
            _332 = _322;
        }
    }
    if ((false || _292) || _290)
    {
        if ((!_292) || _290)
        {
            _290 = false;
            float _334 = _282 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _336 = _282 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _338 = _282 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _340 = _282 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _342 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[4].x, _334);
            float _344 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[5].x, _336);
            float _346 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[6].x, _338);
            float _348 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[7].x, _340);
            float _350 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[4].z, _342);
            float _352 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[5].z, _344);
            float _354 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[6].z, _346);
            float _356 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[7].z, _348);
            float _358 = _350 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _360 = _352 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _362 = _354 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _364 = _356 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _326 = _364;
            _328 = _360;
            _330 = _358;
            _332 = _362;
        }
        if (false || _292)
        {
            _292 = false;
            float _366 = _282 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _368 = _282 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _370 = _282 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _372 = _282 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _374 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[8].x, _366);
            float _376 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[9].x, _368);
            float _378 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[10].x, _370);
            float _380 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[11].x, _372);
            float _382 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[8].z, _374);
            float _384 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[9].z, _376);
            float _386 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[10].z, _378);
            float _388 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[11].z, _380);
            float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _392 = _384 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _394 = _386 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _396 = _388 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _326 = _396;
            _328 = _392;
            _330 = _390;
            _332 = _394;
        }
    }
    float _398 = _326;
    float _400 = _328;
    float _402 = _330;
    float _404 = _332;
    float _406 = 1.0 / _398;
    float _408 = float(int(_232));
    float _410 = rint(_408);
    float _412 = precise::max(_410, 0.0);
    uint _414 = uint(_412);
    uint _416 = clamp(_414, 0u, 65535u);
    float _418 = _406 * _400;
    float _420 = _406 * _402;
    float _422 = _406 * _404;
    float _424 = precise::clamp(_422, 0.0, 1.0);
    float3 _1131 = float3(_420, _418, float(int(_416)));
    float3 _1135 = select(_1131, float3(0.0), isnan(_1131));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1135.xy, uint(rint(_1135.z)), _424);
    float _428 = -_190;
    float _430 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _432 = _428 + _430;
    float _434 = -_190;
    float _436 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _438 = _434 + _436;
    float _440 = _432 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = _438 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _446 = precise::clamp(_444, 0.0, 1.0);
    float _448 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[48].w, _442);
    float _450 = _426 + _446;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _450;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _448;
    return out;
}

