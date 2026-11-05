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
    bool _286 = false;
    bool _284 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _457 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_457, float2(0.0), isnan(_457)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _474 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_474, float2(0.0), isnan(_474))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_474, float2(0.0), isnan(_474))).x;
    float2 _482 = float2(_52, _54);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_482, float2(0.0), isnan(_482))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_482, float2(0.0), isnan(_482))).x;
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
    float _178 = -_174;
    float _180 = fma(_164, _172, _178);
    float _182 = -_176;
    float _184 = fma(_166, _168, _182);
    float _186 = _166 * _172;
    float _188 = _180 * _180;
    float _190 = -_186;
    float _192 = fma(_162, _170, _190);
    float _194 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _196 = _116 * _194;
    float _198 = fma(_184, _184, _188);
    float _200 = fma(_192, _192, _198);
    float _202 = -_196;
    bool _206 = _202 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _208 = -_196;
    bool _210 = _208 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _212 = rsqrt(_200);
    bool _214 = !_206;
    uint _217 = uint(_214 ? 0 : 1);
    uint _219 = 2u;
    if (!_206)
    {
        _219 = 1u;
    }
    uint _221 = _219;
    uint _223 = _221;
    if (!_210)
    {
        _223 = _217;
    }
    uint _225 = _223;
    float _227 = _180 * _212;
    float _229 = _184 * _212;
    uint _231 = min(_225, 2u);
    float _233 = _192 * _212;
    float _235 = _227 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _238 = int(_231) << 2;
    float _240 = fma(_229, (*spvDescriptorSet0.fp_c3)._m0[35].x, _235);
    uint _242 = uint(int(uint(_238) >> uint(2)));
    uint _244 = uint(int(uint(int(_242)) >> uint(2)));
    int _246 = int(_242) & 3;
    float _248 = (*spvDescriptorSet0.fp_c1)._m0[int(_244)][_246];
    float _250 = fma(_233, (*spvDescriptorSet0.fp_c3)._m0[35].z, _240);
    float _252 = abs(_250);
    float _254 = -_252;
    float _256 = _254 + 1.0;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = abs(_258);
    float _262 = log2(_260);
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _266 = exp2(_264);
    float _268 = _266 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _270 = _229 * _268;
    float _272 = _227 * _268;
    float _274 = fma(_233, _268, _196);
    float _276 = fma(_196, _74, _270);
    float _278 = fma(_196, _70, _272);
    bool _280 = as_type<int>(_248) == 1376;
    if (!_280)
    {
        bool _282 = as_type<int>(_248) == 1648;
        _284 = _282;
        if (!_284)
        {
            _286 = true;
        }
    }
    float _320;
    float _322;
    float _324;
    float _326;
    if (!_284)
    {
        if (!_286)
        {
            float _288 = _278 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _290 = _278 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _292 = _278 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _294 = _278 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _296 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[0].x, _288);
            float _298 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[2].x, _290);
            float _300 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[1].x, _292);
            float _302 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[3].x, _294);
            float _304 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].z, _296);
            float _306 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[2].z, _298);
            float _308 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[1].z, _300);
            float _310 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[3].z, _302);
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _318 = _310 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _320 = _318;
            _322 = _316;
            _324 = _312;
            _326 = _314;
        }
    }
    if ((false || _286) || _284)
    {
        if ((!_286) || _284)
        {
            _284 = false;
            float _328 = _278 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _330 = _278 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _332 = _278 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _334 = _278 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _336 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[4].x, _328);
            float _338 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[6].x, _330);
            float _340 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[5].x, _332);
            float _342 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[7].x, _334);
            float _344 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[4].z, _336);
            float _346 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[6].z, _338);
            float _348 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[5].z, _340);
            float _350 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[7].z, _342);
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _358 = _350 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _320 = _358;
            _322 = _356;
            _324 = _352;
            _326 = _354;
        }
        if (false || _286)
        {
            _286 = false;
            float _360 = _278 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _362 = _278 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _364 = _278 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _366 = _278 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _368 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[8].x, _360);
            float _370 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[10].x, _362);
            float _372 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[9].x, _364);
            float _374 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[11].x, _366);
            float _376 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[8].z, _368);
            float _378 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[10].z, _370);
            float _380 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[9].z, _372);
            float _382 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[11].z, _374);
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _320 = _390;
            _322 = _388;
            _324 = _384;
            _326 = _386;
        }
    }
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = _326;
    float _400 = 1.0 / _392;
    float _402 = float(int(_225));
    float _404 = rint(_402);
    float _406 = precise::max(_404, 0.0);
    uint _408 = uint(_406);
    uint _410 = clamp(_408, 0u, 65535u);
    float _412 = _400 * _394;
    float _414 = _400 * _396;
    float _416 = _400 * _398;
    float _418 = precise::clamp(_416, 0.0, 1.0);
    float3 _1117 = float3(_414, _412, float(int(_410)));
    float3 _1121 = select(_1117, float3(0.0), isnan(_1117));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1121.xy, uint(rint(_1121.z)), _418);
    float _422 = -_196;
    float _424 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _426 = _422 + _424;
    float _428 = -_196;
    float _430 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _432 = _428 + _430;
    float _434 = _426 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _436 = precise::clamp(_434, 0.0, 1.0);
    float _438 = _432 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[48].w, _436);
    float _444 = _420 + _440;
    out.m_45.x = _68;
    out.m_45.y = _444;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _442;
    return out;
}

