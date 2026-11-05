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

// Implementation of the GLSL mod() function, which is slightly different than Metal fmod()
template<typename Tx, typename Ty>
inline Tx mod(Tx x, Ty y)
{
    return x - y * floor(x / y);
}

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _38(thread const int& _947, thread const int& _948, thread const int& _949, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _952 = 1 + _948;
    float _954 = support_buffer._m5[_952].x;
    bool _957 = _954 == 1.0;
    if (_957)
    {
        return _947;
    }
    bool _959 = _954 < 0.0;
    if (_959)
    {
        float _961 = -_954;
        float _963 = float(_947);
        float _965 = _963 * _961;
        float _967 = gl_FragCoord.x;
        float _969 = gl_FragCoord.y;
        float _971 = (_949 != 0) ? _969 : _967;
        float _973 = mod(_971, _961);
        float _975 = _965 + _973;
        int _977 = int(_975);
        return _977;
    }
    float _979 = float(_947);
    float _981 = _979 * _954;
    int _983 = int(_981);
    return _983;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _42 = gl_FragCoord.w;
    float _44 = in.m_29.y;
    float _46 = gl_FragCoord.w;
    float _48 = _44 * _46;
    float _50 = in.m_29.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = 1.0 / _42;
    float _58 = _56 * _48;
    float _60 = _56 * _54;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _64 = _58 + _62;
    float _66 = _60 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float2 _496 = float2(_60, _58);
    float2 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_496, float2(0.0), isnan(_496))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_496, float2(0.0), isnan(_496))).xy;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _58 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _78 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _80 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -2.0, _58);
    float _82 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 2.0, _58);
    float _84 = trunc(_66);
    int _86 = int(_84);
    float _88 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _90 = _80 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _92 = _82 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _94 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -3.0, _58);
    float _96 = trunc(_78);
    int _98 = int(_96);
    float _100 = _94 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _102 = trunc(_88);
    int _104 = int(_102);
    float _106 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 3.0, _58);
    float _108 = _106 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _110 = trunc(_90);
    int _112 = int(_110);
    float _114 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, -4.0, _58);
    float _116 = fma((*spvDescriptorSet0.fp_c3)._m0[0].w, 4.0, _58);
    float _118 = _114 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _120 = _116 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    int _122 = _86;
    int _124 = 0;
    int _126 = 0;
    int _128 = _38(_122, _124, _126, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _130 = _98;
    int _132 = 0;
    int _134 = 1;
    int _136 = _38(_130, _132, _134, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float2 _138 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_128, _136)), 0).xy;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = trunc(_92);
    int _146 = int(_144);
    int _148 = _86;
    int _150 = 0;
    int _152 = 0;
    int _154 = _38(_148, _150, _152, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _156 = _104;
    int _158 = 0;
    int _160 = 1;
    int _162 = _38(_156, _158, _160, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float2 _164 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_154, _162)), 0).xy;
    float _166 = _164.x;
    float _168 = _164.y;
    float _170 = trunc(_100);
    int _172 = int(_170);
    int _174 = _86;
    int _176 = 0;
    int _178 = 0;
    int _180 = _38(_174, _176, _178, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _182 = _112;
    int _184 = 0;
    int _186 = 1;
    int _188 = _38(_182, _184, _186, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float2 _190 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_180, _188)), 0).xy;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = trunc(_108);
    int _198 = int(_196);
    int _200 = _86;
    int _202 = 0;
    int _204 = 0;
    int _206 = _38(_200, _202, _204, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _208 = _146;
    int _210 = 0;
    int _212 = 1;
    int _214 = _38(_208, _210, _212, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float2 _216 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_206, _214)), 0).xy;
    float _218 = _216.x;
    float _220 = _216.y;
    float _222 = trunc(_118);
    int _224 = int(_222);
    int _226 = _86;
    int _228 = 0;
    int _230 = 0;
    int _232 = _38(_226, _228, _230, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _234 = _172;
    int _236 = 0;
    int _238 = 1;
    int _240 = _38(_234, _236, _238, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float2 _242 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_232, _240)), 0).xy;
    float _244 = _242.x;
    float _246 = _242.y;
    float _248 = trunc(_120);
    int _250 = int(_248);
    int _252 = _86;
    int _254 = 0;
    int _256 = 0;
    int _258 = _38(_252, _254, _256, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _260 = _198;
    int _262 = 0;
    int _264 = 1;
    int _266 = _38(_260, _262, _264, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float2 _268 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_258, _266)), 0).xy;
    float _270 = _268.x;
    float _272 = _268.y;
    int _274 = _86;
    int _276 = 0;
    int _278 = 0;
    int _280 = _38(_274, _276, _278, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _282 = _224;
    int _284 = 0;
    int _286 = 1;
    int _288 = _38(_282, _284, _286, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float2 _290 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_280, _288)), 0).xy;
    float _292 = _290.x;
    float _294 = _290.y;
    int _296 = _86;
    int _298 = 0;
    int _300 = 0;
    int _302 = _38(_296, _298, _300, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _304 = _250;
    int _306 = 0;
    int _308 = 1;
    int _310 = _38(_304, _306, _308, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float2 _312 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_302, _310)), 0).xy;
    float _314 = _312.x;
    float _316 = _312.y;
    float _318 = 1.0 / _74;
    float _320 = fma(_142, _318, -1.0);
    float _322 = abs(_320);
    float _324 = -_322;
    float _326 = fma(_324, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
    float _328 = precise::clamp(_326, 0.0, 1.0);
    float _330 = fma(_168, _318, -1.0);
    float _332 = _328 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _334 = abs(_330);
    float _336 = -_334;
    float _338 = fma(_336, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = fma(_194, _318, -1.0);
    float _344 = _140 * _332;
    float _346 = _340 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _348 = _332 + (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _350 = abs(_342);
    float _352 = -_350;
    float _354 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[14].x, _344);
    float _360 = fma(_220, _318, -1.0);
    float _362 = _348 + _346;
    float _364 = fma(_166, _346, _358);
    float _366 = _356 * (*spvDescriptorSet0.fp_c3)._m0[14].z;
    float _368 = abs(_360);
    float _370 = -_368;
    float _372 = fma(_370, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = _362 + _366;
    float _378 = fma(_246, _318, -1.0);
    float _380 = fma(_192, _366, _364);
    float _382 = _374 * (*spvDescriptorSet0.fp_c3)._m0[14].z;
    float _384 = abs(_378);
    float _386 = -_384;
    float _388 = fma(_386, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
    float _390 = precise::clamp(_388, 0.0, 1.0);
    float _392 = _376 + _382;
    float _394 = fma(_218, _382, _380);
    float _396 = fma(_272, _318, -1.0);
    float _398 = _390 * (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _400 = abs(_396);
    float _402 = -_400;
    float _404 = fma(_402, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
    float _406 = precise::clamp(_404, 0.0, 1.0);
    float _408 = _392 + _398;
    float _410 = fma(_244, _398, _394);
    float _412 = fma(_294, _318, -1.0);
    float _414 = _406 * (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _416 = abs(_412);
    float _418 = -_416;
    float _420 = fma(_418, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
    float _422 = precise::clamp(_420, 0.0, 1.0);
    float _424 = _408 + _414;
    float _426 = fma(_270, _414, _410);
    float _428 = fma(_316, _318, -1.0);
    float _430 = abs(_428);
    float _432 = -_430;
    float _434 = fma(_432, (*spvDescriptorSet0.fp_c3)._m0[16].x, 1.0);
    float _436 = precise::clamp(_434, 0.0, 1.0);
    float _438 = _422 * (*spvDescriptorSet0.fp_c3)._m0[15].x;
    float _440 = _436 * (*spvDescriptorSet0.fp_c3)._m0[15].x;
    float _442 = _424 + _438;
    float _444 = fma(_292, _438, _426);
    float _446 = _442 + _440;
    float _448 = fma(_314, _440, _444);
    float _450 = 1.0 / _446;
    float _452 = _448 * _450;
    out.m_32.x = _452;
    out.m_32.y = _74;
    return out;
}

