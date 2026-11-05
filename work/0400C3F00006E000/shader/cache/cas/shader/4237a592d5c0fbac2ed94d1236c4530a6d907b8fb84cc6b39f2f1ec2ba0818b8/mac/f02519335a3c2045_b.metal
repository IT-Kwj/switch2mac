#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    constant _16* vp_c13 [[id(7)]];
    texture2d<float> vp_t_tcb_C [[id(8)]];
    sampler vp_t_tcb_CSmplr [[id(9)]];
};

struct main0_out
{
    float4 m_56 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_62 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_46 [[user(locn6)]];
    float4 m_64 [[user(locn7)]];
    float4 m_68 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_70 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_39 [[attribute(2)]];
    float4 m_41 [[attribute(3)]];
    float4 m_48 [[attribute(6)]];
    float4 m_52 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
    float4 m_60 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _89(thread const int& _6551, thread const int& _6552, constant _10& support_buffer)
{
    float _6555 = as_type<float>(support_buffer._m4);
    int _6557 = _6552 + as_type<int>(_6555);
    int _6559 = 1 + _6557;
    float _6561 = support_buffer._m5[_6559].x;
    float _6563 = abs(_6561);
    bool _6565 = _6563 == 1.0;
    if (_6565)
    {
        return _6551;
    }
    float _6567 = float(_6551);
    float _6569 = _6567 / _6563;
    int _6571 = int(_6569);
    return _6571;
}

static inline __attribute__((always_inline))
int _90(thread const int& _6601, thread const int& _6602, constant _10& support_buffer)
{
    float _6605 = as_type<float>(support_buffer._m4);
    int _6607 = _6602 + as_type<int>(_6605);
    int _6609 = 1 + _6607;
    float _6611 = support_buffer._m5[_6609].x;
    bool _6613 = _6611 == 1.0;
    if (_6613)
    {
        return _6601;
    }
    float _6615 = float(_6601);
    float _6617 = _6615 * _6611;
    int _6619 = int(_6617);
    return _6619;
}

static inline __attribute__((always_inline))
void _87(thread const int& _6235, thread const int& _6236, thread const int& _6237, thread const int& _6238, thread const int& _6239, thread int& _6240, thread int& _6241, thread int& _6242, thread int& _6243, thread int& _6244, thread int& _6245, thread int& _6246, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _6249 = _6239;
    int _6251 = _6235;
    float _6253 = 0.0 + as_type<float>(_6235);
    bool _6255 = _6253 != 0.0;
    bool _6257 = isnan(_6253);
    bool _6259 = _6255 || _6257;
    bool _6261 = isnan(0.0);
    bool _6263 = _6259 || _6261;
    int _6265 = 0;
    int _6267 = as_type<int>(_6253);
    int _6269 = _6263 ? (-1) : 0;
    if (!_6263)
    {
        float _6271 = as_type<float>(_6235) * 1.0;
        _6249 = as_type<int>(_6271);
    }
    int _6273 = _6249;
    bool _6275 = !_6263;
    int _6277 = _6273;
    int _6279 = _6273;
    if (!_6275)
    {
        bool _6281 = _6253 >= 0.0;
        bool _6283 = isnan(_6253);
        bool _6285 = _6281 || _6283;
        bool _6287 = isnan(0.0);
        bool _6289 = _6285 || _6287;
        _6269 = _6289 ? (-1) : 0;
        if (!_6289)
        {
            _6277 = 2147483647;
        }
        int _6291 = _6277;
        bool _6293 = !_6289;
        int _6295 = _6291;
        _6279 = _6291;
        if (!_6293)
        {
            float _6297 = abs(as_type<float>(_6235));
            float _6299 = 0.0 + _6297;
            bool _6301 = _6299 > as_type<float>(0x7f800000u /* inf */);
            bool _6303 = isnan(_6299);
            bool _6305 = _6301 || _6303;
            bool _6307 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _6309 = _6305 || _6307;
            _6265 = 2139095040;
            _6267 = as_type<int>(_6299);
            _6269 = _6309 ? (-1) : 0;
            if (_6309)
            {
                float _6311 = as_type<float>(_6235) + 1.0;
                _6295 = as_type<int>(_6311);
            }
            int _6313 = _6295;
            int _6315 = _6313;
            _6279 = _6313;
            if (!_6309)
            {
                bool _6317 = _6299 != as_type<float>(0x7f800000u /* inf */);
                bool _6319 = isnan(_6299);
                bool _6321 = _6317 || _6319;
                bool _6323 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _6325 = _6321 || _6323;
                _6269 = _6325 ? (-1) : 0;
                if (!_6325)
                {
                    _6315 = _6235;
                }
                int _6327 = _6315;
                bool _6329 = !_6325;
                _6279 = _6327;
                if (!_6329)
                {
                    float _6331 = as_type<float>(_6235) * 18446744073709551616.0;
                    float _6333 = rsqrt(_6331);
                    float _6335 = _6331 * _6333;
                    float _6337 = _6333 * 0.5;
                    float _6339 = -_6335;
                    float _6341 = 0.0 + _6339;
                    float _6343 = fma(_6337, _6341, 0.5);
                    float _6345 = fma(_6335, _6343, _6335);
                    float _6347 = -_6345;
                    float _6349 = 0.0 + _6347;
                    float _6351 = fma(_6345, _6349, _6331);
                    float _6353 = fma(_6337, _6351, _6345);
                    float _6355 = _6353 * 2.3283064365386962890625e-10;
                    _6251 = as_type<int>(_6331);
                    _6265 = as_type<int>(_6353);
                    _6267 = as_type<int>(_6337);
                    _6279 = as_type<int>(_6355);
                }
            }
        }
    }
    int _6357 = _6251;
    int _6359 = _6265;
    int _6361 = _6267;
    int _6363 = _6279;
    int _6365 = _6269;
    _6240 = _6357;
    _6241 = _6359;
    _6242 = _6361;
    _6243 = _6238;
    _6244 = 0;
    _6245 = _6363;
    _6246 = _6365;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2278 = false;
    bool _2024 = false;
    bool _942 = false;
    bool _750 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_39.w;
    float _96 = in.m_41.w;
    float _98 = trunc(_94);
    int _100 = int(_98);
    float _102 = -_96;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_44.y = _104;
    bool _108 = _100 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_100);
    float _114 = _104;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _110;
    if (!_108)
    {
        out.m_46.x = 0.0;
    }
    int _118 = 0;
    if (!_108)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2573 = as_type<float>(_122);
        out.gl_Position.z = _2573;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _126 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_96);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = in.m_48.x;
    float _138 = float(_100);
    float _140 = in.m_48.y;
    bool _142 = _104 >= _138;
    bool _144 = !_134;
    bool _146 = _142 || _144;
    if (_146)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _112;
    if (_146)
    {
        out.m_46.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _124 = as_type<int>(_150);
    }
    int _152 = _124;
    out.m_50.x = _136;
    out.m_50.y = _140;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2636 = as_type<float>(_152);
        out.gl_Position.z = _2636;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_52.w;
    float _156 = 1.0 / _138;
    float _158 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_41.x;
    float _172 = in.m_41.y;
    float _174 = in.m_41.z;
    float _176 = in.m_39.x;
    float _178 = in.m_39.y;
    float _180 = in.m_39.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = _104 * _156;
    float _274 = fma(_266, _154, _176);
    float _276 = fma(_268, _154, _178);
    float _278 = fma(_270, _154, _180);
    bool _280 = !_258;
    float _282 = _272;
    float _284 = _276;
    if (!_280)
    {
        float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _288 = _136 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[11].x, _104);
        float _292 = _290 * _286;
        float _294 = floor(_292);
        float _296 = -_294;
        float _298 = _292 + _296;
        _282 = _298;
    }
    float _300 = _282;
    int _302 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _304 = _302;
    int _306 = 0;
    int _308 = _89(_304, _306, (*spvDescriptorSet0.support_buffer));
    float _310 = in.m_48.z;
    float _312 = _104 + _310;
    float _314 = _312 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _316 = float(_308);
    int _318 = abs(_308);
    bool _320 = _308 == 0;
    float _322 = _314 * _316;
    float _324 = float(uint(_318));
    float _326 = trunc(_322);
    int _328 = int(_326);
    float _330 = 1.0 / _324;
    int _332 = abs(_328);
    uint _335 = uint(int(uint(_328) >> uint(31)));
    float _337 = float(uint(_332));
    int _339 = ~int(_335);
    int _341 = _339 + 1;
    int _343 = as_type<int>(_330) + (-2);
    float _345 = in.m_54.z;
    float _347 = as_type<float>(_343) * _337;
    float _349 = trunc(_347);
    float _351 = precise::max(_349, 0.0);
    uint _353 = uint(_351);
    float _355 = trunc(_345);
    int _357 = int(_355);
    int _359 = ~int(_353);
    int _361 = _359 + 1;
    int _363 = _361 * _318;
    int _365 = _363 + _332;
    float _367 = float(uint(_365));
    float _369 = as_type<float>(_343) * _367;
    float _371 = trunc(_369);
    float _373 = precise::max(_371, 0.0);
    uint _375 = uint(_373);
    int _377 = int(_353) + int(_375);
    int _379 = ~_377;
    int _381 = _379 + 1;
    int _383 = _381 * _318;
    int _385 = _383 + _332;
    bool _387 = uint(_385) >= uint(_318);
    bool _389 = !_387;
    int _391 = _389 ? 0 : (-1);
    int _393 = ~_377;
    int _395 = _393 + _391;
    int _397 = _395 + 1;
    int _399 = _397 * _318;
    int _401 = _399 + _332;
    int _403 = _401 ^ _341;
    int _405 = ~_341;
    int _407 = _405 + _403;
    int _409 = _407 + 1;
    bool _411 = !_320;
    int _413 = _411 ? _409 : (-1);
    int _415 = _413;
    int _417 = 0;
    int _419 = _90(_415, _417, (*spvDescriptorSet0.support_buffer));
    int _421 = _357;
    int _423 = 0;
    int _425 = _90(_421, _423, (*spvDescriptorSet0.support_buffer));
    float4 _428 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_419, _425)), 0).xyzw;
    float _430 = _428.x;
    float _432 = _428.y;
    float _434 = _428.z;
    float _436 = _428.w;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _440 = _300 + _438;
    bool _442 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _444 = isnan(_300);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _456 = _300 + _454;
    bool _458 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _460 = isnan(_300);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _470;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _478 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _480 = isnan(_300);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = 1.0 / _472;
    float _492 = -_488;
    float _494 = _492 + 1.0;
    float _496 = _468 * _494;
    float _498 = -_468;
    float _500 = _498 + 1.0;
    float _502 = 1.0 / _476;
    float _504 = _440 * _490;
    float _506 = -_452;
    float _508 = _506 + 1.0;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _510;
    float _514 = _488 * _508;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _520;
    float _524 = _456 * _502;
    int _526 = _413 + 1;
    float _528 = fma(_518, _504, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _530 = fma(_512, _504, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _532 = fma(_522, _504, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _534 = _528 * _496;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _540 = _530 * _496;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _546 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[107].x, _534);
    float _548 = fma(_538, _524, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _550 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[107].y, _540);
    float _552 = fma(_544, _524, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _554 = _532 * _496;
    float _556 = fma(_548, _514, _546);
    int _558 = abs(_526);
    float _560 = fma(_552, _514, _550);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _566 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[109].x, _556);
    float _568 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[107].z, _554);
    float _570 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[109].y, _560);
    float _572 = fma(_564, _524, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _574 = _566 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    uint _576 = uint(int(uint(_526) >> uint(31)));
    float _578 = _570 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _580 = fma(_572, _514, _568);
    float _582 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _584 = float(uint(_558));
    float _586 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _588 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[109].z, _580);
    int _590 = ~int(_576);
    int _592 = _590 + 1;
    float _594 = as_type<float>(_343) * _584;
    float _596 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _598 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = trunc(_594);
    float _602 = precise::max(_600, 0.0);
    uint _604 = uint(_602);
    out.m_56.x = _582;
    out.m_56.y = _586;
    out.m_56.z = _598;
    int _606 = ~int(_604);
    int _608 = _606 + 1;
    int _610 = _608 * _318;
    int _612 = _610 + _558;
    float _614 = float(uint(_612));
    float _616 = as_type<float>(_343) * _614;
    float _618 = trunc(_616);
    float _620 = precise::max(_618, 0.0);
    uint _622 = uint(_620);
    int _624 = int(_604) + int(_622);
    int _626 = ~_624;
    int _628 = _626 + 1;
    int _630 = _628 * _318;
    int _632 = _630 + _558;
    bool _634 = uint(_632) >= uint(_318);
    bool _636 = !_634;
    int _638 = _636 ? 0 : (-1);
    int _640 = ~_624;
    int _642 = _640 + _638;
    int _644 = _642 + 1;
    int _646 = _644 * _318;
    int _648 = _646 + _558;
    int _650 = _648 ^ _592;
    int _652 = ~_592;
    int _654 = _652 + _650;
    int _656 = _654 + 1;
    bool _658 = !_320;
    int _660 = _658 ? _656 : (-1);
    uint _662 = as_type<uint>(half2(float2(_436, 0.0)));
    uint _664 = extract_bits(_662, 0u, 8u);
    int _666 = int(_664) & 255;
    uint _668 = extract_bits(_662, 8u, 8u);
    int _670 = int(_668) & 255;
    int _672 = _670 << 8;
    int _674 = _666 | _672;
    bool _676 = _674 >= 32768;
    int _678 = _674 + (-1024);
    int _680 = _678;
    if (_676)
    {
        int _682 = ~_674;
        int _684 = _682 + 33792;
        int _686 = _684 + 1;
        _680 = _686;
    }
    int _688 = _680;
    int _690 = _688 + 30719;
    float _692 = float(_690);
    float _694 = fma(_692, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _696 = abs(_694);
    float _698 = -_696;
    float _700 = _698 + 1.0;
    float _702 = abs(_694);
    float _704 = fma(_702, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _706 = _694 < 0.0;
    float _708 = float(_706);
    int _710 = as_type<int>(_700) + (-218103808);
    float _712 = abs(_694);
    float _714 = fma(_712, _704, -0.212114393711090087890625);
    bool _716 = uint(_710) >= 1920991232u;
    float _718 = abs(_694);
    float _720 = fma(_718, _714, 1.570728778839111328125);
    bool _722 = !_716;
    float _748;
    if (!_722)
    {
        int _724 = as_type<int>(_700);
        int _726 = _638;
        int _728 = _656;
        int _730 = 3296;
        int _732 = as_type<int>(_582);
        int _734;
        int _736;
        int _738;
        int _740;
        int _742;
        int _744;
        int _746;
        _87(_724, _726, _728, _730, _732, _734, _736, _738, _740, _742, _744, _746, out.gl_Position, out.gl_PointSize);
        _748 = as_type<float>(_744);
        _750 = true;
    }
    else
    {
        float _752 = rsqrt(_700);
        float _754 = _700 * _752;
        float _756 = _752 * 0.5;
        float _758 = -_754;
        float _760 = 0.0 + _758;
        float _762 = fma(_756, _760, 0.5);
        float _764 = fma(_754, _762, _754);
        float _766 = -_764;
        float _768 = 0.0 + _766;
        float _770 = fma(_764, _768, _700);
        float _772 = fma(_756, _770, _764);
        _748 = _772;
    }
    _750 = false;
    float _774 = _748;
    int _776 = _660;
    int _778 = 0;
    int _780 = _90(_776, _778, (*spvDescriptorSet0.support_buffer));
    int _782 = _357;
    int _784 = 0;
    int _786 = _90(_782, _784, (*spvDescriptorSet0.support_buffer));
    float4 _788 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_780, _786)), 0).xyzw;
    float _790 = _788.x;
    float _792 = _788.y;
    float _794 = _788.z;
    float _796 = _788.w;
    float _798 = _720 * _774;
    float _800 = _708 * 2.0;
    float _802 = _692 * 3.883221149444580078125;
    float _804 = floor(_322);
    float _806 = -_800;
    float _808 = fma(_798, _806, _798);
    float _810 = _802 * 0.15915493667125701904296875;
    float _812 = fma(_708, 3.1415927410125732421875, _808);
    float _814 = _810 * 6.283185482025146484375;
    float _816 = cos(_814);
    float _818 = _812 * 0.15915493667125701904296875;
    float _820 = _818 * 6.283185482025146484375;
    float _822 = sin(_820);
    float _824 = -_804;
    float _826 = _322 + _824;
    float _828 = _810 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = _822 * _816;
    float _834 = _822 * _830;
    uint _836 = as_type<uint>(half2(float2(_796, 0.0)));
    float _838 = -_432;
    float _840 = _838 + _792;
    float _842 = -_434;
    float _844 = _842 + _794;
    uint _846 = extract_bits(_836, 0u, 8u);
    int _848 = int(_846) & 255;
    uint _850 = extract_bits(_836, 8u, 8u);
    int _852 = int(_850) & 255;
    int _854 = _852 << 8;
    int _856 = _848 | _854;
    float _858 = fma(_826, _840, _432);
    float _860 = fma(_826, _844, _434);
    bool _862 = _856 >= 32768;
    int _864 = _856 + (-1024);
    int _866 = _864;
    if (_862)
    {
        int _868 = ~_856;
        int _870 = _868 + 33792;
        int _872 = _870 + 1;
        _866 = _872;
    }
    int _874 = _866;
    int _876 = _874 + 30719;
    float _878 = float(_876);
    float _880 = fma(_878, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _882 = abs(_880);
    float _884 = -_882;
    float _886 = _884 + 1.0;
    bool _888 = _880 < 0.0;
    float _890 = float(_888);
    float _892 = abs(_880);
    float _894 = fma(_892, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _896 = as_type<int>(_886) + (-218103808);
    float _898 = abs(_880);
    float _900 = fma(_898, _894, -0.212114393711090087890625);
    bool _902 = uint(_896) >= 1920991232u;
    float _904 = -_430;
    float _906 = _904 + _790;
    float _908 = abs(_880);
    float _910 = fma(_908, _900, 1.570728778839111328125);
    float _912 = fma(_826, _906, _430);
    bool _914 = !_902;
    float _940;
    if (!_914)
    {
        int _916 = as_type<int>(_886);
        int _918 = as_type<int>(_790);
        int _920 = as_type<int>(_792);
        int _922 = 4192;
        int _924 = as_type<int>(_798);
        int _926;
        int _928;
        int _930;
        int _932;
        int _934;
        int _936;
        int _938;
        _87(_916, _918, _920, _922, _924, _926, _928, _930, _932, _934, _936, _938, out.gl_Position, out.gl_PointSize);
        _940 = as_type<float>(_936);
        _942 = true;
    }
    else
    {
        float _944 = rsqrt(_886);
        float _946 = _886 * _944;
        float _948 = _944 * 0.5;
        float _950 = -_946;
        float _952 = 0.0 + _950;
        float _954 = fma(_948, _952, 0.5);
        float _956 = fma(_946, _954, _946);
        float _958 = -_956;
        float _960 = 0.0 + _958;
        float _962 = fma(_956, _960, _886);
        float _964 = fma(_948, _962, _956);
        _940 = _964;
    }
    _942 = false;
    float _966 = _940;
    float _968 = in.m_48.x;
    float _970 = in.m_48.y;
    float _972 = in.m_48.z;
    float _974 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _976 = log2(_974);
    float _978 = _910 * _966;
    bool _980 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _982 = isnan(0.0);
    bool _984 = _980 || _982;
    bool _986 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _988 = _984 || _986;
    float _990 = _878 * 3.883221149444580078125;
    bool _992 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _994 = isnan(1.0);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1000 = _996 || _998;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1004 = 1.0 + _1002;
    float _1006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _1008 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1010 = _976 * _104;
    float _1012 = 1.0 / _1004;
    float _1014 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1008);
    float _1016 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1018 = _972 * 2.0;
    float _1020 = _968 * 2.0;
    float _1022 = exp2(_1010);
    float _1024 = _970 * 2.0;
    float _1026 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1016);
    float _1028 = floor(_1018);
    float _1030 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1014);
    float _1032 = floor(_1020);
    float _1034 = -_1022;
    float _1036 = _1034 + 1.0;
    float _1038 = _988 ? _1036 : 0.0;
    bool _1040 = _1028 > 0.0;
    float _1042 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    bool _1044 = _1028 >= 0.0;
    bool _1046 = isnan(_1028);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan(0.0);
    bool _1052 = _1048 || _1050;
    if (_1000)
    {
        float _1054 = _1038 * _1012;
        _114 = _1054;
    }
    float _1056 = _114;
    int _1058 = _1052 ? 0 : 1;
    float _1060 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _1062 = _1032 >= 0.0;
    bool _1064 = isnan(_1032);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan(0.0);
    bool _1070 = _1066 || _1068;
    float _1072 = floor(_1024);
    int _1074 = ~_1058;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    float _1080 = _1060 * _1006;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _1084 = _1082 != 0;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _1088 = _1086 != 0;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _1092 = _1090 != 0;
    float _1094 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    int _1096 = _1078;
    if (!_1040)
    {
        int _1098 = ~_1058;
        int _1100 = _1098 + 1;
        _1096 = _1100;
    }
    int _1102 = _1096;
    float _1104 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[203].x, _1080);
    int _1106 = _1070 ? 0 : 1;
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _1112 = _1110 != 0;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _1116 = _1114 != 0;
    float _1118 = _1094 * _1042;
    bool _1120 = !_1088;
    int _1122 = _1120 ? 0 : 1;
    float _1124 = _970 + _968;
    bool _1126 = _1032 > 0.0;
    float _1128 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1118);
    bool _1130 = !_1084;
    int _1132 = _1130 ? 0 : 1;
    float _1134 = floor(_1104);
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _1138 = _1136 != 0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _1142 = _1140 != 0;
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _1146 = _1144 != 0;
    float _1148 = _1124 + (-1.0);
    int _1150 = ~_1106;
    int _1152 = _1150 + 1;
    int _1154 = _1152 + 1;
    bool _1156 = !_1092;
    int _1158 = _1156 ? 0 : 1;
    float _1160 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1162 = !_1146;
    int _1164 = _1162 ? 0 : 1;
    float _1166 = floor(_1128);
    int _1168 = _1154;
    if (!_1126)
    {
        int _1170 = ~_1106;
        int _1172 = _1170 + 1;
        _1168 = _1172;
    }
    int _1174 = _1168;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1182 = _1180 != 0;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1186 = _1184 != 0;
    float _1188 = _970 + _972;
    float _1190 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _1192 = !_1112;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = -_1134;
    float _1198 = _1104 + _1196;
    float _1200 = _1188 + (-1.0);
    float _1202 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1190);
    bool _1204 = _1072 >= 0.0;
    bool _1206 = isnan(_1072);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan(0.0);
    bool _1212 = _1208 || _1210;
    float _1214 = _1128 + 0.25;
    float _1216 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1218 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1202);
    int _1220 = _1212 ? 0 : 1;
    float _1222 = floor(_1214);
    bool _1224 = _1072 > 0.0;
    float _1226 = _1104 + 0.25;
    bool _1228 = !_1178;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1026);
    float _1234 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _1236 = float(_1102);
    float _1238 = _970 + (-0.5);
    float _1240 = floor(_1226);
    int _1242 = abs(_1230);
    float _1244 = _1234 * _1108;
    int _1246 = ~_1220;
    int _1248 = _1246 + 1;
    int _1250 = _1248 + 1;
    float _1252 = float(_1242);
    float _1254 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[203].z, _1244);
    int _1256 = _1250;
    if (!_1224)
    {
        int _1258 = ~_1220;
        int _1260 = _1258 + 1;
        _1256 = _1260;
    }
    int _1262 = _1256;
    float _1264 = rsqrt(_1232);
    bool _1266 = _1198 >= 0.5;
    bool _1268 = isnan(_1198);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan(0.5);
    bool _1274 = _1270 || _1272;
    float _1276 = _1252 * _1236;
    float _1278 = -_1166;
    float _1280 = _1128 + _1278;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1284 = _1282 != 0;
    bool _1286 = !_1274;
    float _1288 = _1286 ? 0.5 : (-0.5);
    float _1290 = floor(_1254);
    float _1292 = -_1240;
    float _1294 = _1226 + _1292;
    int _1296 = abs(_1122);
    float _1298 = _1104 * 6.283185482025146484375;
    bool _1300 = _1280 >= 0.5;
    bool _1302 = isnan(_1280);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.5);
    bool _1308 = _1304 || _1306;
    float _1310 = -_1222;
    float _1312 = _1214 + _1310;
    int _1314 = abs(_1194);
    float _1316 = _1128 * 6.283185482025146484375;
    float _1318 = _1298 * 0.15915493667125701904296875;
    float _1320 = float(_1296);
    float _1322 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1324 = _1322 * 2.0;
    bool _1326 = !_1308;
    float _1328 = _1326 ? 0.5 : (-0.5);
    float _1330 = _1316 * 0.15915493667125701904296875;
    float _1332 = _1254 + 0.25;
    float _1334 = _1320 * _1324;
    float _1336 = -_1290;
    float _1338 = _1254 + _1336;
    float _1340 = float(_1314);
    float _1342 = floor(_1332);
    bool _1344 = !_1142;
    int _1346 = _1344 ? 0 : 1;
    float _1348 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1350 = _1348 * 2.0;
    bool _1352 = _1338 >= 0.5;
    bool _1354 = isnan(_1338);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan(0.5);
    bool _1360 = _1356 || _1358;
    float _1362 = _1254 * 6.283185482025146484375;
    bool _1364 = !_1284;
    int _1366 = _1364 ? 0 : 1;
    float _1368 = _1340 * _1350;
    int _1370 = abs(_1346);
    float _1372 = _1318 * 6.283185482025146484375;
    float _1374 = sin(_1372);
    bool _1376 = !_1360;
    float _1378 = _1376 ? 0.5 : (-0.5);
    float _1380 = _858 * _1264;
    bool _1382 = _1294 > 0.5;
    int _1384 = abs(_1132);
    int _1386 = abs(_1366);
    float _1388 = _1330 * 6.283185482025146484375;
    float _1390 = sin(_1388);
    float _1392 = -_1342;
    float _1394 = _1332 + _1392;
    float _1396 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1398 = _1396 * 2.0;
    float _1400 = float(_1370);
    float _1402 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1404 = float(_1384);
    float _1406 = _1294;
    float _1408 = _1312;
    float _1410 = _1394;
    if (_1382)
    {
        float _1412 = -_1294;
        float _1414 = _1412 + 1.0;
        _1406 = _1414;
    }
    float _1416 = _1406;
    float _1418 = float(_1386);
    float _1420 = _1400 * _1398;
    float _1422 = _1362 * 0.15915493667125701904296875;
    bool _1424 = _1312 > 0.5;
    float _1426 = fma(_1416, 4.0, -1.0);
    float _1428 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1430 = fma(_1404, _1402, _1334);
    bool _1432 = !_1138;
    int _1434 = _1432 ? 0 : 1;
    float _1436 = _1422 * 6.283185482025146484375;
    float _1438 = sin(_1436);
    float _1440 = fma(_1418, _1428, _1368);
    bool _1442 = !_1116;
    int _1444 = _1442 ? 0 : 1;
    float _1446 = in.m_58.x;
    float _1448 = in.m_58.y;
    float _1450 = in.m_58.z;
    int _1452 = abs(_1158);
    int _1454 = abs(_1434);
    if (_1424)
    {
        float _1456 = -_1312;
        float _1458 = _1456 + 1.0;
        _1408 = _1458;
    }
    float _1460 = _1408;
    bool _1462 = _1394 > 0.5;
    int _1464 = abs(_1444);
    float _1466 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1468 = float(_1452);
    float _1470 = fma(_1460, 4.0, -1.0);
    float _1472 = float(_1454);
    float _1474 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    bool _1476 = !_1182;
    int _1478 = _1476 ? 0 : 1;
    float _1480 = fma(_1468, _1466, _1430);
    float _1482 = float(_1464);
    float _1484 = fma(_1472, _1474, _1420);
    float _1486 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    int _1488 = abs(_1164);
    float _1490 = _1276 * (-2.0);
    int _1492 = abs(_1478);
    if (_1462)
    {
        float _1494 = -_1394;
        float _1496 = _1494 + 1.0;
        _1410 = _1496;
    }
    float _1498 = _1410;
    float _1500 = fma(_1482, _1486, _1440);
    float _1502 = fma(_1480, 3.1415927410125732421875, _1446);
    float _1504 = float(_1174);
    float _1506 = fma(_1160, _1490, _1160);
    float _1508 = fma(_1502, _1490, _1502);
    float _1510 = float(_1492);
    float _1512 = fma(_1498, 4.0, -1.0);
    float _1514 = _968 + (-0.5);
    float _1516 = float(_1488);
    float _1518 = fma(_1500, 3.1415927410125732421875, _1448);
    float _1520 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1522 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1508);
    float _1524 = _1510 * _1504;
    bool _1526 = !_1186;
    int _1528 = _1526 ? 0 : 1;
    float _1530 = fma(_1516, _1520, _1484);
    float _1532 = fma(_1506, _1056, _1522);
    float _1534 = _1524 * (-2.0);
    int _1536 = abs(_1528);
    float _1538 = rsqrt(_1218);
    float _1540 = float(_1262);
    float _1542 = fma(_1518, _1534, _1518);
    float _1544 = float(_1536);
    float _1546 = fma(_1216, _1534, _1216);
    float _1548 = in.m_52.x;
    float _1550 = in.m_52.y;
    float _1552 = in.m_52.z;
    float _1554 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1542);
    float _1556 = _968 + _972;
    float _1558 = _1544 * _1540;
    float _1560 = rsqrt(_1030);
    float _1562 = fma(_1546, _1056, _1554);
    float _1564 = fma(_1530, 3.1415927410125732421875, _1450);
    float _1566 = _1556 + (-1.0);
    float _1568 = _1558 * (-2.0);
    float _1570 = _1562 * 0.15915493667125701904296875;
    float _1572 = _972 + (-0.5);
    float _1574 = _1532 * 0.15915493667125701904296875;
    float _1576 = sqrt(_1030);
    float _1578 = fma(_1564, _1568, _1564);
    float _1580 = _860 * _1538;
    float _1582 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1584 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1578);
    float _1586 = _1574 * 6.283185482025146484375;
    float _1588 = sin(_1586);
    float _1590 = _912 * _1560;
    float _1592 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1594 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1596 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1598 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1600 = _1574 * 6.283185482025146484375;
    float _1602 = cos(_1600);
    float _1604 = _1576 * _1580;
    float _1606 = fma(_1596, _1568, _1596);
    float _1608 = _1576 * _1590;
    float _1610 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1612 = _1592 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1614 = fma(_1606, _1056, _1584);
    float _1616 = _890 * 2.0;
    float _1618 = _1570 * 6.283185482025146484375;
    float _1620 = sin(_1618);
    float _1622 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1608);
    float _1624 = _1614 * 0.15915493667125701904296875;
    float _1626 = _1576 * _1380;
    float _1628 = _1598 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1604);
    float _1632 = _1610 * _1622;
    float _1634 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1626);
    float _1636 = _1570 * 6.283185482025146484375;
    float _1638 = cos(_1636);
    float _1640 = _1628 * _1630;
    bool _1642 = _1626 != 0.0;
    bool _1644 = isnan(_1626);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan(0.0);
    bool _1650 = _1646 || _1648;
    float _1652 = _1612 * _1634;
    bool _1654 = _1608 == 0.0;
    bool _1656 = !_1650;
    bool _1658 = _1654 && _1656;
    float _1660 = _1624 * 6.283185482025146484375;
    float _1662 = cos(_1660);
    float _1664 = -_1616;
    float _1666 = fma(_978, _1664, _978);
    float _1668 = _1588 * _1620;
    bool _1670 = _1604 == 0.0;
    bool _1672 = _1670 && _1658;
    float _1674 = fma(_890, 3.1415927410125732421875, _1666);
    float _1676 = _1624 * 6.283185482025146484375;
    float _1678 = sin(_1676);
    float _1680 = _1602 * _1638;
    float _1682 = _1588 * _1638;
    float _1684 = _1602 * _1662;
    float _1686 = _1638 * _1662;
    float _1688 = _1602 * _1620;
    float _1690 = _1588 * _1662;
    float _1692 = _1620 * _1662;
    float _1694 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1696 = _1690 * _1652;
    float _1698 = fma(_1678, _1680, _1668);
    float _1700 = fma(_1678, _1668, _1680);
    float _1702 = -_1688;
    float _1704 = fma(_1678, _1682, _1702);
    float _1706 = -_1682;
    float _1708 = fma(_1678, _1688, _1706);
    float _1710 = _1684 * _1652;
    float _1712 = -_1652;
    float _1714 = _1678 * _1712;
    float _1716 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1694);
    float _1718 = fma(_1698, _1632, _1710);
    float _1720 = fma(_1686, _1632, _1714);
    float _1722 = fma(_1704, _1632, _1696);
    float _1724 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1726 = fma(_1708, _1640, _1718);
    float _1728 = fma(_1692, _1640, _1720);
    float _1730 = fma(_1700, _1640, _1722);
    float _1732 = _990 * 0.15915493667125701904296875;
    float _1734 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1724);
    float _1736 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1738 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1740 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1716);
    float _1742 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1734);
    float _1744 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1736);
    float _1746 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1738);
    float _1748 = _1740 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1750 = _1742 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1752 = fma(_1730, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1744);
    float _1754 = fma(_1730, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1746);
    float _1756 = _1674 * 0.15915493667125701904296875;
    float _1758 = _1732 * 6.283185482025146484375;
    float _1760 = cos(_1758);
    float _1762 = _1748 + _1752;
    float _1764 = _1750 + _1754;
    float _1766 = -_694;
    float _1768 = _1766 + _880;
    float _1770 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1582);
    float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1774 = _1762 + _1772;
    float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1778 = _1764 + _1776;
    float _1780 = _1732 * 6.283185482025146484375;
    float _1782 = sin(_1780);
    float _1784 = _1774 * _1774;
    float _1786 = _1778 * _1778;
    float _1788 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1770);
    float _1790 = _1784 + _1786;
    float _1792 = _1756 * 6.283185482025146484375;
    float _1794 = sin(_1792);
    float _1796 = sqrt(_1790);
    float _1798 = -_832;
    float _1800 = fma(_1794, _1760, _1798);
    float _1802 = -_834;
    float _1804 = fma(_1794, _1782, _1802);
    float _1806 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1808 = fma(_826, _1768, _694);
    float _1810 = fma(_826, _1800, _832);
    float _1812 = fma(_826, _1804, _834);
    float _1814 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1806);
    float _1816 = _1808;
    float _1818 = _1810;
    float _1820 = _1812;
    float _1822 = _1626;
    float _1824 = _1678;
    float _1826 = _1788;
    float _1828 = _1604;
    if (!_1672)
    {
        float _1830 = fma(_1626, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1808);
        _1816 = _1830;
    }
    float _1832 = _1816;
    bool _1834 = _1796 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1672)
    {
        float _1836 = fma(_1608, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1810);
        _1818 = _1836;
    }
    float _1838 = _1818;
    float _1840 = fma(_1730, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1814);
    float _1842 = _1788 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (!_1672)
    {
        float _1844 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1812);
        _1820 = _1844;
    }
    float _1846 = _1820;
    float _1848 = -_1832;
    float _1850 = _1678 * _1848;
    float _1852 = _1684 * _1832;
    float _1854 = _1842 + _1840;
    float _1856 = _1690 * _1832;
    if (!_1834)
    {
        _1822 = _1786;
    }
    float _1858 = _1822;
    float _1860 = _1858;
    if (!_1834)
    {
        _1824 = _1784;
    }
    float _1862 = _1824;
    float _1864 = _1862;
    if (!_1834)
    {
        _284 = _1762;
    }
    float _1866 = _284;
    float _1868 = _1866;
    if (!_1834)
    {
        _1826 = _1764;
    }
    float _1870 = _1826;
    float _1872 = _1870;
    if (!_1834)
    {
        _1828 = _1854;
    }
    float _1874 = _1828;
    bool _1876 = !_1834;
    float _1878 = _1874;
    if (!_1876)
    {
        float _1880 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1884 = _1796 + _1882;
        float _1886 = rsqrt(_1790);
        float _1888 = _1884 * _1880;
        float _1890 = _1854 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1892 = _1888 * 0.15915493667125701904296875;
        float _1894 = _1892 * 6.283185482025146484375;
        float _1896 = sin(_1894);
        float _1898 = _1892 * 6.283185482025146484375;
        float _1900 = cos(_1898);
        float _1902 = fma(_1896, _1890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1904 = _1886 * _1902;
        float _1906 = _1900 + (-1.0);
        float _1908 = _1774 * _1904;
        float _1910 = _1778 * _1904;
        float _1912 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1914 = _1908 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1916 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1918 = _1908 * _1908;
        float _1920 = fma(_1854, _1900, _1912);
        float _1922 = _1910 * _1910;
        _1878 = _1920;
        _1864 = _1918;
        _1860 = _1922;
        _1868 = _1914;
        _1872 = _1916;
    }
    float _1924 = _1878;
    float _1926 = _1864;
    float _1928 = _1860;
    float _1930 = _1868;
    float _1932 = _1872;
    float _1934 = in.m_60.x;
    float _1936 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1938 = _1924 + _1936;
    float _1940 = fma(_1698, _1838, _1852);
    float _1942 = fma(_1686, _1838, _1850);
    float _1944 = in.m_60.y;
    float _1946 = fma(_1938, _1938, _1926);
    float _1948 = fma(_1708, _1846, _1940);
    float _1950 = fma(_1704, _1838, _1856);
    float _1952 = fma(_1692, _1846, _1942);
    float _1954 = _1946 + _1928;
    float _1956 = _1948 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1958 = _1948 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1960 = _1948 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1962 = fma(_1700, _1846, _1950);
    float _1964 = fma(_1952, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1956);
    float _1966 = sqrt(_1954);
    float _1968 = fma(_1952, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1958);
    float _1970 = fma(_1952, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1960);
    float _1972 = fma(_1962, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1964);
    float _1974 = fma(_1962, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1968);
    float _1976 = fma(_1962, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1970);
    out.m_62.x = _1934;
    out.m_62.y = _1944;
    bool _1978 = _1966 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1980 = isnan(_1966);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1986 = _1982 || _1984;
    out.m_64.x = _1974;
    out.m_64.y = _1972;
    out.m_64.z = _1976;
    float _1988 = _1954;
    if (!_1986)
    {
        _1988 = 1.0;
    }
    float _1990 = _1988;
    bool _1992 = !_1986;
    float _1994 = _1990;
    if (!_1992)
    {
        bool _1996 = _1966 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1998 = isnan(_1966);
        bool _2000 = _1996 || _1998;
        bool _2002 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2004 = _2000 || _2002;
        if (!_2004)
        {
            float _2006 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2008 = _1966 + _2006;
            float _2010 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2012 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2010;
            float _2014 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2016 = _2014 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2018 = 1.0 / _2012;
            float _2020 = _2008 * _2018;
            float _2022 = fma(_2020, _2016, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1994 = _2022;
            _2024 = true;
        }
        else
        {
            bool _2026 = _1966 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2028 = isnan(_1966);
            bool _2030 = _2026 || _2028;
            bool _2032 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2034 = _2030 || _2032;
            if (!_2034)
            {
                float _2036 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2038 = _1966 + _2036;
                float _2040 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2042 = _2040 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2044 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2046 = _2044 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2048 = 1.0 / _2042;
                float _2050 = _2038 * _2048;
                float _2052 = fma(_2050, _2046, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1994 = _2052;
                _2024 = true;
            }
            else
            {
                _1994 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2024 = false;
    float _2054 = _1994;
    float _2056 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2058 = _1924 + _2056;
    float _2060 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2062 = _1930 + _2060;
    float _2064 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2066 = _1932 + _2064;
    out.m_66.x = _1748;
    out.m_66.y = _1842;
    out.m_66.z = _1750;
    float _2068 = fma(_2058, _2054, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2070 = fma(_2062, _2054, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2072 = fma(_2066, _2054, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2074 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2076 = _2068 + _2074;
    float _2078 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2080 = _2070 + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2084 = _2072 + _2082;
    float _2086 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2088 = _2076 * _2076;
    float _2090 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    out.m_68.x = _2070;
    out.m_68.y = _2068;
    out.m_68.z = _2072;
    float _2092 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2086);
    float _2094 = fma(_2080, _2080, _2088);
    float _2096 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2098 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2090);
    float _2100 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2092);
    float _2102 = fma(_2084, _2084, _2094);
    float _2104 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2106 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2096);
    float _2108 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2098);
    float _2110 = _2100 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2112 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2104);
    float _2114 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2106);
    float _2116 = _2108 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2118 = sqrt(_2102);
    float _2120 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2112);
    float _2122 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2124 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2126 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2128 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2130 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2132 = _2120 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2134 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2124);
    float _2136 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2126);
    float _2138 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2128);
    float _2140 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2130);
    float _2142 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2134);
    float _2144 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2136);
    float _2146 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2138);
    float _2148 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2140);
    float _2150 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2142);
    float _2152 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2144);
    float _2154 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2146);
    float _2156 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2148);
    bool _2158 = _2118 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2160 = isnan(_2118);
    bool _2162 = _2158 || _2160;
    bool _2164 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2166 = _2162 || _2164;
    out.gl_Position.x = _2150;
    out.gl_Position.y = _2152;
    out.gl_Position.z = _2154;
    out.gl_Position.w = _2156;
    float _2168 = _2146;
    float _2170 = _2144;
    float _2172 = _2142;
    float _2174 = _2132;
    float _2176 = _2116;
    float _2178 = _2122;
    if (!_2166)
    {
        _2168 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2180 = _2168;
    float _2182 = _2180;
    float _2184 = _2180;
    if (!_2166)
    {
        _2170 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2186 = _2170;
    float _2188 = _2186;
    float _2190 = _2186;
    if (!_2166)
    {
        _2172 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2192 = _2172;
    float _2194 = _2192;
    float _2196 = _2192;
    if (!_2166)
    {
        _2174 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2198 = _2174;
    float _2200 = _2198;
    float _2202 = _2198;
    if (!_2166)
    {
        _2176 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2204 = _2176;
    float _2206 = _2204;
    float _2208 = _2204;
    if (!_2166)
    {
        _2178 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2210 = _2178;
    bool _2212 = !_2166;
    float _2214 = _2210;
    float _2216 = _2210;
    if (!_2212)
    {
        bool _2218 = _2118 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2220 = isnan(_2118);
        bool _2222 = _2218 || _2220;
        bool _2224 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2226 = _2222 || _2224;
        if (!_2226)
        {
            float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2230 = _2118 + _2228;
            float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2234 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2232;
            float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2238 = _2236 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2242 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2244 = 1.0 / _2234;
            float _2246 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2248 = _2246 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2252 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2254 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2256 = _2254 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2258 = _2230 * _2244;
            float _2260 = precise::clamp(_2258, 0.0, 1.0);
            float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2264 = _2262 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2266 = fma(_2260, _2238, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2268 = fma(_2260, _2242, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2270 = fma(_2260, _2248, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2272 = fma(_2260, _2264, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2274 = fma(_2260, _2252, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2276 = fma(_2260, _2256, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2208 = _2268;
            _2190 = _2274;
            _2202 = _2266;
            _2184 = _2272;
            _2216 = _2270;
            _2196 = _2276;
            _2278 = true;
        }
        else
        {
            bool _2280 = _2118 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2282 = isnan(_2118);
            bool _2284 = _2280 || _2282;
            bool _2286 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2288 = _2284 || _2286;
            if (!_2288)
            {
                _2182 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2290 = _2182;
            _2184 = _2290;
            if (!_2288)
            {
                _2188 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2292 = _2188;
            _2190 = _2292;
            if (!_2288)
            {
                _2194 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2294 = _2194;
            _2196 = _2294;
            if (!_2288)
            {
                _2200 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2296 = _2200;
            _2202 = _2296;
            if (!_2288)
            {
                _2206 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2298 = _2206;
            _2208 = _2298;
            if (!_2288)
            {
                _2214 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2300 = _2214;
            bool _2302 = !_2288;
            _2216 = _2300;
            if (!_2302)
            {
                bool _2304 = _2118 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2306 = isnan(_2118);
                bool _2308 = _2304 || _2306;
                bool _2310 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2312 = _2308 || _2310;
                if (!_2312)
                {
                    float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2316 = _2118 + _2314;
                    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2320 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2318;
                    float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2324 = _2322 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2328 = _2326 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2330 = 1.0 / _2320;
                    float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2334 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2338 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2344 = _2316 * _2330;
                    float _2346 = precise::clamp(_2344, 0.0, 1.0);
                    float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2352 = fma(_2346, _2324, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2354 = fma(_2346, _2328, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2356 = fma(_2346, _2334, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2358 = fma(_2346, _2350, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2360 = fma(_2346, _2338, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2362 = fma(_2346, _2342, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2208 = _2354;
                    _2190 = _2360;
                    _2202 = _2352;
                    _2184 = _2358;
                    _2216 = _2356;
                    _2196 = _2362;
                    _2278 = true;
                }
                else
                {
                    _2208 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2190 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2202 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2184 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2216 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2196 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2278 = false;
    float _2364 = _2208;
    float _2366 = _2190;
    float _2368 = _2202;
    float _2370 = _2184;
    float _2372 = _2216;
    float _2374 = _2196;
    float _2376 = fma(_1972, -0.5, 0.5);
    float _2378 = precise::clamp(_2376, 0.0, 1.0);
    float _2380 = -_2364;
    float _2382 = _2366 + _2380;
    float _2384 = -_2368;
    float _2386 = _2370 + _2384;
    float _2388 = -_2372;
    float _2390 = _2374 + _2388;
    bool _2392 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2394 = fma(_2378, _2382, _2364);
    float _2396 = fma(_2378, _2386, _2368);
    float _2398 = fma(_2378, _2390, _2372);
    float _2400 = _2394 * 0.586610972881317138671875;
    out.m_46.x = 1.0;
    float _2402 = fma(_2396, 0.298911988735198974609375, _2400);
    out.m_70.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2404 = fma(_2398, 0.114477999508380889892578125, _2402);
    float _2406 = -_2404;
    float _2408 = _2396 + _2406;
    float _2410 = -_2404;
    float _2412 = _2394 + _2410;
    float _2414 = -_2404;
    float _2416 = _2398 + _2414;
    out.m_72.x = 0.0;
    float _2418 = fma(_2408, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2404);
    float _2420 = fma(_2412, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2404);
    float _2422 = fma(_2416, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2404);
    out.m_74.x = _2418;
    out.m_74.y = _2420;
    out.m_74.z = _2422;
    if (!_2392)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2424 = -_2068;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2428 = -_2070;
    float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2432 = -_2072;
    float _2434 = _2432 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2436 = _2426 * _2426;
    float _2438 = fma(_2430, _2430, _2436);
    float _2440 = fma(_2434, _2434, _2438);
    float _2442 = sqrt(_2440);
    float _2444 = rsqrt(_2440);
    float _2446 = -_2442;
    float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2450 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2452 = precise::clamp(_2450, 0.0, 1.0);
    float _2454 = _2430 * _2444;
    float _2456 = _2426 * _2444;
    float _2458 = abs(_2452);
    float _2460 = log2(_2458);
    float _2462 = _2434 * _2444;
    float _2464 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2466 = _1972 * _2456;
    float _2468 = -_2456;
    float _2470 = -_2464;
    float _2472 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2470);
    float _2474 = fma(_1974, _2454, _2466);
    float _2476 = -_2462;
    float _2478 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2472);
    float _2480 = fma(_1976, _2462, _2474);
    float _2482 = precise::clamp(_2480, 0.0, 1.0);
    float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2486 = _2478 + _2484;
    float _2488 = _2460 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2490 = _2486 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2492 = precise::clamp(_2490, 0.0, 1.0);
    float _2494 = exp2(_2488);
    float _2496 = _2494 * _2492;
    float _2498 = _2482 * _2496;
    float _2500 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2502 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2504 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_72.x = _2500;
    out.m_72.y = _2502;
    out.m_72.z = _2504;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2278 = false;
    bool _2024 = false;
    bool _942 = false;
    bool _750 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_39.w;
    float _96 = in.m_41.w;
    float _98 = trunc(_94);
    int _100 = int(_98);
    float _102 = -_96;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_44.y = _104;
    bool _108 = _100 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_100);
    float _114 = _104;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _110;
    if (!_108)
    {
        out.m_46.x = 0.0;
    }
    int _118 = 0;
    if (!_108)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2573 = as_type<float>(_122);
        out.gl_Position.z = _2573;
    }
    if (!_108)
    {
        return out;
    }
    bool _126 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_96);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = in.m_48.x;
    float _138 = float(_100);
    float _140 = in.m_48.y;
    bool _142 = _104 >= _138;
    bool _144 = !_134;
    bool _146 = _142 || _144;
    if (_146)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _112;
    if (_146)
    {
        out.m_46.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _124 = as_type<int>(_150);
    }
    int _152 = _124;
    out.m_50.x = _136;
    out.m_50.y = _140;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2636 = as_type<float>(_152);
        out.gl_Position.z = _2636;
    }
    if (_146)
    {
        return out;
    }
    float _154 = in.m_52.w;
    float _156 = 1.0 / _138;
    float _158 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_41.x;
    float _172 = in.m_41.y;
    float _174 = in.m_41.z;
    float _176 = in.m_39.x;
    float _178 = in.m_39.y;
    float _180 = in.m_39.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = _104 * _156;
    float _274 = fma(_266, _154, _176);
    float _276 = fma(_268, _154, _178);
    float _278 = fma(_270, _154, _180);
    bool _280 = !_258;
    float _282 = _272;
    float _284 = _276;
    if (!_280)
    {
        float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _288 = _136 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[11].x, _104);
        float _292 = _290 * _286;
        float _294 = floor(_292);
        float _296 = -_294;
        float _298 = _292 + _296;
        _282 = _298;
    }
    float _300 = _282;
    int _302 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _304 = _302;
    int _306 = 0;
    int _308 = _89(_304, _306, (*spvDescriptorSet0.support_buffer));
    float _310 = in.m_48.z;
    float _312 = _104 + _310;
    float _314 = _312 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _316 = float(_308);
    int _318 = abs(_308);
    bool _320 = _308 == 0;
    float _322 = _314 * _316;
    float _324 = float(uint(_318));
    float _326 = trunc(_322);
    int _328 = int(_326);
    float _330 = 1.0 / _324;
    int _332 = abs(_328);
    uint _335 = uint(int(uint(_328) >> uint(31)));
    float _337 = float(uint(_332));
    int _339 = ~int(_335);
    int _341 = _339 + 1;
    int _343 = as_type<int>(_330) + (-2);
    float _345 = in.m_54.z;
    float _347 = as_type<float>(_343) * _337;
    float _349 = trunc(_347);
    float _351 = precise::max(_349, 0.0);
    uint _353 = uint(_351);
    float _355 = trunc(_345);
    int _357 = int(_355);
    int _359 = ~int(_353);
    int _361 = _359 + 1;
    int _363 = _361 * _318;
    int _365 = _363 + _332;
    float _367 = float(uint(_365));
    float _369 = as_type<float>(_343) * _367;
    float _371 = trunc(_369);
    float _373 = precise::max(_371, 0.0);
    uint _375 = uint(_373);
    int _377 = int(_353) + int(_375);
    int _379 = ~_377;
    int _381 = _379 + 1;
    int _383 = _381 * _318;
    int _385 = _383 + _332;
    bool _387 = uint(_385) >= uint(_318);
    bool _389 = !_387;
    int _391 = _389 ? 0 : (-1);
    int _393 = ~_377;
    int _395 = _393 + _391;
    int _397 = _395 + 1;
    int _399 = _397 * _318;
    int _401 = _399 + _332;
    int _403 = _401 ^ _341;
    int _405 = ~_341;
    int _407 = _405 + _403;
    int _409 = _407 + 1;
    bool _411 = !_320;
    int _413 = _411 ? _409 : (-1);
    int _415 = _413;
    int _417 = 0;
    int _419 = _90(_415, _417, (*spvDescriptorSet0.support_buffer));
    int _421 = _357;
    int _423 = 0;
    int _425 = _90(_421, _423, (*spvDescriptorSet0.support_buffer));
    float4 _428 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_419, _425)), 0).xyzw;
    float _430 = _428.x;
    float _432 = _428.y;
    float _434 = _428.z;
    float _436 = _428.w;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _440 = _300 + _438;
    bool _442 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _444 = isnan(_300);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _456 = _300 + _454;
    bool _458 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _460 = isnan(_300);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _470;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _478 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _480 = isnan(_300);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = 1.0 / _472;
    float _492 = -_488;
    float _494 = _492 + 1.0;
    float _496 = _468 * _494;
    float _498 = -_468;
    float _500 = _498 + 1.0;
    float _502 = 1.0 / _476;
    float _504 = _440 * _490;
    float _506 = -_452;
    float _508 = _506 + 1.0;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _510;
    float _514 = _488 * _508;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _520;
    float _524 = _456 * _502;
    int _526 = _413 + 1;
    float _528 = fma(_518, _504, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _530 = fma(_512, _504, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _532 = fma(_522, _504, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _534 = _528 * _496;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _540 = _530 * _496;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _546 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[107].x, _534);
    float _548 = fma(_538, _524, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _550 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[107].y, _540);
    float _552 = fma(_544, _524, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _554 = _532 * _496;
    float _556 = fma(_548, _514, _546);
    int _558 = abs(_526);
    float _560 = fma(_552, _514, _550);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _566 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[109].x, _556);
    float _568 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[107].z, _554);
    float _570 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[109].y, _560);
    float _572 = fma(_564, _524, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _574 = _566 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    uint _576 = uint(int(uint(_526) >> uint(31)));
    float _578 = _570 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _580 = fma(_572, _514, _568);
    float _582 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _584 = float(uint(_558));
    float _586 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _588 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[109].z, _580);
    int _590 = ~int(_576);
    int _592 = _590 + 1;
    float _594 = as_type<float>(_343) * _584;
    float _596 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _598 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = trunc(_594);
    float _602 = precise::max(_600, 0.0);
    uint _604 = uint(_602);
    out.m_56.x = _582;
    out.m_56.y = _586;
    out.m_56.z = _598;
    int _606 = ~int(_604);
    int _608 = _606 + 1;
    int _610 = _608 * _318;
    int _612 = _610 + _558;
    float _614 = float(uint(_612));
    float _616 = as_type<float>(_343) * _614;
    float _618 = trunc(_616);
    float _620 = precise::max(_618, 0.0);
    uint _622 = uint(_620);
    int _624 = int(_604) + int(_622);
    int _626 = ~_624;
    int _628 = _626 + 1;
    int _630 = _628 * _318;
    int _632 = _630 + _558;
    bool _634 = uint(_632) >= uint(_318);
    bool _636 = !_634;
    int _638 = _636 ? 0 : (-1);
    int _640 = ~_624;
    int _642 = _640 + _638;
    int _644 = _642 + 1;
    int _646 = _644 * _318;
    int _648 = _646 + _558;
    int _650 = _648 ^ _592;
    int _652 = ~_592;
    int _654 = _652 + _650;
    int _656 = _654 + 1;
    bool _658 = !_320;
    int _660 = _658 ? _656 : (-1);
    uint _662 = as_type<uint>(half2(float2(_436, 0.0)));
    uint _664 = extract_bits(_662, 0u, 8u);
    int _666 = int(_664) & 255;
    uint _668 = extract_bits(_662, 8u, 8u);
    int _670 = int(_668) & 255;
    int _672 = _670 << 8;
    int _674 = _666 | _672;
    bool _676 = _674 >= 32768;
    int _678 = _674 + (-1024);
    int _680 = _678;
    if (_676)
    {
        int _682 = ~_674;
        int _684 = _682 + 33792;
        int _686 = _684 + 1;
        _680 = _686;
    }
    int _688 = _680;
    int _690 = _688 + 30719;
    float _692 = float(_690);
    float _694 = fma(_692, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _696 = abs(_694);
    float _698 = -_696;
    float _700 = _698 + 1.0;
    float _702 = abs(_694);
    float _704 = fma(_702, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _706 = _694 < 0.0;
    float _708 = float(_706);
    int _710 = as_type<int>(_700) + (-218103808);
    float _712 = abs(_694);
    float _714 = fma(_712, _704, -0.212114393711090087890625);
    bool _716 = uint(_710) >= 1920991232u;
    float _718 = abs(_694);
    float _720 = fma(_718, _714, 1.570728778839111328125);
    bool _722 = !_716;
    float _748;
    if (!_722)
    {
        int _724 = as_type<int>(_700);
        int _726 = _638;
        int _728 = _656;
        int _730 = 3296;
        int _732 = as_type<int>(_582);
        int _734;
        int _736;
        int _738;
        int _740;
        int _742;
        int _744;
        int _746;
        _87(_724, _726, _728, _730, _732, _734, _736, _738, _740, _742, _744, _746, out.gl_Position, out.gl_PointSize);
        _748 = as_type<float>(_744);
        _750 = true;
    }
    else
    {
        float _752 = rsqrt(_700);
        float _754 = _700 * _752;
        float _756 = _752 * 0.5;
        float _758 = -_754;
        float _760 = 0.0 + _758;
        float _762 = fma(_756, _760, 0.5);
        float _764 = fma(_754, _762, _754);
        float _766 = -_764;
        float _768 = 0.0 + _766;
        float _770 = fma(_764, _768, _700);
        float _772 = fma(_756, _770, _764);
        _748 = _772;
    }
    _750 = false;
    float _774 = _748;
    int _776 = _660;
    int _778 = 0;
    int _780 = _90(_776, _778, (*spvDescriptorSet0.support_buffer));
    int _782 = _357;
    int _784 = 0;
    int _786 = _90(_782, _784, (*spvDescriptorSet0.support_buffer));
    float4 _788 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_780, _786)), 0).xyzw;
    float _790 = _788.x;
    float _792 = _788.y;
    float _794 = _788.z;
    float _796 = _788.w;
    float _798 = _720 * _774;
    float _800 = _708 * 2.0;
    float _802 = _692 * 3.883221149444580078125;
    float _804 = floor(_322);
    float _806 = -_800;
    float _808 = fma(_798, _806, _798);
    float _810 = _802 * 0.15915493667125701904296875;
    float _812 = fma(_708, 3.1415927410125732421875, _808);
    float _814 = _810 * 6.283185482025146484375;
    float _816 = cos(_814);
    float _818 = _812 * 0.15915493667125701904296875;
    float _820 = _818 * 6.283185482025146484375;
    float _822 = sin(_820);
    float _824 = -_804;
    float _826 = _322 + _824;
    float _828 = _810 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = _822 * _816;
    float _834 = _822 * _830;
    uint _836 = as_type<uint>(half2(float2(_796, 0.0)));
    float _838 = -_432;
    float _840 = _838 + _792;
    float _842 = -_434;
    float _844 = _842 + _794;
    uint _846 = extract_bits(_836, 0u, 8u);
    int _848 = int(_846) & 255;
    uint _850 = extract_bits(_836, 8u, 8u);
    int _852 = int(_850) & 255;
    int _854 = _852 << 8;
    int _856 = _848 | _854;
    float _858 = fma(_826, _840, _432);
    float _860 = fma(_826, _844, _434);
    bool _862 = _856 >= 32768;
    int _864 = _856 + (-1024);
    int _866 = _864;
    if (_862)
    {
        int _868 = ~_856;
        int _870 = _868 + 33792;
        int _872 = _870 + 1;
        _866 = _872;
    }
    int _874 = _866;
    int _876 = _874 + 30719;
    float _878 = float(_876);
    float _880 = fma(_878, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _882 = abs(_880);
    float _884 = -_882;
    float _886 = _884 + 1.0;
    bool _888 = _880 < 0.0;
    float _890 = float(_888);
    float _892 = abs(_880);
    float _894 = fma(_892, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _896 = as_type<int>(_886) + (-218103808);
    float _898 = abs(_880);
    float _900 = fma(_898, _894, -0.212114393711090087890625);
    bool _902 = uint(_896) >= 1920991232u;
    float _904 = -_430;
    float _906 = _904 + _790;
    float _908 = abs(_880);
    float _910 = fma(_908, _900, 1.570728778839111328125);
    float _912 = fma(_826, _906, _430);
    bool _914 = !_902;
    float _940;
    if (!_914)
    {
        int _916 = as_type<int>(_886);
        int _918 = as_type<int>(_790);
        int _920 = as_type<int>(_792);
        int _922 = 4192;
        int _924 = as_type<int>(_798);
        int _926;
        int _928;
        int _930;
        int _932;
        int _934;
        int _936;
        int _938;
        _87(_916, _918, _920, _922, _924, _926, _928, _930, _932, _934, _936, _938, out.gl_Position, out.gl_PointSize);
        _940 = as_type<float>(_936);
        _942 = true;
    }
    else
    {
        float _944 = rsqrt(_886);
        float _946 = _886 * _944;
        float _948 = _944 * 0.5;
        float _950 = -_946;
        float _952 = 0.0 + _950;
        float _954 = fma(_948, _952, 0.5);
        float _956 = fma(_946, _954, _946);
        float _958 = -_956;
        float _960 = 0.0 + _958;
        float _962 = fma(_956, _960, _886);
        float _964 = fma(_948, _962, _956);
        _940 = _964;
    }
    _942 = false;
    float _966 = _940;
    float _968 = in.m_48.x;
    float _970 = in.m_48.y;
    float _972 = in.m_48.z;
    float _974 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _976 = log2(_974);
    float _978 = _910 * _966;
    bool _980 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _982 = isnan(0.0);
    bool _984 = _980 || _982;
    bool _986 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _988 = _984 || _986;
    float _990 = _878 * 3.883221149444580078125;
    bool _992 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _994 = isnan(1.0);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1000 = _996 || _998;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1004 = 1.0 + _1002;
    float _1006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _1008 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1010 = _976 * _104;
    float _1012 = 1.0 / _1004;
    float _1014 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1008);
    float _1016 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1018 = _972 * 2.0;
    float _1020 = _968 * 2.0;
    float _1022 = exp2(_1010);
    float _1024 = _970 * 2.0;
    float _1026 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1016);
    float _1028 = floor(_1018);
    float _1030 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1014);
    float _1032 = floor(_1020);
    float _1034 = -_1022;
    float _1036 = _1034 + 1.0;
    float _1038 = _988 ? _1036 : 0.0;
    bool _1040 = _1028 > 0.0;
    float _1042 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    bool _1044 = _1028 >= 0.0;
    bool _1046 = isnan(_1028);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan(0.0);
    bool _1052 = _1048 || _1050;
    if (_1000)
    {
        float _1054 = _1038 * _1012;
        _114 = _1054;
    }
    float _1056 = _114;
    int _1058 = _1052 ? 0 : 1;
    float _1060 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _1062 = _1032 >= 0.0;
    bool _1064 = isnan(_1032);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan(0.0);
    bool _1070 = _1066 || _1068;
    float _1072 = floor(_1024);
    int _1074 = ~_1058;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    float _1080 = _1060 * _1006;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _1084 = _1082 != 0;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _1088 = _1086 != 0;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _1092 = _1090 != 0;
    float _1094 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    int _1096 = _1078;
    if (!_1040)
    {
        int _1098 = ~_1058;
        int _1100 = _1098 + 1;
        _1096 = _1100;
    }
    int _1102 = _1096;
    float _1104 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[203].x, _1080);
    int _1106 = _1070 ? 0 : 1;
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _1112 = _1110 != 0;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _1116 = _1114 != 0;
    float _1118 = _1094 * _1042;
    bool _1120 = !_1088;
    int _1122 = _1120 ? 0 : 1;
    float _1124 = _970 + _968;
    bool _1126 = _1032 > 0.0;
    float _1128 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1118);
    bool _1130 = !_1084;
    int _1132 = _1130 ? 0 : 1;
    float _1134 = floor(_1104);
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _1138 = _1136 != 0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _1142 = _1140 != 0;
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _1146 = _1144 != 0;
    float _1148 = _1124 + (-1.0);
    int _1150 = ~_1106;
    int _1152 = _1150 + 1;
    int _1154 = _1152 + 1;
    bool _1156 = !_1092;
    int _1158 = _1156 ? 0 : 1;
    float _1160 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1162 = !_1146;
    int _1164 = _1162 ? 0 : 1;
    float _1166 = floor(_1128);
    int _1168 = _1154;
    if (!_1126)
    {
        int _1170 = ~_1106;
        int _1172 = _1170 + 1;
        _1168 = _1172;
    }
    int _1174 = _1168;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1182 = _1180 != 0;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1186 = _1184 != 0;
    float _1188 = _970 + _972;
    float _1190 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _1192 = !_1112;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = -_1134;
    float _1198 = _1104 + _1196;
    float _1200 = _1188 + (-1.0);
    float _1202 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1190);
    bool _1204 = _1072 >= 0.0;
    bool _1206 = isnan(_1072);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan(0.0);
    bool _1212 = _1208 || _1210;
    float _1214 = _1128 + 0.25;
    float _1216 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1218 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1202);
    int _1220 = _1212 ? 0 : 1;
    float _1222 = floor(_1214);
    bool _1224 = _1072 > 0.0;
    float _1226 = _1104 + 0.25;
    bool _1228 = !_1178;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1026);
    float _1234 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _1236 = float(_1102);
    float _1238 = _970 + (-0.5);
    float _1240 = floor(_1226);
    int _1242 = abs(_1230);
    float _1244 = _1234 * _1108;
    int _1246 = ~_1220;
    int _1248 = _1246 + 1;
    int _1250 = _1248 + 1;
    float _1252 = float(_1242);
    float _1254 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[203].z, _1244);
    int _1256 = _1250;
    if (!_1224)
    {
        int _1258 = ~_1220;
        int _1260 = _1258 + 1;
        _1256 = _1260;
    }
    int _1262 = _1256;
    float _1264 = rsqrt(_1232);
    bool _1266 = _1198 >= 0.5;
    bool _1268 = isnan(_1198);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan(0.5);
    bool _1274 = _1270 || _1272;
    float _1276 = _1252 * _1236;
    float _1278 = -_1166;
    float _1280 = _1128 + _1278;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1284 = _1282 != 0;
    bool _1286 = !_1274;
    float _1288 = _1286 ? 0.5 : (-0.5);
    float _1290 = floor(_1254);
    float _1292 = -_1240;
    float _1294 = _1226 + _1292;
    int _1296 = abs(_1122);
    float _1298 = _1104 * 6.283185482025146484375;
    bool _1300 = _1280 >= 0.5;
    bool _1302 = isnan(_1280);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.5);
    bool _1308 = _1304 || _1306;
    float _1310 = -_1222;
    float _1312 = _1214 + _1310;
    int _1314 = abs(_1194);
    float _1316 = _1128 * 6.283185482025146484375;
    float _1318 = _1298 * 0.15915493667125701904296875;
    float _1320 = float(_1296);
    float _1322 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1324 = _1322 * 2.0;
    bool _1326 = !_1308;
    float _1328 = _1326 ? 0.5 : (-0.5);
    float _1330 = _1316 * 0.15915493667125701904296875;
    float _1332 = _1254 + 0.25;
    float _1334 = _1320 * _1324;
    float _1336 = -_1290;
    float _1338 = _1254 + _1336;
    float _1340 = float(_1314);
    float _1342 = floor(_1332);
    bool _1344 = !_1142;
    int _1346 = _1344 ? 0 : 1;
    float _1348 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1350 = _1348 * 2.0;
    bool _1352 = _1338 >= 0.5;
    bool _1354 = isnan(_1338);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan(0.5);
    bool _1360 = _1356 || _1358;
    float _1362 = _1254 * 6.283185482025146484375;
    bool _1364 = !_1284;
    int _1366 = _1364 ? 0 : 1;
    float _1368 = _1340 * _1350;
    int _1370 = abs(_1346);
    float _1372 = _1318 * 6.283185482025146484375;
    float _1374 = sin(_1372);
    bool _1376 = !_1360;
    float _1378 = _1376 ? 0.5 : (-0.5);
    float _1380 = _858 * _1264;
    bool _1382 = _1294 > 0.5;
    int _1384 = abs(_1132);
    int _1386 = abs(_1366);
    float _1388 = _1330 * 6.283185482025146484375;
    float _1390 = sin(_1388);
    float _1392 = -_1342;
    float _1394 = _1332 + _1392;
    float _1396 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1398 = _1396 * 2.0;
    float _1400 = float(_1370);
    float _1402 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1404 = float(_1384);
    float _1406 = _1294;
    float _1408 = _1312;
    float _1410 = _1394;
    if (_1382)
    {
        float _1412 = -_1294;
        float _1414 = _1412 + 1.0;
        _1406 = _1414;
    }
    float _1416 = _1406;
    float _1418 = float(_1386);
    float _1420 = _1400 * _1398;
    float _1422 = _1362 * 0.15915493667125701904296875;
    bool _1424 = _1312 > 0.5;
    float _1426 = fma(_1416, 4.0, -1.0);
    float _1428 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1430 = fma(_1404, _1402, _1334);
    bool _1432 = !_1138;
    int _1434 = _1432 ? 0 : 1;
    float _1436 = _1422 * 6.283185482025146484375;
    float _1438 = sin(_1436);
    float _1440 = fma(_1418, _1428, _1368);
    bool _1442 = !_1116;
    int _1444 = _1442 ? 0 : 1;
    float _1446 = in.m_58.x;
    float _1448 = in.m_58.y;
    float _1450 = in.m_58.z;
    int _1452 = abs(_1158);
    int _1454 = abs(_1434);
    if (_1424)
    {
        float _1456 = -_1312;
        float _1458 = _1456 + 1.0;
        _1408 = _1458;
    }
    float _1460 = _1408;
    bool _1462 = _1394 > 0.5;
    int _1464 = abs(_1444);
    float _1466 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1468 = float(_1452);
    float _1470 = fma(_1460, 4.0, -1.0);
    float _1472 = float(_1454);
    float _1474 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    bool _1476 = !_1182;
    int _1478 = _1476 ? 0 : 1;
    float _1480 = fma(_1468, _1466, _1430);
    float _1482 = float(_1464);
    float _1484 = fma(_1472, _1474, _1420);
    float _1486 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    int _1488 = abs(_1164);
    float _1490 = _1276 * (-2.0);
    int _1492 = abs(_1478);
    if (_1462)
    {
        float _1494 = -_1394;
        float _1496 = _1494 + 1.0;
        _1410 = _1496;
    }
    float _1498 = _1410;
    float _1500 = fma(_1482, _1486, _1440);
    float _1502 = fma(_1480, 3.1415927410125732421875, _1446);
    float _1504 = float(_1174);
    float _1506 = fma(_1160, _1490, _1160);
    float _1508 = fma(_1502, _1490, _1502);
    float _1510 = float(_1492);
    float _1512 = fma(_1498, 4.0, -1.0);
    float _1514 = _968 + (-0.5);
    float _1516 = float(_1488);
    float _1518 = fma(_1500, 3.1415927410125732421875, _1448);
    float _1520 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1522 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1508);
    float _1524 = _1510 * _1504;
    bool _1526 = !_1186;
    int _1528 = _1526 ? 0 : 1;
    float _1530 = fma(_1516, _1520, _1484);
    float _1532 = fma(_1506, _1056, _1522);
    float _1534 = _1524 * (-2.0);
    int _1536 = abs(_1528);
    float _1538 = rsqrt(_1218);
    float _1540 = float(_1262);
    float _1542 = fma(_1518, _1534, _1518);
    float _1544 = float(_1536);
    float _1546 = fma(_1216, _1534, _1216);
    float _1548 = in.m_52.x;
    float _1550 = in.m_52.y;
    float _1552 = in.m_52.z;
    float _1554 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1542);
    float _1556 = _968 + _972;
    float _1558 = _1544 * _1540;
    float _1560 = rsqrt(_1030);
    float _1562 = fma(_1546, _1056, _1554);
    float _1564 = fma(_1530, 3.1415927410125732421875, _1450);
    float _1566 = _1556 + (-1.0);
    float _1568 = _1558 * (-2.0);
    float _1570 = _1562 * 0.15915493667125701904296875;
    float _1572 = _972 + (-0.5);
    float _1574 = _1532 * 0.15915493667125701904296875;
    float _1576 = sqrt(_1030);
    float _1578 = fma(_1564, _1568, _1564);
    float _1580 = _860 * _1538;
    float _1582 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1584 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1578);
    float _1586 = _1574 * 6.283185482025146484375;
    float _1588 = sin(_1586);
    float _1590 = _912 * _1560;
    float _1592 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1594 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1596 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1598 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1600 = _1574 * 6.283185482025146484375;
    float _1602 = cos(_1600);
    float _1604 = _1576 * _1580;
    float _1606 = fma(_1596, _1568, _1596);
    float _1608 = _1576 * _1590;
    float _1610 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1612 = _1592 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1614 = fma(_1606, _1056, _1584);
    float _1616 = _890 * 2.0;
    float _1618 = _1570 * 6.283185482025146484375;
    float _1620 = sin(_1618);
    float _1622 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1608);
    float _1624 = _1614 * 0.15915493667125701904296875;
    float _1626 = _1576 * _1380;
    float _1628 = _1598 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1604);
    float _1632 = _1610 * _1622;
    float _1634 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1626);
    float _1636 = _1570 * 6.283185482025146484375;
    float _1638 = cos(_1636);
    float _1640 = _1628 * _1630;
    bool _1642 = _1626 != 0.0;
    bool _1644 = isnan(_1626);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan(0.0);
    bool _1650 = _1646 || _1648;
    float _1652 = _1612 * _1634;
    bool _1654 = _1608 == 0.0;
    bool _1656 = !_1650;
    bool _1658 = _1654 && _1656;
    float _1660 = _1624 * 6.283185482025146484375;
    float _1662 = cos(_1660);
    float _1664 = -_1616;
    float _1666 = fma(_978, _1664, _978);
    float _1668 = _1588 * _1620;
    bool _1670 = _1604 == 0.0;
    bool _1672 = _1670 && _1658;
    float _1674 = fma(_890, 3.1415927410125732421875, _1666);
    float _1676 = _1624 * 6.283185482025146484375;
    float _1678 = sin(_1676);
    float _1680 = _1602 * _1638;
    float _1682 = _1588 * _1638;
    float _1684 = _1602 * _1662;
    float _1686 = _1638 * _1662;
    float _1688 = _1602 * _1620;
    float _1690 = _1588 * _1662;
    float _1692 = _1620 * _1662;
    float _1694 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1696 = _1690 * _1652;
    float _1698 = fma(_1678, _1680, _1668);
    float _1700 = fma(_1678, _1668, _1680);
    float _1702 = -_1688;
    float _1704 = fma(_1678, _1682, _1702);
    float _1706 = -_1682;
    float _1708 = fma(_1678, _1688, _1706);
    float _1710 = _1684 * _1652;
    float _1712 = -_1652;
    float _1714 = _1678 * _1712;
    float _1716 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1694);
    float _1718 = fma(_1698, _1632, _1710);
    float _1720 = fma(_1686, _1632, _1714);
    float _1722 = fma(_1704, _1632, _1696);
    float _1724 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1726 = fma(_1708, _1640, _1718);
    float _1728 = fma(_1692, _1640, _1720);
    float _1730 = fma(_1700, _1640, _1722);
    float _1732 = _990 * 0.15915493667125701904296875;
    float _1734 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1724);
    float _1736 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1738 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1740 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1716);
    float _1742 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1734);
    float _1744 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1736);
    float _1746 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1738);
    float _1748 = _1740 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1750 = _1742 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1752 = fma(_1730, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1744);
    float _1754 = fma(_1730, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1746);
    float _1756 = _1674 * 0.15915493667125701904296875;
    float _1758 = _1732 * 6.283185482025146484375;
    float _1760 = cos(_1758);
    float _1762 = _1748 + _1752;
    float _1764 = _1750 + _1754;
    float _1766 = -_694;
    float _1768 = _1766 + _880;
    float _1770 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1582);
    float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1774 = _1762 + _1772;
    float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1778 = _1764 + _1776;
    float _1780 = _1732 * 6.283185482025146484375;
    float _1782 = sin(_1780);
    float _1784 = _1774 * _1774;
    float _1786 = _1778 * _1778;
    float _1788 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1770);
    float _1790 = _1784 + _1786;
    float _1792 = _1756 * 6.283185482025146484375;
    float _1794 = sin(_1792);
    float _1796 = sqrt(_1790);
    float _1798 = -_832;
    float _1800 = fma(_1794, _1760, _1798);
    float _1802 = -_834;
    float _1804 = fma(_1794, _1782, _1802);
    float _1806 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1808 = fma(_826, _1768, _694);
    float _1810 = fma(_826, _1800, _832);
    float _1812 = fma(_826, _1804, _834);
    float _1814 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1806);
    float _1816 = _1808;
    float _1818 = _1810;
    float _1820 = _1812;
    float _1822 = _1626;
    float _1824 = _1678;
    float _1826 = _1788;
    float _1828 = _1604;
    if (!_1672)
    {
        float _1830 = fma(_1626, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1808);
        _1816 = _1830;
    }
    float _1832 = _1816;
    bool _1834 = _1796 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1672)
    {
        float _1836 = fma(_1608, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1810);
        _1818 = _1836;
    }
    float _1838 = _1818;
    float _1840 = fma(_1730, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1814);
    float _1842 = _1788 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (!_1672)
    {
        float _1844 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1812);
        _1820 = _1844;
    }
    float _1846 = _1820;
    float _1848 = -_1832;
    float _1850 = _1678 * _1848;
    float _1852 = _1684 * _1832;
    float _1854 = _1842 + _1840;
    float _1856 = _1690 * _1832;
    if (!_1834)
    {
        _1822 = _1786;
    }
    float _1858 = _1822;
    float _1860 = _1858;
    if (!_1834)
    {
        _1824 = _1784;
    }
    float _1862 = _1824;
    float _1864 = _1862;
    if (!_1834)
    {
        _284 = _1762;
    }
    float _1866 = _284;
    float _1868 = _1866;
    if (!_1834)
    {
        _1826 = _1764;
    }
    float _1870 = _1826;
    float _1872 = _1870;
    if (!_1834)
    {
        _1828 = _1854;
    }
    float _1874 = _1828;
    bool _1876 = !_1834;
    float _1878 = _1874;
    if (!_1876)
    {
        float _1880 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1884 = _1796 + _1882;
        float _1886 = rsqrt(_1790);
        float _1888 = _1884 * _1880;
        float _1890 = _1854 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1892 = _1888 * 0.15915493667125701904296875;
        float _1894 = _1892 * 6.283185482025146484375;
        float _1896 = sin(_1894);
        float _1898 = _1892 * 6.283185482025146484375;
        float _1900 = cos(_1898);
        float _1902 = fma(_1896, _1890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1904 = _1886 * _1902;
        float _1906 = _1900 + (-1.0);
        float _1908 = _1774 * _1904;
        float _1910 = _1778 * _1904;
        float _1912 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1914 = _1908 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1916 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1918 = _1908 * _1908;
        float _1920 = fma(_1854, _1900, _1912);
        float _1922 = _1910 * _1910;
        _1878 = _1920;
        _1864 = _1918;
        _1860 = _1922;
        _1868 = _1914;
        _1872 = _1916;
    }
    float _1924 = _1878;
    float _1926 = _1864;
    float _1928 = _1860;
    float _1930 = _1868;
    float _1932 = _1872;
    float _1934 = in.m_60.x;
    float _1936 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1938 = _1924 + _1936;
    float _1940 = fma(_1698, _1838, _1852);
    float _1942 = fma(_1686, _1838, _1850);
    float _1944 = in.m_60.y;
    float _1946 = fma(_1938, _1938, _1926);
    float _1948 = fma(_1708, _1846, _1940);
    float _1950 = fma(_1704, _1838, _1856);
    float _1952 = fma(_1692, _1846, _1942);
    float _1954 = _1946 + _1928;
    float _1956 = _1948 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1958 = _1948 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1960 = _1948 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1962 = fma(_1700, _1846, _1950);
    float _1964 = fma(_1952, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1956);
    float _1966 = sqrt(_1954);
    float _1968 = fma(_1952, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1958);
    float _1970 = fma(_1952, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1960);
    float _1972 = fma(_1962, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1964);
    float _1974 = fma(_1962, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1968);
    float _1976 = fma(_1962, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1970);
    out.m_62.x = _1934;
    out.m_62.y = _1944;
    bool _1978 = _1966 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1980 = isnan(_1966);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1986 = _1982 || _1984;
    out.m_64.x = _1974;
    out.m_64.y = _1972;
    out.m_64.z = _1976;
    float _1988 = _1954;
    if (!_1986)
    {
        _1988 = 1.0;
    }
    float _1990 = _1988;
    bool _1992 = !_1986;
    float _1994 = _1990;
    if (!_1992)
    {
        bool _1996 = _1966 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1998 = isnan(_1966);
        bool _2000 = _1996 || _1998;
        bool _2002 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2004 = _2000 || _2002;
        if (!_2004)
        {
            float _2006 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2008 = _1966 + _2006;
            float _2010 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2012 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2010;
            float _2014 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2016 = _2014 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2018 = 1.0 / _2012;
            float _2020 = _2008 * _2018;
            float _2022 = fma(_2020, _2016, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1994 = _2022;
            _2024 = true;
        }
        else
        {
            bool _2026 = _1966 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2028 = isnan(_1966);
            bool _2030 = _2026 || _2028;
            bool _2032 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2034 = _2030 || _2032;
            if (!_2034)
            {
                float _2036 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2038 = _1966 + _2036;
                float _2040 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2042 = _2040 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2044 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2046 = _2044 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2048 = 1.0 / _2042;
                float _2050 = _2038 * _2048;
                float _2052 = fma(_2050, _2046, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1994 = _2052;
                _2024 = true;
            }
            else
            {
                _1994 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2024 = false;
    float _2054 = _1994;
    float _2056 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2058 = _1924 + _2056;
    float _2060 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2062 = _1930 + _2060;
    float _2064 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2066 = _1932 + _2064;
    out.m_66.x = _1748;
    out.m_66.y = _1842;
    out.m_66.z = _1750;
    float _2068 = fma(_2058, _2054, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2070 = fma(_2062, _2054, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2072 = fma(_2066, _2054, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2074 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2076 = _2068 + _2074;
    float _2078 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2080 = _2070 + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2084 = _2072 + _2082;
    float _2086 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2088 = _2076 * _2076;
    float _2090 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    out.m_68.x = _2070;
    out.m_68.y = _2068;
    out.m_68.z = _2072;
    float _2092 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2086);
    float _2094 = fma(_2080, _2080, _2088);
    float _2096 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2098 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2090);
    float _2100 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2092);
    float _2102 = fma(_2084, _2084, _2094);
    float _2104 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2106 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2096);
    float _2108 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2098);
    float _2110 = _2100 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2112 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2104);
    float _2114 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2106);
    float _2116 = _2108 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2118 = sqrt(_2102);
    float _2120 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2112);
    float _2122 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2124 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2126 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2128 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2130 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2132 = _2120 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2134 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2124);
    float _2136 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2126);
    float _2138 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2128);
    float _2140 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2130);
    float _2142 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2134);
    float _2144 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2136);
    float _2146 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2138);
    float _2148 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2140);
    float _2150 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2142);
    float _2152 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2144);
    float _2154 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2146);
    float _2156 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2148);
    bool _2158 = _2118 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2160 = isnan(_2118);
    bool _2162 = _2158 || _2160;
    bool _2164 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2166 = _2162 || _2164;
    out.gl_Position.x = _2150;
    out.gl_Position.y = _2152;
    out.gl_Position.z = _2154;
    out.gl_Position.w = _2156;
    float _2168 = _2146;
    float _2170 = _2144;
    float _2172 = _2142;
    float _2174 = _2132;
    float _2176 = _2116;
    float _2178 = _2122;
    if (!_2166)
    {
        _2168 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2180 = _2168;
    float _2182 = _2180;
    float _2184 = _2180;
    if (!_2166)
    {
        _2170 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2186 = _2170;
    float _2188 = _2186;
    float _2190 = _2186;
    if (!_2166)
    {
        _2172 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2192 = _2172;
    float _2194 = _2192;
    float _2196 = _2192;
    if (!_2166)
    {
        _2174 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2198 = _2174;
    float _2200 = _2198;
    float _2202 = _2198;
    if (!_2166)
    {
        _2176 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2204 = _2176;
    float _2206 = _2204;
    float _2208 = _2204;
    if (!_2166)
    {
        _2178 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2210 = _2178;
    bool _2212 = !_2166;
    float _2214 = _2210;
    float _2216 = _2210;
    if (!_2212)
    {
        bool _2218 = _2118 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2220 = isnan(_2118);
        bool _2222 = _2218 || _2220;
        bool _2224 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2226 = _2222 || _2224;
        if (!_2226)
        {
            float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2230 = _2118 + _2228;
            float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2234 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2232;
            float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2238 = _2236 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2242 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2244 = 1.0 / _2234;
            float _2246 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2248 = _2246 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2252 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2254 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2256 = _2254 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2258 = _2230 * _2244;
            float _2260 = precise::clamp(_2258, 0.0, 1.0);
            float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2264 = _2262 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2266 = fma(_2260, _2238, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2268 = fma(_2260, _2242, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2270 = fma(_2260, _2248, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2272 = fma(_2260, _2264, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2274 = fma(_2260, _2252, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2276 = fma(_2260, _2256, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2208 = _2268;
            _2190 = _2274;
            _2202 = _2266;
            _2184 = _2272;
            _2216 = _2270;
            _2196 = _2276;
            _2278 = true;
        }
        else
        {
            bool _2280 = _2118 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2282 = isnan(_2118);
            bool _2284 = _2280 || _2282;
            bool _2286 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2288 = _2284 || _2286;
            if (!_2288)
            {
                _2182 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2290 = _2182;
            _2184 = _2290;
            if (!_2288)
            {
                _2188 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2292 = _2188;
            _2190 = _2292;
            if (!_2288)
            {
                _2194 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2294 = _2194;
            _2196 = _2294;
            if (!_2288)
            {
                _2200 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2296 = _2200;
            _2202 = _2296;
            if (!_2288)
            {
                _2206 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2298 = _2206;
            _2208 = _2298;
            if (!_2288)
            {
                _2214 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2300 = _2214;
            bool _2302 = !_2288;
            _2216 = _2300;
            if (!_2302)
            {
                bool _2304 = _2118 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2306 = isnan(_2118);
                bool _2308 = _2304 || _2306;
                bool _2310 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2312 = _2308 || _2310;
                if (!_2312)
                {
                    float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2316 = _2118 + _2314;
                    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2320 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2318;
                    float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2324 = _2322 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2328 = _2326 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2330 = 1.0 / _2320;
                    float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2334 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2338 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2344 = _2316 * _2330;
                    float _2346 = precise::clamp(_2344, 0.0, 1.0);
                    float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2352 = fma(_2346, _2324, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2354 = fma(_2346, _2328, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2356 = fma(_2346, _2334, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2358 = fma(_2346, _2350, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2360 = fma(_2346, _2338, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2362 = fma(_2346, _2342, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2208 = _2354;
                    _2190 = _2360;
                    _2202 = _2352;
                    _2184 = _2358;
                    _2216 = _2356;
                    _2196 = _2362;
                    _2278 = true;
                }
                else
                {
                    _2208 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2190 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2202 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2184 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2216 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2196 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2278 = false;
    float _2364 = _2208;
    float _2366 = _2190;
    float _2368 = _2202;
    float _2370 = _2184;
    float _2372 = _2216;
    float _2374 = _2196;
    float _2376 = fma(_1972, -0.5, 0.5);
    float _2378 = precise::clamp(_2376, 0.0, 1.0);
    float _2380 = -_2364;
    float _2382 = _2366 + _2380;
    float _2384 = -_2368;
    float _2386 = _2370 + _2384;
    float _2388 = -_2372;
    float _2390 = _2374 + _2388;
    bool _2392 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2394 = fma(_2378, _2382, _2364);
    float _2396 = fma(_2378, _2386, _2368);
    float _2398 = fma(_2378, _2390, _2372);
    float _2400 = _2394 * 0.586610972881317138671875;
    out.m_46.x = 1.0;
    float _2402 = fma(_2396, 0.298911988735198974609375, _2400);
    out.m_70.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2404 = fma(_2398, 0.114477999508380889892578125, _2402);
    float _2406 = -_2404;
    float _2408 = _2396 + _2406;
    float _2410 = -_2404;
    float _2412 = _2394 + _2410;
    float _2414 = -_2404;
    float _2416 = _2398 + _2414;
    out.m_72.x = 0.0;
    float _2418 = fma(_2408, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2404);
    float _2420 = fma(_2412, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2404);
    float _2422 = fma(_2416, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2404);
    out.m_74.x = _2418;
    out.m_74.y = _2420;
    out.m_74.z = _2422;
    if (!_2392)
    {
        return out;
    }
    float _2424 = -_2068;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2428 = -_2070;
    float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2432 = -_2072;
    float _2434 = _2432 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2436 = _2426 * _2426;
    float _2438 = fma(_2430, _2430, _2436);
    float _2440 = fma(_2434, _2434, _2438);
    float _2442 = sqrt(_2440);
    float _2444 = rsqrt(_2440);
    float _2446 = -_2442;
    float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2450 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2452 = precise::clamp(_2450, 0.0, 1.0);
    float _2454 = _2430 * _2444;
    float _2456 = _2426 * _2444;
    float _2458 = abs(_2452);
    float _2460 = log2(_2458);
    float _2462 = _2434 * _2444;
    float _2464 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2466 = _1972 * _2456;
    float _2468 = -_2456;
    float _2470 = -_2464;
    float _2472 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2470);
    float _2474 = fma(_1974, _2454, _2466);
    float _2476 = -_2462;
    float _2478 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2472);
    float _2480 = fma(_1976, _2462, _2474);
    float _2482 = precise::clamp(_2480, 0.0, 1.0);
    float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2486 = _2478 + _2484;
    float _2488 = _2460 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2490 = _2486 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2492 = precise::clamp(_2490, 0.0, 1.0);
    float _2494 = exp2(_2488);
    float _2496 = _2494 * _2492;
    float _2498 = _2482 * _2496;
    float _2500 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2502 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2504 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_72.x = _2500;
    out.m_72.y = _2502;
    out.m_72.z = _2504;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_44 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2278 = false;
    bool _2024 = false;
    bool _942 = false;
    bool _750 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_39.w;
    float _96 = in.m_41.w;
    float _98 = trunc(_94);
    int _100 = int(_98);
    float _102 = -_96;
    float _104 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_44.y = _104;
    bool _108 = _100 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_100);
    float _114 = _104;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _110;
    if (!_108)
    {
        out.m_46.x = 0.0;
    }
    int _118 = 0;
    if (!_108)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2573 = as_type<float>(_122);
        out.gl_Position.z = _2573;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _126 = _96 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_96);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = in.m_48.x;
    float _138 = float(_100);
    float _140 = in.m_48.y;
    bool _142 = _104 >= _138;
    bool _144 = !_134;
    bool _146 = _142 || _144;
    if (_146)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _112;
    if (_146)
    {
        out.m_46.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _124 = as_type<int>(_150);
    }
    int _152 = _124;
    out.m_50.x = _136;
    out.m_50.y = _140;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2636 = as_type<float>(_152);
        out.gl_Position.z = _2636;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_52.w;
    float _156 = 1.0 / _138;
    float _158 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_41.x;
    float _172 = in.m_41.y;
    float _174 = in.m_41.z;
    float _176 = in.m_39.x;
    float _178 = in.m_39.y;
    float _180 = in.m_39.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = 1.0 / _208;
        float _216 = _210 * 0.693147182464599609375;
        float _218 = exp2(_212);
        float _220 = 1.0 / _216;
        float _222 = _218 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _220, _158);
        float _228 = _226 * _214;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = _104 * _156;
    float _274 = fma(_266, _154, _176);
    float _276 = fma(_268, _154, _178);
    float _278 = fma(_270, _154, _180);
    bool _280 = !_258;
    float _282 = _272;
    float _284 = _276;
    if (!_280)
    {
        float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _288 = _136 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[11].x, _104);
        float _292 = _290 * _286;
        float _294 = floor(_292);
        float _296 = -_294;
        float _298 = _292 + _296;
        _282 = _298;
    }
    float _300 = _282;
    int _302 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _304 = _302;
    int _306 = 0;
    int _308 = _89(_304, _306, (*spvDescriptorSet0.support_buffer));
    float _310 = in.m_48.z;
    float _312 = _104 + _310;
    float _314 = _312 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _316 = float(_308);
    int _318 = abs(_308);
    bool _320 = _308 == 0;
    float _322 = _314 * _316;
    float _324 = float(uint(_318));
    float _326 = trunc(_322);
    int _328 = int(_326);
    float _330 = 1.0 / _324;
    int _332 = abs(_328);
    uint _335 = uint(int(uint(_328) >> uint(31)));
    float _337 = float(uint(_332));
    int _339 = ~int(_335);
    int _341 = _339 + 1;
    int _343 = as_type<int>(_330) + (-2);
    float _345 = in.m_54.z;
    float _347 = as_type<float>(_343) * _337;
    float _349 = trunc(_347);
    float _351 = precise::max(_349, 0.0);
    uint _353 = uint(_351);
    float _355 = trunc(_345);
    int _357 = int(_355);
    int _359 = ~int(_353);
    int _361 = _359 + 1;
    int _363 = _361 * _318;
    int _365 = _363 + _332;
    float _367 = float(uint(_365));
    float _369 = as_type<float>(_343) * _367;
    float _371 = trunc(_369);
    float _373 = precise::max(_371, 0.0);
    uint _375 = uint(_373);
    int _377 = int(_353) + int(_375);
    int _379 = ~_377;
    int _381 = _379 + 1;
    int _383 = _381 * _318;
    int _385 = _383 + _332;
    bool _387 = uint(_385) >= uint(_318);
    bool _389 = !_387;
    int _391 = _389 ? 0 : (-1);
    int _393 = ~_377;
    int _395 = _393 + _391;
    int _397 = _395 + 1;
    int _399 = _397 * _318;
    int _401 = _399 + _332;
    int _403 = _401 ^ _341;
    int _405 = ~_341;
    int _407 = _405 + _403;
    int _409 = _407 + 1;
    bool _411 = !_320;
    int _413 = _411 ? _409 : (-1);
    int _415 = _413;
    int _417 = 0;
    int _419 = _90(_415, _417, (*spvDescriptorSet0.support_buffer));
    int _421 = _357;
    int _423 = 0;
    int _425 = _90(_421, _423, (*spvDescriptorSet0.support_buffer));
    float4 _428 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_419, _425)), 0).xyzw;
    float _430 = _428.x;
    float _432 = _428.y;
    float _434 = _428.z;
    float _436 = _428.w;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _440 = _300 + _438;
    bool _442 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _444 = isnan(_300);
    bool _446 = _442 || _444;
    bool _448 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _450 = _446 || _448;
    float _452 = float(_450);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _456 = _300 + _454;
    bool _458 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _460 = isnan(_300);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _470;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _478 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _480 = isnan(_300);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = 1.0 / _472;
    float _492 = -_488;
    float _494 = _492 + 1.0;
    float _496 = _468 * _494;
    float _498 = -_468;
    float _500 = _498 + 1.0;
    float _502 = 1.0 / _476;
    float _504 = _440 * _490;
    float _506 = -_452;
    float _508 = _506 + 1.0;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _510;
    float _514 = _488 * _508;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _516;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _520;
    float _524 = _456 * _502;
    int _526 = _413 + 1;
    float _528 = fma(_518, _504, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _530 = fma(_512, _504, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _532 = fma(_522, _504, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _534 = _528 * _496;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _540 = _530 * _496;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _546 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[107].x, _534);
    float _548 = fma(_538, _524, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _550 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[107].y, _540);
    float _552 = fma(_544, _524, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _554 = _532 * _496;
    float _556 = fma(_548, _514, _546);
    int _558 = abs(_526);
    float _560 = fma(_552, _514, _550);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _566 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[109].x, _556);
    float _568 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[107].z, _554);
    float _570 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[109].y, _560);
    float _572 = fma(_564, _524, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _574 = _566 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    uint _576 = uint(int(uint(_526) >> uint(31)));
    float _578 = _570 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _580 = fma(_572, _514, _568);
    float _582 = _574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _584 = float(uint(_558));
    float _586 = _578 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _588 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[109].z, _580);
    int _590 = ~int(_576);
    int _592 = _590 + 1;
    float _594 = as_type<float>(_343) * _584;
    float _596 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _598 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = trunc(_594);
    float _602 = precise::max(_600, 0.0);
    uint _604 = uint(_602);
    out.m_56.x = _582;
    out.m_56.y = _586;
    out.m_56.z = _598;
    int _606 = ~int(_604);
    int _608 = _606 + 1;
    int _610 = _608 * _318;
    int _612 = _610 + _558;
    float _614 = float(uint(_612));
    float _616 = as_type<float>(_343) * _614;
    float _618 = trunc(_616);
    float _620 = precise::max(_618, 0.0);
    uint _622 = uint(_620);
    int _624 = int(_604) + int(_622);
    int _626 = ~_624;
    int _628 = _626 + 1;
    int _630 = _628 * _318;
    int _632 = _630 + _558;
    bool _634 = uint(_632) >= uint(_318);
    bool _636 = !_634;
    int _638 = _636 ? 0 : (-1);
    int _640 = ~_624;
    int _642 = _640 + _638;
    int _644 = _642 + 1;
    int _646 = _644 * _318;
    int _648 = _646 + _558;
    int _650 = _648 ^ _592;
    int _652 = ~_592;
    int _654 = _652 + _650;
    int _656 = _654 + 1;
    bool _658 = !_320;
    int _660 = _658 ? _656 : (-1);
    uint _662 = as_type<uint>(half2(float2(_436, 0.0)));
    uint _664 = extract_bits(_662, 0u, 8u);
    int _666 = int(_664) & 255;
    uint _668 = extract_bits(_662, 8u, 8u);
    int _670 = int(_668) & 255;
    int _672 = _670 << 8;
    int _674 = _666 | _672;
    bool _676 = _674 >= 32768;
    int _678 = _674 + (-1024);
    int _680 = _678;
    if (_676)
    {
        int _682 = ~_674;
        int _684 = _682 + 33792;
        int _686 = _684 + 1;
        _680 = _686;
    }
    int _688 = _680;
    int _690 = _688 + 30719;
    float _692 = float(_690);
    float _694 = fma(_692, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _696 = abs(_694);
    float _698 = -_696;
    float _700 = _698 + 1.0;
    float _702 = abs(_694);
    float _704 = fma(_702, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _706 = _694 < 0.0;
    float _708 = float(_706);
    int _710 = as_type<int>(_700) + (-218103808);
    float _712 = abs(_694);
    float _714 = fma(_712, _704, -0.212114393711090087890625);
    bool _716 = uint(_710) >= 1920991232u;
    float _718 = abs(_694);
    float _720 = fma(_718, _714, 1.570728778839111328125);
    bool _722 = !_716;
    float _748;
    if (!_722)
    {
        int _724 = as_type<int>(_700);
        int _726 = _638;
        int _728 = _656;
        int _730 = 3296;
        int _732 = as_type<int>(_582);
        int _734;
        int _736;
        int _738;
        int _740;
        int _742;
        int _744;
        int _746;
        _87(_724, _726, _728, _730, _732, _734, _736, _738, _740, _742, _744, _746, out.gl_Position, out.gl_PointSize);
        _748 = as_type<float>(_744);
        _750 = true;
    }
    else
    {
        float _752 = rsqrt(_700);
        float _754 = _700 * _752;
        float _756 = _752 * 0.5;
        float _758 = -_754;
        float _760 = 0.0 + _758;
        float _762 = fma(_756, _760, 0.5);
        float _764 = fma(_754, _762, _754);
        float _766 = -_764;
        float _768 = 0.0 + _766;
        float _770 = fma(_764, _768, _700);
        float _772 = fma(_756, _770, _764);
        _748 = _772;
    }
    _750 = false;
    float _774 = _748;
    int _776 = _660;
    int _778 = 0;
    int _780 = _90(_776, _778, (*spvDescriptorSet0.support_buffer));
    int _782 = _357;
    int _784 = 0;
    int _786 = _90(_782, _784, (*spvDescriptorSet0.support_buffer));
    float4 _788 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_780, _786)), 0).xyzw;
    float _790 = _788.x;
    float _792 = _788.y;
    float _794 = _788.z;
    float _796 = _788.w;
    float _798 = _720 * _774;
    float _800 = _708 * 2.0;
    float _802 = _692 * 3.883221149444580078125;
    float _804 = floor(_322);
    float _806 = -_800;
    float _808 = fma(_798, _806, _798);
    float _810 = _802 * 0.15915493667125701904296875;
    float _812 = fma(_708, 3.1415927410125732421875, _808);
    float _814 = _810 * 6.283185482025146484375;
    float _816 = cos(_814);
    float _818 = _812 * 0.15915493667125701904296875;
    float _820 = _818 * 6.283185482025146484375;
    float _822 = sin(_820);
    float _824 = -_804;
    float _826 = _322 + _824;
    float _828 = _810 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = _822 * _816;
    float _834 = _822 * _830;
    uint _836 = as_type<uint>(half2(float2(_796, 0.0)));
    float _838 = -_432;
    float _840 = _838 + _792;
    float _842 = -_434;
    float _844 = _842 + _794;
    uint _846 = extract_bits(_836, 0u, 8u);
    int _848 = int(_846) & 255;
    uint _850 = extract_bits(_836, 8u, 8u);
    int _852 = int(_850) & 255;
    int _854 = _852 << 8;
    int _856 = _848 | _854;
    float _858 = fma(_826, _840, _432);
    float _860 = fma(_826, _844, _434);
    bool _862 = _856 >= 32768;
    int _864 = _856 + (-1024);
    int _866 = _864;
    if (_862)
    {
        int _868 = ~_856;
        int _870 = _868 + 33792;
        int _872 = _870 + 1;
        _866 = _872;
    }
    int _874 = _866;
    int _876 = _874 + 30719;
    float _878 = float(_876);
    float _880 = fma(_878, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _882 = abs(_880);
    float _884 = -_882;
    float _886 = _884 + 1.0;
    bool _888 = _880 < 0.0;
    float _890 = float(_888);
    float _892 = abs(_880);
    float _894 = fma(_892, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _896 = as_type<int>(_886) + (-218103808);
    float _898 = abs(_880);
    float _900 = fma(_898, _894, -0.212114393711090087890625);
    bool _902 = uint(_896) >= 1920991232u;
    float _904 = -_430;
    float _906 = _904 + _790;
    float _908 = abs(_880);
    float _910 = fma(_908, _900, 1.570728778839111328125);
    float _912 = fma(_826, _906, _430);
    bool _914 = !_902;
    float _940;
    if (!_914)
    {
        int _916 = as_type<int>(_886);
        int _918 = as_type<int>(_790);
        int _920 = as_type<int>(_792);
        int _922 = 4192;
        int _924 = as_type<int>(_798);
        int _926;
        int _928;
        int _930;
        int _932;
        int _934;
        int _936;
        int _938;
        _87(_916, _918, _920, _922, _924, _926, _928, _930, _932, _934, _936, _938, out.gl_Position, out.gl_PointSize);
        _940 = as_type<float>(_936);
        _942 = true;
    }
    else
    {
        float _944 = rsqrt(_886);
        float _946 = _886 * _944;
        float _948 = _944 * 0.5;
        float _950 = -_946;
        float _952 = 0.0 + _950;
        float _954 = fma(_948, _952, 0.5);
        float _956 = fma(_946, _954, _946);
        float _958 = -_956;
        float _960 = 0.0 + _958;
        float _962 = fma(_956, _960, _886);
        float _964 = fma(_948, _962, _956);
        _940 = _964;
    }
    _942 = false;
    float _966 = _940;
    float _968 = in.m_48.x;
    float _970 = in.m_48.y;
    float _972 = in.m_48.z;
    float _974 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _976 = log2(_974);
    float _978 = _910 * _966;
    bool _980 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _982 = isnan(0.0);
    bool _984 = _980 || _982;
    bool _986 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _988 = _984 || _986;
    float _990 = _878 * 3.883221149444580078125;
    bool _992 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _994 = isnan(1.0);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1000 = _996 || _998;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1004 = 1.0 + _1002;
    float _1006 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _1008 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1010 = _976 * _104;
    float _1012 = 1.0 / _1004;
    float _1014 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1008);
    float _1016 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1018 = _972 * 2.0;
    float _1020 = _968 * 2.0;
    float _1022 = exp2(_1010);
    float _1024 = _970 * 2.0;
    float _1026 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1016);
    float _1028 = floor(_1018);
    float _1030 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1014);
    float _1032 = floor(_1020);
    float _1034 = -_1022;
    float _1036 = _1034 + 1.0;
    float _1038 = _988 ? _1036 : 0.0;
    bool _1040 = _1028 > 0.0;
    float _1042 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    bool _1044 = _1028 >= 0.0;
    bool _1046 = isnan(_1028);
    bool _1048 = _1044 || _1046;
    bool _1050 = isnan(0.0);
    bool _1052 = _1048 || _1050;
    if (_1000)
    {
        float _1054 = _1038 * _1012;
        _114 = _1054;
    }
    float _1056 = _114;
    int _1058 = _1052 ? 0 : 1;
    float _1060 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _1062 = _1032 >= 0.0;
    bool _1064 = isnan(_1032);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan(0.0);
    bool _1070 = _1066 || _1068;
    float _1072 = floor(_1024);
    int _1074 = ~_1058;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    float _1080 = _1060 * _1006;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _1084 = _1082 != 0;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _1088 = _1086 != 0;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _1092 = _1090 != 0;
    float _1094 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    int _1096 = _1078;
    if (!_1040)
    {
        int _1098 = ~_1058;
        int _1100 = _1098 + 1;
        _1096 = _1100;
    }
    int _1102 = _1096;
    float _1104 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[203].x, _1080);
    int _1106 = _1070 ? 0 : 1;
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _1112 = _1110 != 0;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _1116 = _1114 != 0;
    float _1118 = _1094 * _1042;
    bool _1120 = !_1088;
    int _1122 = _1120 ? 0 : 1;
    float _1124 = _970 + _968;
    bool _1126 = _1032 > 0.0;
    float _1128 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1118);
    bool _1130 = !_1084;
    int _1132 = _1130 ? 0 : 1;
    float _1134 = floor(_1104);
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _1138 = _1136 != 0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _1142 = _1140 != 0;
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _1146 = _1144 != 0;
    float _1148 = _1124 + (-1.0);
    int _1150 = ~_1106;
    int _1152 = _1150 + 1;
    int _1154 = _1152 + 1;
    bool _1156 = !_1092;
    int _1158 = _1156 ? 0 : 1;
    float _1160 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1162 = !_1146;
    int _1164 = _1162 ? 0 : 1;
    float _1166 = floor(_1128);
    int _1168 = _1154;
    if (!_1126)
    {
        int _1170 = ~_1106;
        int _1172 = _1170 + 1;
        _1168 = _1172;
    }
    int _1174 = _1168;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1182 = _1180 != 0;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1186 = _1184 != 0;
    float _1188 = _970 + _972;
    float _1190 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _1192 = !_1112;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = -_1134;
    float _1198 = _1104 + _1196;
    float _1200 = _1188 + (-1.0);
    float _1202 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1190);
    bool _1204 = _1072 >= 0.0;
    bool _1206 = isnan(_1072);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan(0.0);
    bool _1212 = _1208 || _1210;
    float _1214 = _1128 + 0.25;
    float _1216 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1218 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1202);
    int _1220 = _1212 ? 0 : 1;
    float _1222 = floor(_1214);
    bool _1224 = _1072 > 0.0;
    float _1226 = _1104 + 0.25;
    bool _1228 = !_1178;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1026);
    float _1234 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _1236 = float(_1102);
    float _1238 = _970 + (-0.5);
    float _1240 = floor(_1226);
    int _1242 = abs(_1230);
    float _1244 = _1234 * _1108;
    int _1246 = ~_1220;
    int _1248 = _1246 + 1;
    int _1250 = _1248 + 1;
    float _1252 = float(_1242);
    float _1254 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[203].z, _1244);
    int _1256 = _1250;
    if (!_1224)
    {
        int _1258 = ~_1220;
        int _1260 = _1258 + 1;
        _1256 = _1260;
    }
    int _1262 = _1256;
    float _1264 = rsqrt(_1232);
    bool _1266 = _1198 >= 0.5;
    bool _1268 = isnan(_1198);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan(0.5);
    bool _1274 = _1270 || _1272;
    float _1276 = _1252 * _1236;
    float _1278 = -_1166;
    float _1280 = _1128 + _1278;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1284 = _1282 != 0;
    bool _1286 = !_1274;
    float _1288 = _1286 ? 0.5 : (-0.5);
    float _1290 = floor(_1254);
    float _1292 = -_1240;
    float _1294 = _1226 + _1292;
    int _1296 = abs(_1122);
    float _1298 = _1104 * 6.283185482025146484375;
    bool _1300 = _1280 >= 0.5;
    bool _1302 = isnan(_1280);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.5);
    bool _1308 = _1304 || _1306;
    float _1310 = -_1222;
    float _1312 = _1214 + _1310;
    int _1314 = abs(_1194);
    float _1316 = _1128 * 6.283185482025146484375;
    float _1318 = _1298 * 0.15915493667125701904296875;
    float _1320 = float(_1296);
    float _1322 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1324 = _1322 * 2.0;
    bool _1326 = !_1308;
    float _1328 = _1326 ? 0.5 : (-0.5);
    float _1330 = _1316 * 0.15915493667125701904296875;
    float _1332 = _1254 + 0.25;
    float _1334 = _1320 * _1324;
    float _1336 = -_1290;
    float _1338 = _1254 + _1336;
    float _1340 = float(_1314);
    float _1342 = floor(_1332);
    bool _1344 = !_1142;
    int _1346 = _1344 ? 0 : 1;
    float _1348 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1350 = _1348 * 2.0;
    bool _1352 = _1338 >= 0.5;
    bool _1354 = isnan(_1338);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan(0.5);
    bool _1360 = _1356 || _1358;
    float _1362 = _1254 * 6.283185482025146484375;
    bool _1364 = !_1284;
    int _1366 = _1364 ? 0 : 1;
    float _1368 = _1340 * _1350;
    int _1370 = abs(_1346);
    float _1372 = _1318 * 6.283185482025146484375;
    float _1374 = sin(_1372);
    bool _1376 = !_1360;
    float _1378 = _1376 ? 0.5 : (-0.5);
    float _1380 = _858 * _1264;
    bool _1382 = _1294 > 0.5;
    int _1384 = abs(_1132);
    int _1386 = abs(_1366);
    float _1388 = _1330 * 6.283185482025146484375;
    float _1390 = sin(_1388);
    float _1392 = -_1342;
    float _1394 = _1332 + _1392;
    float _1396 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1398 = _1396 * 2.0;
    float _1400 = float(_1370);
    float _1402 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1404 = float(_1384);
    float _1406 = _1294;
    float _1408 = _1312;
    float _1410 = _1394;
    if (_1382)
    {
        float _1412 = -_1294;
        float _1414 = _1412 + 1.0;
        _1406 = _1414;
    }
    float _1416 = _1406;
    float _1418 = float(_1386);
    float _1420 = _1400 * _1398;
    float _1422 = _1362 * 0.15915493667125701904296875;
    bool _1424 = _1312 > 0.5;
    float _1426 = fma(_1416, 4.0, -1.0);
    float _1428 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1430 = fma(_1404, _1402, _1334);
    bool _1432 = !_1138;
    int _1434 = _1432 ? 0 : 1;
    float _1436 = _1422 * 6.283185482025146484375;
    float _1438 = sin(_1436);
    float _1440 = fma(_1418, _1428, _1368);
    bool _1442 = !_1116;
    int _1444 = _1442 ? 0 : 1;
    float _1446 = in.m_58.x;
    float _1448 = in.m_58.y;
    float _1450 = in.m_58.z;
    int _1452 = abs(_1158);
    int _1454 = abs(_1434);
    if (_1424)
    {
        float _1456 = -_1312;
        float _1458 = _1456 + 1.0;
        _1408 = _1458;
    }
    float _1460 = _1408;
    bool _1462 = _1394 > 0.5;
    int _1464 = abs(_1444);
    float _1466 = _1426 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1468 = float(_1452);
    float _1470 = fma(_1460, 4.0, -1.0);
    float _1472 = float(_1454);
    float _1474 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    bool _1476 = !_1182;
    int _1478 = _1476 ? 0 : 1;
    float _1480 = fma(_1468, _1466, _1430);
    float _1482 = float(_1464);
    float _1484 = fma(_1472, _1474, _1420);
    float _1486 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    int _1488 = abs(_1164);
    float _1490 = _1276 * (-2.0);
    int _1492 = abs(_1478);
    if (_1462)
    {
        float _1494 = -_1394;
        float _1496 = _1494 + 1.0;
        _1410 = _1496;
    }
    float _1498 = _1410;
    float _1500 = fma(_1482, _1486, _1440);
    float _1502 = fma(_1480, 3.1415927410125732421875, _1446);
    float _1504 = float(_1174);
    float _1506 = fma(_1160, _1490, _1160);
    float _1508 = fma(_1502, _1490, _1502);
    float _1510 = float(_1492);
    float _1512 = fma(_1498, 4.0, -1.0);
    float _1514 = _968 + (-0.5);
    float _1516 = float(_1488);
    float _1518 = fma(_1500, 3.1415927410125732421875, _1448);
    float _1520 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1522 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1508);
    float _1524 = _1510 * _1504;
    bool _1526 = !_1186;
    int _1528 = _1526 ? 0 : 1;
    float _1530 = fma(_1516, _1520, _1484);
    float _1532 = fma(_1506, _1056, _1522);
    float _1534 = _1524 * (-2.0);
    int _1536 = abs(_1528);
    float _1538 = rsqrt(_1218);
    float _1540 = float(_1262);
    float _1542 = fma(_1518, _1534, _1518);
    float _1544 = float(_1536);
    float _1546 = fma(_1216, _1534, _1216);
    float _1548 = in.m_52.x;
    float _1550 = in.m_52.y;
    float _1552 = in.m_52.z;
    float _1554 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1542);
    float _1556 = _968 + _972;
    float _1558 = _1544 * _1540;
    float _1560 = rsqrt(_1030);
    float _1562 = fma(_1546, _1056, _1554);
    float _1564 = fma(_1530, 3.1415927410125732421875, _1450);
    float _1566 = _1556 + (-1.0);
    float _1568 = _1558 * (-2.0);
    float _1570 = _1562 * 0.15915493667125701904296875;
    float _1572 = _972 + (-0.5);
    float _1574 = _1532 * 0.15915493667125701904296875;
    float _1576 = sqrt(_1030);
    float _1578 = fma(_1564, _1568, _1564);
    float _1580 = _860 * _1538;
    float _1582 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1584 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1578);
    float _1586 = _1574 * 6.283185482025146484375;
    float _1588 = sin(_1586);
    float _1590 = _912 * _1560;
    float _1592 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1594 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1596 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1598 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1600 = _1574 * 6.283185482025146484375;
    float _1602 = cos(_1600);
    float _1604 = _1576 * _1580;
    float _1606 = fma(_1596, _1568, _1596);
    float _1608 = _1576 * _1590;
    float _1610 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1612 = _1592 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1614 = fma(_1606, _1056, _1584);
    float _1616 = _890 * 2.0;
    float _1618 = _1570 * 6.283185482025146484375;
    float _1620 = sin(_1618);
    float _1622 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1608);
    float _1624 = _1614 * 0.15915493667125701904296875;
    float _1626 = _1576 * _1380;
    float _1628 = _1598 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1604);
    float _1632 = _1610 * _1622;
    float _1634 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1626);
    float _1636 = _1570 * 6.283185482025146484375;
    float _1638 = cos(_1636);
    float _1640 = _1628 * _1630;
    bool _1642 = _1626 != 0.0;
    bool _1644 = isnan(_1626);
    bool _1646 = _1642 || _1644;
    bool _1648 = isnan(0.0);
    bool _1650 = _1646 || _1648;
    float _1652 = _1612 * _1634;
    bool _1654 = _1608 == 0.0;
    bool _1656 = !_1650;
    bool _1658 = _1654 && _1656;
    float _1660 = _1624 * 6.283185482025146484375;
    float _1662 = cos(_1660);
    float _1664 = -_1616;
    float _1666 = fma(_978, _1664, _978);
    float _1668 = _1588 * _1620;
    bool _1670 = _1604 == 0.0;
    bool _1672 = _1670 && _1658;
    float _1674 = fma(_890, 3.1415927410125732421875, _1666);
    float _1676 = _1624 * 6.283185482025146484375;
    float _1678 = sin(_1676);
    float _1680 = _1602 * _1638;
    float _1682 = _1588 * _1638;
    float _1684 = _1602 * _1662;
    float _1686 = _1638 * _1662;
    float _1688 = _1602 * _1620;
    float _1690 = _1588 * _1662;
    float _1692 = _1620 * _1662;
    float _1694 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1696 = _1690 * _1652;
    float _1698 = fma(_1678, _1680, _1668);
    float _1700 = fma(_1678, _1668, _1680);
    float _1702 = -_1688;
    float _1704 = fma(_1678, _1682, _1702);
    float _1706 = -_1682;
    float _1708 = fma(_1678, _1688, _1706);
    float _1710 = _1684 * _1652;
    float _1712 = -_1652;
    float _1714 = _1678 * _1712;
    float _1716 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1694);
    float _1718 = fma(_1698, _1632, _1710);
    float _1720 = fma(_1686, _1632, _1714);
    float _1722 = fma(_1704, _1632, _1696);
    float _1724 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1726 = fma(_1708, _1640, _1718);
    float _1728 = fma(_1692, _1640, _1720);
    float _1730 = fma(_1700, _1640, _1722);
    float _1732 = _990 * 0.15915493667125701904296875;
    float _1734 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1724);
    float _1736 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1738 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1740 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1716);
    float _1742 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1734);
    float _1744 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1736);
    float _1746 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1738);
    float _1748 = _1740 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1750 = _1742 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1752 = fma(_1730, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1744);
    float _1754 = fma(_1730, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1746);
    float _1756 = _1674 * 0.15915493667125701904296875;
    float _1758 = _1732 * 6.283185482025146484375;
    float _1760 = cos(_1758);
    float _1762 = _1748 + _1752;
    float _1764 = _1750 + _1754;
    float _1766 = -_694;
    float _1768 = _1766 + _880;
    float _1770 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1582);
    float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1774 = _1762 + _1772;
    float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1778 = _1764 + _1776;
    float _1780 = _1732 * 6.283185482025146484375;
    float _1782 = sin(_1780);
    float _1784 = _1774 * _1774;
    float _1786 = _1778 * _1778;
    float _1788 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1770);
    float _1790 = _1784 + _1786;
    float _1792 = _1756 * 6.283185482025146484375;
    float _1794 = sin(_1792);
    float _1796 = sqrt(_1790);
    float _1798 = -_832;
    float _1800 = fma(_1794, _1760, _1798);
    float _1802 = -_834;
    float _1804 = fma(_1794, _1782, _1802);
    float _1806 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1808 = fma(_826, _1768, _694);
    float _1810 = fma(_826, _1800, _832);
    float _1812 = fma(_826, _1804, _834);
    float _1814 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1806);
    float _1816 = _1808;
    float _1818 = _1810;
    float _1820 = _1812;
    float _1822 = _1626;
    float _1824 = _1678;
    float _1826 = _1788;
    float _1828 = _1604;
    if (!_1672)
    {
        float _1830 = fma(_1626, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1808);
        _1816 = _1830;
    }
    float _1832 = _1816;
    bool _1834 = _1796 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    if (!_1672)
    {
        float _1836 = fma(_1608, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1810);
        _1818 = _1836;
    }
    float _1838 = _1818;
    float _1840 = fma(_1730, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1814);
    float _1842 = _1788 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (!_1672)
    {
        float _1844 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1812);
        _1820 = _1844;
    }
    float _1846 = _1820;
    float _1848 = -_1832;
    float _1850 = _1678 * _1848;
    float _1852 = _1684 * _1832;
    float _1854 = _1842 + _1840;
    float _1856 = _1690 * _1832;
    if (!_1834)
    {
        _1822 = _1786;
    }
    float _1858 = _1822;
    float _1860 = _1858;
    if (!_1834)
    {
        _1824 = _1784;
    }
    float _1862 = _1824;
    float _1864 = _1862;
    if (!_1834)
    {
        _284 = _1762;
    }
    float _1866 = _284;
    float _1868 = _1866;
    if (!_1834)
    {
        _1826 = _1764;
    }
    float _1870 = _1826;
    float _1872 = _1870;
    if (!_1834)
    {
        _1828 = _1854;
    }
    float _1874 = _1828;
    bool _1876 = !_1834;
    float _1878 = _1874;
    if (!_1876)
    {
        float _1880 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1884 = _1796 + _1882;
        float _1886 = rsqrt(_1790);
        float _1888 = _1884 * _1880;
        float _1890 = _1854 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1892 = _1888 * 0.15915493667125701904296875;
        float _1894 = _1892 * 6.283185482025146484375;
        float _1896 = sin(_1894);
        float _1898 = _1892 * 6.283185482025146484375;
        float _1900 = cos(_1898);
        float _1902 = fma(_1896, _1890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1904 = _1886 * _1902;
        float _1906 = _1900 + (-1.0);
        float _1908 = _1774 * _1904;
        float _1910 = _1778 * _1904;
        float _1912 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1914 = _1908 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1916 = _1910 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1918 = _1908 * _1908;
        float _1920 = fma(_1854, _1900, _1912);
        float _1922 = _1910 * _1910;
        _1878 = _1920;
        _1864 = _1918;
        _1860 = _1922;
        _1868 = _1914;
        _1872 = _1916;
    }
    float _1924 = _1878;
    float _1926 = _1864;
    float _1928 = _1860;
    float _1930 = _1868;
    float _1932 = _1872;
    float _1934 = in.m_60.x;
    float _1936 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1938 = _1924 + _1936;
    float _1940 = fma(_1698, _1838, _1852);
    float _1942 = fma(_1686, _1838, _1850);
    float _1944 = in.m_60.y;
    float _1946 = fma(_1938, _1938, _1926);
    float _1948 = fma(_1708, _1846, _1940);
    float _1950 = fma(_1704, _1838, _1856);
    float _1952 = fma(_1692, _1846, _1942);
    float _1954 = _1946 + _1928;
    float _1956 = _1948 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1958 = _1948 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1960 = _1948 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1962 = fma(_1700, _1846, _1950);
    float _1964 = fma(_1952, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1956);
    float _1966 = sqrt(_1954);
    float _1968 = fma(_1952, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1958);
    float _1970 = fma(_1952, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1960);
    float _1972 = fma(_1962, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1964);
    float _1974 = fma(_1962, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1968);
    float _1976 = fma(_1962, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1970);
    out.m_62.x = _1934;
    out.m_62.y = _1944;
    bool _1978 = _1966 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1980 = isnan(_1966);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1986 = _1982 || _1984;
    out.m_64.x = _1974;
    out.m_64.y = _1972;
    out.m_64.z = _1976;
    float _1988 = _1954;
    if (!_1986)
    {
        _1988 = 1.0;
    }
    float _1990 = _1988;
    bool _1992 = !_1986;
    float _1994 = _1990;
    if (!_1992)
    {
        bool _1996 = _1966 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1998 = isnan(_1966);
        bool _2000 = _1996 || _1998;
        bool _2002 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2004 = _2000 || _2002;
        if (!_2004)
        {
            float _2006 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2008 = _1966 + _2006;
            float _2010 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2012 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2010;
            float _2014 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2016 = _2014 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2018 = 1.0 / _2012;
            float _2020 = _2008 * _2018;
            float _2022 = fma(_2020, _2016, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1994 = _2022;
            _2024 = true;
        }
        else
        {
            bool _2026 = _1966 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2028 = isnan(_1966);
            bool _2030 = _2026 || _2028;
            bool _2032 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2034 = _2030 || _2032;
            if (!_2034)
            {
                float _2036 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2038 = _1966 + _2036;
                float _2040 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2042 = _2040 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2044 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2046 = _2044 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2048 = 1.0 / _2042;
                float _2050 = _2038 * _2048;
                float _2052 = fma(_2050, _2046, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1994 = _2052;
                _2024 = true;
            }
            else
            {
                _1994 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2024 = false;
    float _2054 = _1994;
    float _2056 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2058 = _1924 + _2056;
    float _2060 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2062 = _1930 + _2060;
    float _2064 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2066 = _1932 + _2064;
    out.m_66.x = _1748;
    out.m_66.y = _1842;
    out.m_66.z = _1750;
    float _2068 = fma(_2058, _2054, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2070 = fma(_2062, _2054, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2072 = fma(_2066, _2054, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2074 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2076 = _2068 + _2074;
    float _2078 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2080 = _2070 + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2084 = _2072 + _2082;
    float _2086 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2088 = _2076 * _2076;
    float _2090 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    out.m_68.x = _2070;
    out.m_68.y = _2068;
    out.m_68.z = _2072;
    float _2092 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2086);
    float _2094 = fma(_2080, _2080, _2088);
    float _2096 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2098 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2090);
    float _2100 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2092);
    float _2102 = fma(_2084, _2084, _2094);
    float _2104 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2106 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2096);
    float _2108 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2098);
    float _2110 = _2100 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2112 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2104);
    float _2114 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2106);
    float _2116 = _2108 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2118 = sqrt(_2102);
    float _2120 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2112);
    float _2122 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2124 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2126 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2128 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2130 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2132 = _2120 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2134 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2124);
    float _2136 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2126);
    float _2138 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2128);
    float _2140 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2130);
    float _2142 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2134);
    float _2144 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2136);
    float _2146 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2138);
    float _2148 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2140);
    float _2150 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2142);
    float _2152 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2144);
    float _2154 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2146);
    float _2156 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2148);
    bool _2158 = _2118 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2160 = isnan(_2118);
    bool _2162 = _2158 || _2160;
    bool _2164 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2166 = _2162 || _2164;
    out.gl_Position.x = _2150;
    out.gl_Position.y = _2152;
    out.gl_Position.z = _2154;
    out.gl_Position.w = _2156;
    float _2168 = _2146;
    float _2170 = _2144;
    float _2172 = _2142;
    float _2174 = _2132;
    float _2176 = _2116;
    float _2178 = _2122;
    if (!_2166)
    {
        _2168 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2180 = _2168;
    float _2182 = _2180;
    float _2184 = _2180;
    if (!_2166)
    {
        _2170 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2186 = _2170;
    float _2188 = _2186;
    float _2190 = _2186;
    if (!_2166)
    {
        _2172 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2192 = _2172;
    float _2194 = _2192;
    float _2196 = _2192;
    if (!_2166)
    {
        _2174 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2198 = _2174;
    float _2200 = _2198;
    float _2202 = _2198;
    if (!_2166)
    {
        _2176 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2204 = _2176;
    float _2206 = _2204;
    float _2208 = _2204;
    if (!_2166)
    {
        _2178 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2210 = _2178;
    bool _2212 = !_2166;
    float _2214 = _2210;
    float _2216 = _2210;
    if (!_2212)
    {
        bool _2218 = _2118 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2220 = isnan(_2118);
        bool _2222 = _2218 || _2220;
        bool _2224 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2226 = _2222 || _2224;
        if (!_2226)
        {
            float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2230 = _2118 + _2228;
            float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2234 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2232;
            float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2238 = _2236 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2242 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2244 = 1.0 / _2234;
            float _2246 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2248 = _2246 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2252 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2254 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2256 = _2254 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2258 = _2230 * _2244;
            float _2260 = precise::clamp(_2258, 0.0, 1.0);
            float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2264 = _2262 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2266 = fma(_2260, _2238, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2268 = fma(_2260, _2242, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2270 = fma(_2260, _2248, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2272 = fma(_2260, _2264, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2274 = fma(_2260, _2252, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2276 = fma(_2260, _2256, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2208 = _2268;
            _2190 = _2274;
            _2202 = _2266;
            _2184 = _2272;
            _2216 = _2270;
            _2196 = _2276;
            _2278 = true;
        }
        else
        {
            bool _2280 = _2118 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2282 = isnan(_2118);
            bool _2284 = _2280 || _2282;
            bool _2286 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2288 = _2284 || _2286;
            if (!_2288)
            {
                _2182 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2290 = _2182;
            _2184 = _2290;
            if (!_2288)
            {
                _2188 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2292 = _2188;
            _2190 = _2292;
            if (!_2288)
            {
                _2194 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2294 = _2194;
            _2196 = _2294;
            if (!_2288)
            {
                _2200 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2296 = _2200;
            _2202 = _2296;
            if (!_2288)
            {
                _2206 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2298 = _2206;
            _2208 = _2298;
            if (!_2288)
            {
                _2214 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2300 = _2214;
            bool _2302 = !_2288;
            _2216 = _2300;
            if (!_2302)
            {
                bool _2304 = _2118 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2306 = isnan(_2118);
                bool _2308 = _2304 || _2306;
                bool _2310 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2312 = _2308 || _2310;
                if (!_2312)
                {
                    float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2316 = _2118 + _2314;
                    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2320 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2318;
                    float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2324 = _2322 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2328 = _2326 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2330 = 1.0 / _2320;
                    float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2334 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2336 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2338 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2344 = _2316 * _2330;
                    float _2346 = precise::clamp(_2344, 0.0, 1.0);
                    float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2352 = fma(_2346, _2324, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2354 = fma(_2346, _2328, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2356 = fma(_2346, _2334, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2358 = fma(_2346, _2350, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2360 = fma(_2346, _2338, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2362 = fma(_2346, _2342, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2208 = _2354;
                    _2190 = _2360;
                    _2202 = _2352;
                    _2184 = _2358;
                    _2216 = _2356;
                    _2196 = _2362;
                    _2278 = true;
                }
                else
                {
                    _2208 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2190 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2202 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2184 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2216 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2196 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2278 = false;
    float _2364 = _2208;
    float _2366 = _2190;
    float _2368 = _2202;
    float _2370 = _2184;
    float _2372 = _2216;
    float _2374 = _2196;
    float _2376 = fma(_1972, -0.5, 0.5);
    float _2378 = precise::clamp(_2376, 0.0, 1.0);
    float _2380 = -_2364;
    float _2382 = _2366 + _2380;
    float _2384 = -_2368;
    float _2386 = _2370 + _2384;
    float _2388 = -_2372;
    float _2390 = _2374 + _2388;
    bool _2392 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2394 = fma(_2378, _2382, _2364);
    float _2396 = fma(_2378, _2386, _2368);
    float _2398 = fma(_2378, _2390, _2372);
    float _2400 = _2394 * 0.586610972881317138671875;
    out.m_46.x = 1.0;
    float _2402 = fma(_2396, 0.298911988735198974609375, _2400);
    out.m_70.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2404 = fma(_2398, 0.114477999508380889892578125, _2402);
    float _2406 = -_2404;
    float _2408 = _2396 + _2406;
    float _2410 = -_2404;
    float _2412 = _2394 + _2410;
    float _2414 = -_2404;
    float _2416 = _2398 + _2414;
    out.m_72.x = 0.0;
    float _2418 = fma(_2408, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2404);
    float _2420 = fma(_2412, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2404);
    float _2422 = fma(_2416, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2404);
    out.m_74.x = _2418;
    out.m_74.y = _2420;
    out.m_74.z = _2422;
    if (!_2392)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2424 = -_2068;
    float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2428 = -_2070;
    float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2432 = -_2072;
    float _2434 = _2432 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2436 = _2426 * _2426;
    float _2438 = fma(_2430, _2430, _2436);
    float _2440 = fma(_2434, _2434, _2438);
    float _2442 = sqrt(_2440);
    float _2444 = rsqrt(_2440);
    float _2446 = -_2442;
    float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2450 = _2448 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2452 = precise::clamp(_2450, 0.0, 1.0);
    float _2454 = _2430 * _2444;
    float _2456 = _2426 * _2444;
    float _2458 = abs(_2452);
    float _2460 = log2(_2458);
    float _2462 = _2434 * _2444;
    float _2464 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2466 = _1972 * _2456;
    float _2468 = -_2456;
    float _2470 = -_2464;
    float _2472 = fma(_2468, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2470);
    float _2474 = fma(_1974, _2454, _2466);
    float _2476 = -_2462;
    float _2478 = fma(_2476, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2472);
    float _2480 = fma(_1976, _2462, _2474);
    float _2482 = precise::clamp(_2480, 0.0, 1.0);
    float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2486 = _2478 + _2484;
    float _2488 = _2460 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2490 = _2486 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2492 = precise::clamp(_2490, 0.0, 1.0);
    float _2494 = exp2(_2488);
    float _2496 = _2494 * _2492;
    float _2498 = _2482 * _2496;
    float _2500 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2502 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2504 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_72.x = _2500;
    out.m_72.y = _2502;
    out.m_72.z = _2504;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_44.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_44.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_44.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_44.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

